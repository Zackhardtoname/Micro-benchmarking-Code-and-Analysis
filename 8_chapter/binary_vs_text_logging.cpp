#include <iostream>
#include <fstream>
#include <chrono>
#include <cstring>
#include <ctime>
#include <sys/time.h>
#include <unistd.h>

// Binary log record structure
struct BinaryLogRecord {
    uint64_t timestamp;
    uint32_t thread_id;
    uint32_t operation_id;
    uint64_t user_id;
    uint32_t status_code;
    uint32_t duration_us;
    char data[96]; // Padding to make exactly 128 bytes
    
    BinaryLogRecord() {
        struct timeval tv;
        gettimeofday(&tv, nullptr);
        timestamp = tv.tv_sec * 1000000ULL + tv.tv_usec;
        thread_id = getpid();
        operation_id = rand();
        user_id = rand() * 1000ULL;
        status_code = 200;
        duration_us = rand() % 1000;
        memset(data, 'X', 96); // Fill with dummy data
    }
};

class LoggingBenchmark {
private:
    std::ofstream binary_file;
    std::ofstream text_file;
    
public:
    LoggingBenchmark() {
        binary_file.open("binary_log.bin", std::ios::binary | std::ios::out);
        text_file.open("text_log.txt", std::ios::out);
        
        if (!binary_file || !text_file) {
            throw std::runtime_error("Failed to open log files");
        }
    }
    
    ~LoggingBenchmark() {
        binary_file.close();
        text_file.close();
        // Clean up test files
        unlink("binary_log.bin");
        unlink("text_log.txt");
    }
    
    // Binary logging - direct write of struct
    void write_binary_log() {
        BinaryLogRecord record;
        binary_file.write(reinterpret_cast<const char*>(&record), sizeof(record));
        // binary_file.flush(); // Ensure it's written (simulate fsync behavior)
    }
    
    // Text logging - format and write as text
    void write_text_log() {
        struct timeval tv;
        gettimeofday(&tv, nullptr);
        
        // Convert timestamp to readable format
        time_t seconds = tv.tv_sec;
        char* time_str = ctime(&seconds);
        // Remove newline from ctime output
        time_str[strlen(time_str) - 1] = '\0';
        
        // Format the log record (ensuring exactly 128 bytes)
        char log_buffer[129]; // 128 + null terminator
        snprintf(log_buffer, sizeof(log_buffer),
                "%-24s PID=%d OP=%08x USER=%lu STATUS=%d DUR=%dus DATA=%48s\n",
                time_str,
                getpid(),
                (unsigned int)rand(),
                (unsigned long)(rand() * 1000ULL),
                200,
                rand() % 1000,
                "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        
        // Ensure exactly 128 bytes by padding or truncating
        log_buffer[128] = '\0';
        for (int i = strlen(log_buffer); i < 128; i++) {
            log_buffer[i] = ' ';
        }
        log_buffer[128] = '\0';
        
        text_file.write(log_buffer, 128);
        // text_file.flush(); // Ensure it's written (simulate fsync behavior)
    }
    
    void benchmark_binary(int iterations) {
        auto start = std::chrono::high_resolution_clock::now();
        
        for (int i = 0; i < iterations; i++) {
            write_binary_log();
        }
        
        auto end = std::chrono::high_resolution_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
        
        double avg_time_us = static_cast<double>(duration.count()) / iterations;
        double throughput_mb = (iterations * 128.0) / (duration.count() / 1e6) / (1024 * 1024);
        
        std::cout << "Binary Logging Results:" << std::endl;
        std::cout << "  Total time: " << duration.count() << " μs" << std::endl;
        std::cout << "  Average per write: " << avg_time_us << " μs" << std::endl;
        std::cout << "  Throughput: " << throughput_mb << " MB/s" << std::endl;
        std::cout << "  Writes per second: " << (iterations * 1e6) / duration.count() << std::endl;
    }
    
    void benchmark_text(int iterations) {
        auto start = std::chrono::high_resolution_clock::now();
        
        for (int i = 0; i < iterations; i++) {
            write_text_log();
        }
        
        auto end = std::chrono::high_resolution_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
        
        double avg_time_us = static_cast<double>(duration.count()) / iterations;
        double throughput_mb = (iterations * 128.0) / (duration.count() / 1e6) / (1024 * 1024);
        double slowdown = avg_time_us; // Will divide by binary time later
        
        std::cout << "Text Logging Results:" << std::endl;
        std::cout << "  Total time: " << duration.count() << " μs" << std::endl;
        std::cout << "  Average per write: " << avg_time_us << " μs" << std::endl;
        std::cout << "  Throughput: " << throughput_mb << " MB/s" << std::endl;
        std::cout << "  Writes per second: " << (iterations * 1e6) / duration.count() << std::endl;
    }
};

int main() {
    const int iterations = 20000; // Match the paper's test case
    
    std::cout << "Logging Benchmark - " << iterations << " writes of 128-byte records" << std::endl;
    std::cout << "=========================================================" << std::endl;
    
    try {
        LoggingBenchmark benchmark;
        
        // Warm up
        std::cout << "Warming up..." << std::endl;
        for (int i = 0; i < 1000; i++) {
            benchmark.write_binary_log();
            benchmark.write_text_log();
        }
        
        std::cout << "\nRunning benchmarks..." << std::endl;
        
        // Benchmark binary logging
        std::cout << "\n1. Binary Logging:" << std::endl;
        benchmark.benchmark_binary(iterations);
        
        // Benchmark text logging  
        std::cout << "\n2. Text Logging:" << std::endl;
        benchmark.benchmark_text(iterations);
        
        std::cout << "\nNote: Results may vary significantly based on:" << std::endl;
        std::cout << "  - Storage type (SSD vs HDD)" << std::endl;
        std::cout << "  - File system caching" << std::endl;
        std::cout << "  - System load" << std::endl;
        std::cout << "  - Compiler optimizations" << std::endl;
        
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}
