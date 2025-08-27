#include <stdint.h>
#include <stdio.h>
#include <time.h>		// time()
#include "timecounters.h"

static const int kIterations = 1000 * 1000000;

int main (int argc, const char** argv) {
  uint64_t sum = 0;

  time_t t = time(NULL);	// A number that the compiler does not know
  volatile int incr0 = t & 255;		// Unknown increment 0..255
  t = time(NULL);	// A number that the compiler does not know
  volatile int incr1 = t & 255;		// Unknown increment 0..255
  t = time(NULL);	// A number that the compiler does not know
  volatile int incr2 = t & 255;		// Unknown increment 0..255
  t = time(NULL);	// A number that the compiler does not know
  volatile int incr3 = t & 255;		// Unknown increment 0..255
  t = time(NULL);	// A number that the compiler does not know
  volatile int incr4 = t & 255;		// Unknown increment 0..255

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; ++i) {
    sum += incr0;
    sum += incr1;
    sum += incr2;
    sum += incr3;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  int64_t another_startcy = GetCycles();
  for (int i = 0; i < kIterations; ++i) {
    sum += incr0;
    sum += incr1;
    sum += incr2;
    sum += incr3;
    sum += incr4;
  }

  int64_t another_elapsed = GetCycles() - another_startcy;
  double another_felapsed = another_elapsed;

  fprintf(stdout, "%d iterations, %lu cycles, %4.2f cycles/iteration\n",
          kIterations, elapsed, (another_felapsed - felapsed) / kIterations);

  fprintf(stdout, "%lu %lu\n", t, sum);	// Make sum live

  return 0;
}
