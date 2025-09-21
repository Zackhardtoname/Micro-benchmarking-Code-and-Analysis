#include <iostream>
#include <chrono>
#include <vector>
#include <random>
#include <iomanip>
#include <cassert>

// Polynomial constant for 64-bit LFSR
static const uint64_t POLY64 = 0x42F0E1EBA9EA3693ULL;

// Branch-free implementation
uint64_t increment_branch_free(uint64_t x) {
    return (x << 1) ^ (((int64_t)x >> 63) & POLY64);
}

// Branched implementation
uint64_t increment_branched(uint64_t x) {
    if (x & 0x8000000000000000ULL) {
        return (x << 1) ^ POLY64;
    } else {
        return x << 1;
    }
}

// Benchmark helper class
class Benchmark {
public:
    static constexpr size_t ITERATIONS = 100000000; // 100M iterations
    static constexpr size_t WARMUP_ITERATIONS = 1000000; // 1M warmup
    static constexpr size_t NUM_RUNS = 5;

    template<typename Func>
    static double benchmark_function(Func func, const std::vector<uint64_t>& test_values) {
        // Warmup
        volatile uint64_t dummy = 0;
        for (size_t i = 0; i < WARMUP_ITERATIONS; ++i) {
            dummy += func(test_values[i % test_values.size()]);
        }

        // Actual benchmark
        auto start = std::chrono::high_resolution_clock::now();
        
        volatile uint64_t result = 0;
        for (size_t i = 0; i < ITERATIONS; ++i) {
            result += func(test_values[i % test_values.size()]);
        }
        
        auto end = std::chrono::high_resolution_clock::now();
        
        // Use result to prevent optimization
        dummy += result;
        
        auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
        return duration.count() / static_cast<double>(ITERATIONS);
    }
};

// Test correctness of both implementations
void test_correctness() {
    std::cout << "Testing correctness...\n";
    
    // Test with various starting values
    std::vector<uint64_t> test_cases = {
        1ULL,
        0x8000000000000000ULL,  // High bit set
        0x7FFFFFFFFFFFFFFFULL,  // High bit not set
        0xAAAAAAAAAAAAAAAAULL,
        0x5555555555555555ULL,
        0xDEADBEEFCAFEBABEULL
    };
    
    for (uint64_t start_val : test_cases) {
        uint64_t x1 = start_val;
        uint64_t x2 = start_val;
        
        // Run both implementations for several steps
        for (int i = 0; i < 1000; ++i) {
            x1 = increment_branch_free(x1);
            x2 = increment_branched(x2);
            
            if (x1 != x2) {
                std::cerr << "Mismatch at iteration " << i 
                         << " with start value 0x" << std::hex << start_val << std::dec
                         << ": branch_free=0x" << std::hex << x1 
                         << ", branched=0x" << x2 << std::dec << std::endl;
                exit(1);
            }
        }
    }
    
    std::cout << "✓ Correctness test passed!\n\n";
}

// Demonstrate the LFSR cycle properties
void demonstrate_cycle() {
    std::cout << "Demonstrating LFSR cycle properties:\n";
    
    uint64_t x = 1;
    std::cout << "First 10 values starting from 1:\n";
    for (int i = 0; i < 10; ++i) {
        std::cout << "  " << std::setw(2) << i << ": 0x" 
                 << std::hex << std::setw(16) << std::setfill('0') << x << std::dec << std::endl;
        x = increment_branch_free(x);
    }
    
    // Test that 0 maps to itself (degenerate case)
    uint64_t zero = 0;
    uint64_t zero_result = increment_branch_free(zero);
    std::cout << "\n0 -> 0x" << std::hex << zero_result << std::dec 
              << " (should be 0 - degenerate case)\n\n";
}

int main() {
    std::cout << "RPCID Generator Benchmark\n";
    std::cout << "========================\n\n";
    
    // Test correctness first
    test_correctness();
    
    // Demonstrate cycle properties
    demonstrate_cycle();
    
    // Generate test data
    std::random_device rd;
    std::mt19937_64 gen(rd());
    std::uniform_int_distribution<uint64_t> dis;
    
    std::vector<uint64_t> test_values;
    test_values.reserve(10000);
    for (size_t i = 0; i < 10000; ++i) {
        uint64_t val = dis(gen);
        if (val == 0) val = 1; // Avoid the degenerate case
        test_values.push_back(val);
    }
    
    std::cout << "Running benchmarks with " << Benchmark::ITERATIONS << " iterations...\n";
    std::cout << "Each test repeated " << Benchmark::NUM_RUNS << " times\n\n";
    
    // Run benchmarks multiple times and take the best result
    double best_branch_free = std::numeric_limits<double>::max();
    double best_branched = std::numeric_limits<double>::max();
    
    for (size_t run = 0; run < Benchmark::NUM_RUNS; ++run) {
        std::cout << "Run " << (run + 1) << "/" << Benchmark::NUM_RUNS << ":\n";
        
        double time_branch_free = Benchmark::benchmark_function(increment_branch_free, test_values);
        double time_branched = Benchmark::benchmark_function(increment_branched, test_values);
        
        best_branch_free = std::min(best_branch_free, time_branch_free);
        best_branched = std::min(best_branched, time_branched);
        
        std::cout << "  Branch-free: " << std::fixed << std::setprecision(3) 
                 << time_branch_free << " ns/op\n";
        std::cout << "  Branched:    " << std::fixed << std::setprecision(3) 
                 << time_branched << " ns/op\n";
        std::cout << "  Speedup:     " << std::fixed << std::setprecision(2) 
                 << (time_branched / time_branch_free) << "x\n\n";
    }
    
    std::cout << "Best Results:\n";
    std::cout << "=============\n";
    std::cout << "Branch-free: " << std::fixed << std::setprecision(3) 
             << best_branch_free << " ns/op\n";
    std::cout << "Branched:    " << std::fixed << std::setprecision(3) 
             << best_branched << " ns/op\n";
    std::cout << "Speedup:     " << std::fixed << std::setprecision(2) 
             << (best_branched / best_branch_free) << "x\n";
    
    // Calculate throughput
    double ops_per_sec_bf = 1e9 / best_branch_free;
    double ops_per_sec_br = 1e9 / best_branched;
    
    std::cout << "\nThroughput:\n";
    std::cout << "Branch-free: " << std::scientific << std::setprecision(2) 
             << ops_per_sec_bf << " ops/sec\n";
    std::cout << "Branched:    " << std::scientific << std::setprecision(2) 
             << ops_per_sec_br << " ops/sec\n";
    
    return 0;
}
