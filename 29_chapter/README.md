# 29.1 Explain the large delays between times 42.120 and 42.145 in trace 
queuetest_bad_20210206_085042_dclab-2_19105_q.html. 

42.120 means 120 ms on the x-axis.
As section 29.15 to 29.17 explains (impossible to see just from that one HTML), there are two sources of delays.
1) no CPUs available. Too many task threads compared to CPUs. (CPU in this book includes hyperthreading cores)
2) the locking not released before waking up bug

# 29.2 Why are there longer RPC queuing delays in last half of trace 
qt_20210206_085042_dclab-2_19105.html?

There are 3 longer delays from time 193 ms to 278 ms. It looks like task 0 is blocked on a lock starting from around 180 ms. Zooming really in, I can see that task 0 sometimes is unblocked and quickly processes a request, and then goes back to blocking again. The times line up with the unprocessed requests. I suspect this might have to do with the locking not released before waking up bug.

# 29.3 Explain the RPC Work.36768 delay at time 26.36385 in trace 
qt_20210206_085326_dclab-2_19423.html.

Locate x-axis 385 when you zoom in enough or the x-axis to show usec instead of msec.
Then I see clearly that the process 19431 got rescheduled ("sched") and is just waiting for CPU. CPU 3 woke up task 1.19427 that preempted CPU 0.

# 29.4 Explain the client delay at time 26.377 in trace
qt_20210206_085326_dclab-2_19423.html.

The client is doing a nanosleep and got switched out and put back when the timer is out and CPU is allocated. I think it has calculated how much delay till the next request and decided to sleep till then, and the code shows that is the logic.

# 29.5 Explain the client delay at time 26.400 in trace
qt_20210206_085326_dclab-2_19423.html.

It's another nanosleep call. Zoom in at the usec level to see.

# 29.6 Explain the four RPC 36768, PID 19110 execution gaps near time 42.097 in 
Figure 29.10, trace
qt_20210206_085326_dclab-2_19423.html.

It should be qt_20210206_085042_dclab-2_19105.html
I see local_time_vector, hda, BH rx, etc, and then 19110 waiting for CPU. I think the system is running kernel interrupt hanlders on this CPU. The CPU was also on a lower frequency at 800 with IPC almost 0 somehow. (Section 29.12 talked about but did not fully explain the cause except saying it's startup and other programs not making the CPUs busy at first.)

# 29.7 It takes about 75 msec for the client to launch all the requests, instead of the 
estimated 50 msec. Explain the delay, trace
qt_20210206_085326_dclab-2_19423.html.
(Hint: Across the entire trace, arrange just the row for PID 19423 onscreen by shift- 
clicking its y-axis label to highlight it, collapsing the PID group to just highlighted rows, 
and collapsing the CPU and RPC groups; then search for wait_time, wait_cpu, etc., and 
look at the Matches total time.) 

I see a ton of wait_cpu summing to 27 ms, and wait_time summing to 48 ms. They add up to 75 ms. 
So it seems like we do not have enough CPUs, so the client keeps getting switched out. ssh is only active for a short bit, and gedit was active for 15 ms.
Threads cache misses on copy on write also complicate things.
"To mitigate cache misses and context switches upon startup, limit the number of threads, use thread pools to reuse threads, pre-load critical data into the cache, and perform tasks in a batch-like manner to reduce the need for switching."

# 29.8 When running the fixed version of queuetest, what goal would you choose for the 
90th percentile queue depth using the uniform distribution? The skewed distribution? In 
each case, why?

I see that out of 100 transactions, 28 are dropped in one particular run. Not sure if it's uniform or skewed...

Queue Depth = I/O per second × Response Time
For uniform, the 90th percentile of response time is 900 us for the first queue and 4000 * 0.9 = 3600 us for the second queue.
The total response time is 4.5 ms. We can calculate the queue depth based on the target IOPS. It goes the same for skewed.
If I have to base IOPS on queue depth, I would say spend no more than 50% of the total latency in queueing, based on the half-time 
principles in the book. So for both uniform and skewed, I would say the queue depth should be 1.0: when a new request drops, the previous request is taken to process, and after one unit of processing time, the new request's own processing begins.

# 29.9 Given your previous goal, measure what request rate per second the program can 
sustain over 1,000 transactions. Datacenter capacity for a service is often empirically 
determined this way.

For uniform, IOPS = 1 / 4.5 ms = 222 requests per second per hardware thread.
For skewed, IOPS = 1 / 90th percentile of the skewed time per hardware thread.

# 29.10 In a copy of queuetest.cc, change kSkewedWorkPattern[16] so that instead of 
four patterns that use queues 4 and 5, have two of them use queues 4 and 5 and two use 
queues 4 and 6. Trace over 100 transactions and comment on what this does to change the 
load balance and overall performance.


// Wait xx microseconds
uint32 wait_usec = GetDelayRand(rand, max_delay_usec, skew);
UpdateRand(&rand);
delay_times[i] = wait_usec;
usecsleep(wait_usec);

transaction_times[item->trans_num] = item->log.resp_rcv_timestamp - item->log.req_send_timestamp;

The crazy thing is that I don't find a difference between fixed vs not fixed enqueue code
>> g++ -O2 -pthread -DFIXED queuetest.cc dclab_log.cc dclab_rpc.cc kutrace_lib.cc -o queuetest
>> ./queuetest -rate 1000 -n 20000 -skew
20000 transactions, 1726 dropped

Delays (usec), total = 20165040, average = 1008
Transactions (usec), total = 587902501, average = 29395
  queuetest_20251127_164340_fedora_50838.log written
KUtrace module/code not available
KUtrace module/code not loaded
  qt_20251127_164401_fedora_50838.trace written (0.0MB)
KUtrace module/code not available
./queuetest -rate 1000 -n 20000 -skew  59.70s user 0.05s system 280% cpu 21.308 total

>> time ./bad_queuetest -rate 1000 -n 20000 -skew
20000 transactions, 1725 dropped

Delays (usec), total = 20165040, average = 1008
Transactions (usec), total = 587763960, average = 29388
  bad_queuetest_20251127_164409_fedora_50970.log written
KUtrace module/code not available
KUtrace module/code not loaded
  qt_20251127_164430_fedora_50970.trace written (0.0MB)
KUtrace module/code not available
./bad_queuetest -rate 1000 -n 20000 -skew  59.50s user 0.03s system 279% cpu 21.311 total

I guess I have too many CPUs or something.

My estimate for changing the queueing pattern is that the load would be more evenly distributed for different threads, so the change will result in a noticable improvement.

### Before the change:
>> ./queuetest -rate 2000 -n 100 -skew
100 transactions, 13 dropped

Delays (usec), total = 43252, average = 432
Transactions (usec), total = 3016782, average = 30167

### After the change:
>> ./queuetest_load_balanced -rate 2000 -n 100 -skew

100 transactions, 18 dropped

Delays (usec), total = 43252, average = 432
Transactions (usec), total = 2027301, average = 20273

The estimate is correct. When I do rate = 100, no requests are dropped and after is faster.
When I do a rate of 2k, slightly more requests are dropped for after, probably just due to bad lack with the random number generator.