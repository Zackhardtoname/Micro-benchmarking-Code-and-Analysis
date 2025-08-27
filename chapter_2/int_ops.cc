// Despite using gcc -O2 -fno-tree-reassoc, the compiler still optimizes the addition and subtraction into mulplication.
// micro-benchmarking is easier when you write redundant simple stupid code I guess.
// At some point, it's almost easier to micro-benchmark by writing assembly code.
 
#include <cstdint>
#include <cstdio>
#include <ctime>
#include "timecounters.h"

static const int kIterations = 100 * 1000000;

// Template benchmark: Op is deduced from the lambda type (unique type per lambda)
template <typename Op>
void run_benchmark(const char* name, Op op,
                   int incr0, int incr1, int incr2, int incr3, int incr4) {
  uint64_t res = 1;

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; ++i) {
    op(res, incr0);
    op(res, incr1);
    op(res, incr2);
    op(res, incr3);
  }
  int64_t elapsed = GetCycles() - startcy;
  double felapsed = static_cast<double>(elapsed);

  int64_t another_startcy = GetCycles();
  for (int i = 0; i < kIterations; ++i) {
    op(res, incr0);
    op(res, incr1);
    op(res, incr2);
    op(res, incr3);
    op(res, incr4);
  }
  int64_t another_elapsed = GetCycles() - another_startcy;
  double another_felapsed = static_cast<double>(another_elapsed);

  fprintf(stdout, "[%s] %d iterations, %lld cycles, %4.2f cycles/iteration\n",
          name, kIterations, (long long)elapsed,
          (another_felapsed - felapsed) / kIterations);

  // Keep res alive / observable to the optimizer
  fprintf(stdout, "[%s] final values: %llu %llu\n",
          name, (unsigned long long)time(NULL), (unsigned long long)res);
}

int main() {
  time_t t = time(nullptr);    // a value compiler cannot predict
  volatile int incr0 = t & 255;
  t = time(nullptr);
  volatile int incr1 = t & 255;
  t = time(nullptr);
  volatile int incr2 = t & 255;
  t = time(nullptr);
  volatile int incr3 = t & 255;
  t = time(nullptr);
  volatile int incr4 = t & 255;

  // Pass captureless lambdas. Each lambda has a unique type so the compiler
  // can inline its body into run_benchmark.
  run_benchmark("Addition",
                [](uint64_t& x, int y) noexcept { x += y; },
                incr0, incr1, incr2, incr3, incr4);

  run_benchmark("Subtraction",
                [](uint64_t& x, int y) noexcept { x -= y; },
                incr0, incr1, incr2, incr3, incr4);

  run_benchmark("Multiplication",
                [](uint64_t& x, int y) noexcept { x *= y; },
                incr0, incr1, incr2, incr3, incr4);

  run_benchmark("Division",
                [](uint64_t& x, int y) noexcept { x /= y; },
                incr0, incr1, incr2, incr3, incr4);

  return 0;
}
