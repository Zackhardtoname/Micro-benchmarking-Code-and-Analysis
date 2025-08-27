#include <stdint.h>
#include <stdio.h>
#include <time.h>       // time()
#include "timecounters.h"


static const int outerIter = 20;
static const int kIterations = 10000; // 100 * 1000000;

int main (int argc, const char** argv) {
  double res = 1;

  time_t t = time(NULL);    // A number that the compiler does not know
  volatile double incr0 = 1 + 1.0 / (t & 255) / 10;
  t = time(NULL);   // A number that the compiler does not know
  volatile double incr1 = 1 + 1.0 / (t & 255) / 10;
  t = time(NULL);   // A number that the compiler does not know
  volatile double incr2 = 1 + 1.0 / (t & 255) / 10;
  t = time(NULL);   // A number that the compiler does not know
  volatile double incr3 = 1 + 1.0 / (t & 255) / 10;
  fprintf(stdout, "incr3 is %10.10f\n", incr3);
  t = time(NULL);   // A number that the compiler does not know
  volatile double incr4 = 1 + 1.0 / (t & 255) / 10;

  for (int j = 0; j < outerIter; ++j) {
    int64_t startcy = GetCycles();
    for (int i = 0; i < kIterations; ++i) {
      res /= incr0;
      res /= incr1;
      res /= incr2;
      res /= incr3;
    }

    int64_t elapsed = GetCycles() - startcy;
    double felapsed = elapsed;

    int64_t another_startcy = GetCycles();
    for (int i = 0; i < kIterations; ++i) {
      res /= incr0;
      res /= incr1;
      res /= incr2;
      res /= incr3;
      res /= incr4;
    }

    int64_t another_elapsed = GetCycles() - another_startcy;
    double another_felapsed = another_elapsed;

    fprintf(stdout, "%d iterations, %lu cycles, %4.2f cycles/iteration\n",
            kIterations, elapsed, (another_felapsed - felapsed) / kIterations);

    fprintf(stdout, "t is %lu; res is %4.310f\n", t, res);  // Make res live
  }

  return 0;
}
