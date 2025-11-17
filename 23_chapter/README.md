# 23.1 [50] Design a completely fair scheduler.

I'll just describe the CFS scheduler on Linux.

It uses up to about 5% of CPU time.

Each process’s vruntime increases at the same rate, in proportion with physical (real) time. When a scheduling decision occurs, CFS will pick the process with the lowest vruntime to run next.

sched latency = 48 ms: time till recaclulating time slice duration - how long one process should run before considering a switch

time slice = sched latency / num of processes

min granularity = 6 ms: minimal time slice

niceness = 0: -20 to 19 Positive nice values imply lower priority and negative values imply higher priority. CFS maps the nice value of each process to a weight

time_slice_k = weight_k / (sum of weights of all processes) * sched_latency

vruntime delta = default weight (1024) / weight_k * actual_runtime_k
We essentially normalize the vruntime to be in the unit of time slices, since each program has given time slices of difference lengths.

modern systems sometimes are comprised of 1000s of processes

All running and runnable processes are kept in a red-black tree of vruntimes.

To avoid monopolizing the CPU, CFS sets the vruntime of a job that just woke up to the minimum value found in the tree. Downside: jobs that sleep for short periods of time frequently do not ever get their fair share of the CPU

# 23.2 Improve the CPU affinity algorithm to be closer to work-conserving, rather than delaying some threads while there are idle CPU cores.

work conserving: There should never be times when a thread is ready to run and a CPU core is idle, but the scheduler fails to run the ready thread.

We are making a trade off between work conservation and cache hits. To determine the fine line, we should follow the half optimal principle. 

Depending on the level of cache sharing between the new available CPU and the old occupied CPU, we can use table 23.1 to determine the exact time. We can always switch right away if the line is <= 2 usec, since that will likely have already passed when we get to making this decision.