// 15.1 Given an array of 20-bit timestamps and a starting full 64-bit timestamp, build a small routine to extend the 20-bit timestamps to 64 bits.
// Actually the truncation process doesn't really work trivially in Python because the ints are signed so 
#include <iostream>
#include <vector>
#include <chrono>
#include <cstdint>
#include <iomanip>

// Helper to get raw high-resolution timestamp (in "counts" — platform-dependent units)
inline uint64_t now_counter() {
    return std::chrono::high_resolution_clock::now()
               .time_since_epoch()
               .count();
}

// Student function to reconstruct 64-bit timestamps from 20-bit truncated values
std::vector<uint64_t> student_convert_to_64(
    const std::vector<uint32_t>& truncated_ts_list,
    uint64_t start_ref
) {
    std::vector<uint64_t> reconstructed;
    reconstructed.reserve(truncated_ts_list.size());

    // Core logic begins
    // According to page 233, we can trust that there’s either no or only one wrap around, for all the timestamps we got between interrupts.
    // Note that these are counts from `std::chrono::high_resolution_clock::now().time_since_epoch().count()` from some timer and not from the epoch.
    uint64_t last_20_bits_mask = (1u << 20) - 1;
    uint64_t start_last_20_bits = start_ref & last_20_bits_mask;
    uint64_t base = start_ref - start_last_20_bits;
    bool has_wrapped = false;

    for (uint32_t last_20_bits : truncated_ts_list) {
        if (!has_wrapped && last_20_bits < start_last_20_bits) {
            base += (1u << 20);
            has_wrapped = true;
        }
        reconstructed.push_back(base + last_20_bits);
    }

    // Core logic ends

    return reconstructed;
}

int main() {
    using namespace std;

    // Step 1: Take the current time as 64-bit integer (in raw clock ticks)
    uint64_t start = now_counter();
    cout << "Start timestamp (64-bit): " << start << "\n";

    // Step 2: Collect 20 timestamps
    vector<uint64_t> answer;
    answer.reserve(20);
    for (int i = 0; i < 20; ++i) {
        answer.push_back(now_counter());
    }

    // Step 3: Truncate each timestamp into 20-bit timestamps
    vector<uint32_t> truncated;
    truncated.reserve(answer.size());
    for (auto ts : answer) {
        truncated.push_back(static_cast<uint32_t>(ts & ((1u << 20) - 1)));
    }

    // Step 4: Reconstruct timestamps (placeholder)
    auto student_output = student_convert_to_64(truncated, start);

    // Step 5: Compare for correctness
    bool all_match = true;
    for (size_t i = 0; i < answer.size(); ++i) {
        if (answer[i] != student_output[i]) {
            all_match = false;
            cout << "#" << setw(2) << i + 1
                 << " | Original: " << answer[i]
                 << " | Truncated: " << truncated[i]
                 << " | Reconstructed: " << student_output[i]
                 << "\n";
        }
    }

    if (all_match)
        cout << "All matches!\n";
    else
        cout << "Some matches failed!\n";

    return 0;
}
