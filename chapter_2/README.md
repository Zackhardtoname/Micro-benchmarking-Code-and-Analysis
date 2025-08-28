# TODO: get answer here https://stackoverflow.com/q/79743003/7053488
# I wrote this based on a skylake CPU first. Then I replicated the results really well on amd ryzen 7 9800x3d and colaberated the results with https://agner.org/optimize/instruction_tables.pdf

# 2.1
1

Longer if memory access is needed.

# 2.2 
o0 runs the loop and has 4 cycles per iteration.
o2 skips the loop and has only 22 cycles for the entire executable.

From [here](https://github.com/dfyz/understanding_software_dynamics/blob/master/mystery1.md)

"""
The -O0 version is also problematic, since it spills the registers to the stack:

000011b7  8b45d4             mov     eax, dword [rbp-0x2c {var_34}]
000011ba  4898               cdqe
000011bc  480145d8           add     qword [rbp-0x28 {var_30}], rax
"""

# 2.3
Same cycle behaviors as 2.2 because the compiler is able to do a multiplication directly (imulq).

# 2.4
No changes to o0, but o2 now does about 1 cycle per iteration. Now the compiler is worried that the value of `incr` would change between iterations and does not do a simple multiplication. The CPU is optimized enough to pipeline the addition of `incr` somehow.

# 2.5
See 2.8

# 2.6
(I did the analysis for multiplication instead of addition.)
1 iteration has higher than 1 billion iterations. 10 has slightly less. 100 seems close to 1 billion. Numbers too low are not good enough because the overhead from the loop setup and teardown would be more significant.

From [here](https://github.com/zanesterling/understanding-software-dynamics/blob/main/ch2-cpu/exercises.md)
"10^7 cycles / (4.7 * 10^9 cycles/sec) = 2ms, which is in the range of typical timer cycles 1-10ms."

# 2.7
Every addition is O(1).

Every multiplication and division is O(10).

Turns out multiplication is only O(1), I believe thanks to specialized hardware capable of handling all 64 bits in one cycle.

(I don't actually know how division works, but the question says 1 bit per cycle.)

# 2.8
Using -fno-tree-reassoc.
0.76 cycles for 64-bit integer addition.
2.37 cycles for 64-bit integer multiplication.
25 cycles for 64-bit integer division, but it probably gets to 0 pretty fast.

3 cycles for double addition.
3 cycles for double multiplication.
10 cycles for double division.

<span style="color:red">Floating point number division is faster than integer division because of the exponent part in floating point number representation. Division of exponent parts of floating point number value representations requires only a relatively cheap fixed-cost subtraction. int32_t division requires fast division of 31-bit numbers, whereas float division requires fast division of 24-bit mantissas (the leading one in mantissa is implied and not stored in a floating point number) and faster subtraction of 8-bit exponents.</span>.

![test](https://scaler.com/topics/images/pictorial-representation-of-double-in-c.webp)
But why is double less than half the number of cycles for integer division if the numbers of fraction bits is 52?

---
64-bit Multiplication
```C
#include <stdint.h>
#include <stdio.h>
#include <time.h>		// time()
#include "timecounters.h"

static const int kIterations = 1000 * 1000000;

int main (int argc, const char** argv) {
  uint64_t prod = 1;

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
    prod *= incr0;
    prod *= incr1;
    prod *= incr2;
    prod *= incr3;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  int64_t another_startcy = GetCycles();
  for (int i = 0; i < kIterations; ++i) {
    prod *= incr0;
    prod *= incr1;
    prod *= incr2;
    prod *= incr3;
    prod *= incr4;
  }

  int64_t another_elapsed = GetCycles() - another_startcy;
  double another_felapsed = another_elapsed;

  fprintf(stdout, "%d iterations, %lu cycles, %4.2f cycles/iteration\n",
          kIterations, elapsed, (another_felapsed - felapsed) / kIterations);

  fprintf(stdout, "%lu %lu\n", t, prod);	// Make prod live

  return 0;
}
```

Double Multiplication
```C
#include <stdint.h>
#include <stdio.h>
#include <time.h>		// time()
#include "timecounters.h"

static const int kIterations = 100 * 1000000;

int main (int argc, const char** argv) {
  double prod = 2;

  time_t t = time(NULL);	// A number that the compiler does not know
  volatile double incr0 = 1 + 1.0 / (t & 255) / 1000000;
  t = time(NULL);	// A number that the compiler does not know
  volatile double incr1 = 1 + 1.0 / (t & 255) / 1000000;
  t = time(NULL);	// A number that the compiler does not know
  volatile double incr2 = 1 + 1.0 / (t & 255) / 1000000;
  t = time(NULL);	// A number that the compiler does not know
  volatile double incr3 = 1 + 1.0 / (t & 255) / 1000000;
  fprintf(stdout, "incr3 is %4.2f\n", incr3);
  t = time(NULL);	// A number that the compiler does not know
  volatile double incr4 = 1 + 1.0 / (t & 255) / 1000000;

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; ++i) {
    prod *= incr0;
    prod *= incr1;
    prod *= incr2;
    prod *= incr3;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  int64_t another_startcy = GetCycles();
  for (int i = 0; i < kIterations; ++i) {
    prod *= incr0;
    prod *= incr1;
    prod *= incr2;
    prod *= incr3;
    prod *= incr4;
  }

  int64_t another_elapsed = GetCycles() - another_startcy;
  double another_felapsed = another_elapsed;

  fprintf(stdout, "%d iterations, %lu cycles, %4.2f cycles/iteration\n",
          kIterations, elapsed, (another_felapsed - felapsed) / kIterations);

  fprintf(stdout, "%lu %4.2f\n", t, prod);	// Make prod live

  return 0;
}
```

# 2.9
The time increases for floating division underflow from 10 to 100 to 140. However, I don't see any difference for multiplication even after the display becomes inf.
But why?

```C
#include <stdint.h>
#include <stdio.h>
#include <time.h>		// time()
#include "timecounters.h"


static const int outerIter = 20;
static const int kIterations = 10000; // 100 * 1000000;

int main (int argc, const char** argv) {
  double prod = 1;

  time_t t = time(NULL);	// A number that the compiler does not know
  volatile double incr0 = 1 + 1.0 / (t & 255) / 10;
  t = time(NULL);	// A number that the compiler does not know
  volatile double incr1 = 1 + 1.0 / (t & 255) / 10;
  t = time(NULL);	// A number that the compiler does not know
  volatile double incr2 = 1 + 1.0 / (t & 255) / 10;
  t = time(NULL);	// A number that the compiler does not know
  volatile double incr3 = 1 + 1.0 / (t & 255) / 10;
  fprintf(stdout, "incr3 is %10.10f\n", incr3);
  t = time(NULL);	// A number that the compiler does not know
  volatile double incr4 = 1 + 1.0 / (t & 255) / 10;

  for (int j = 0; j < outerIter; ++j) {
    int64_t startcy = GetCycles();
    for (int i = 0; i < kIterations; ++i) {
      prod /= incr0;
      prod /= incr1;
      prod /= incr2;
      prod /= incr3;
    }

    int64_t elapsed = GetCycles() - startcy;
    double felapsed = elapsed;

    int64_t another_startcy = GetCycles();
    for (int i = 0; i < kIterations; ++i) {
      prod /= incr0;
      prod /= incr1;
      prod /= incr2;
      prod /= incr3;
      prod /= incr4;
    }

    int64_t another_elapsed = GetCycles() - another_startcy;
    double another_felapsed = another_elapsed;

    fprintf(stdout, "%d iterations, %lu cycles, %4.2f cycles/iteration\n",
            kIterations, elapsed, (another_felapsed - felapsed) / kIterations);

    fprintf(stdout, "t is %lu; prod is %4.310f\n", t, prod);	// Make prod live
  }

  return 0;
}
```
