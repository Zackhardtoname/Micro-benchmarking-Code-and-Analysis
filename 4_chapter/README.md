The transpose fast (transpose + subblocking) are only 2% slower compared to the pure algorithmic latency of 0.109 seconds.

It might be possible to improve the subblocking one from 0.214 seconds by 20%.

We can also use OpenMP API to parallelize the Faster Matrix Multiply – Subblock method. OMP is much easier to use than std since it's just a one-line change.
It improved BlockMultiplyRemap time from 0.214 seconds to 0.029 seconds, a 10x improvement.
It improved SimpleMultiplyTransposeFast time from 0.111 seconds to 0.032 seconds, a 3x improvement.