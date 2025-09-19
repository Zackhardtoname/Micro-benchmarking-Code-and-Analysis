The implementation code and the book differ quite a bit. I think the author didn't clean up his code and the tech reviewers did a bad job.

The sketches is in the corresponding PDF.
sysbench memory --memory-block-size=1M --memory-total-size=20G --memory-oper=read run
The default total size is 100 GB which is a terribly misleading default, cuz anything above my 64 GB capacity is swapped(?)

sysbench shows that my RAM
randam write is 3854.65 MiB/sec
random read is 4090.40 MiB/sec
sequential write is 40000.96 MiB/sec
sequential read is 102770.81 MiB/sec

My RAM is https://www.gskill.com/product/165/396/1691400033/F5-6000J3040G32GX2-FX5, using AMD expo.
6000 MT/s * 64 bits / transfer * 2 channels = 94 GiB/s.

My Lan is 1x Realtek® 8126 5Gbps LAN controller.

So the weighed process speed is about 5/8 * 2/6.5 + (102770+40000) / 2 / 1024 * 4/6.5 = 48 GiB/s.

Question: We are also ignoring CPU caches completely even though the packets completely fit in our caches. I think we have to go through main memory for kernel buffer to user buffer, but what about user buffer to strings and afterward? We should be able to use CPU cache for sure right?

Question: I can't figure out what this 350 usec is talking about on page 108.

## 6.1 How long, in milliseconds, did you estimate for the ping requests and their response
message transmissions? How long do they actually take? Briefly comment on the
difference.

### My estimates:
Send time = Response time = 1 ms
Process time = 14 us.

### Actual
3.237ms  1.992ms  1.921ms  1.973ms  1.939ms  1.939ms  1.922ms  1.923ms  1.917ms  1.898ms  

Histogram of floor log 2 buckets of usec response times
1 2+ 4+ us            1+ 2+ 4+ msec         1+ 2+ 4+ sec           1K+ 2k+ secs
|                     |                     |                      |
0 0 0 0 0 0 0 0 0 0   9 1 0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0 0 0   0 0 
10 RPCs,  20.7 msec, 1.025 TxMB, 1.025 RxMB total
484.0 RPC/s (2.066 msec/RPC),  49.6 TxMB/s,  49.6 RxMB/s

### Discussion
The actual time is slightly less but very impressively close (2.1 - 2.066) / 2.066 = 1.6%. And I didn't even align the time.

The process time ranges from 4 to 18 usec.

The first one indeed took longer, about 1.2 ms longer. I was surprised that the pings are overlapping given that the code is blocking on receiving responses. Then I realized it is definitely because my Arch server has a later clock compared to my Fedora client, lovely. Because the numbers in the above output are T4 - T1, both of which are on the client, we can still trust those numbers. As for T3 being equal to T4 in the JSON file, I imagine there's some normailization in the KUTrace library (i.e. max() calls).

GPT:
"""
Based on the client4.cc code and the JSON structure, here's what each field in the "events" array represents:
Event Field Interpretation
Each event is an array with 15 fields representing an RPC transaction:

T1 (24.357147) - Request send timestamp (seconds) - when the client sends the RPC request
T2 (24.361981) - Server receive/process timestamp - when server received and started processing
T3 (24.362018) - Server send timestamp - when server finished and sent the response
T4 (24.362018) - Response receive timestamp - when client received the response
Client IP ("192.168.1.173") - IP address of the client machine
Server IP ("192.168.1.167") - IP address of the server machine
Request size (16.6) - Log scale of request size (lglen1) - indicates ~100KB request
Response size (16.6) - Log scale of response size (lglen2) - indicates ~100KB response
RPC ID (3355801765) - Unique 32-bit identifier for this RPC request
Parent ID (0) - Parent RPC ID for nested calls (0 means no parent)
Type ("RespRcv ") - RPC event type - "RespRcv" means Response Received at client
Method ("ping") - The RPC command/method being called
Status ("Success ") - Result status of the RPC
Data length (102413) - Actual data payload size in bytes (~100KB)
Data preview - Sample of the data payload (key/value with padding)

Key Timing Metrics

Network latency: T2 - T1 (time for request to reach server)
Server processing: T3 - T2 (deltaT23, which is 0 in your trace)
Response latency: T4 - T3 (time for response to reach client)
Total round-trip: T4 - T1 (complete RPC duration)

The last event [999.0, 0.0, ...] is a sentinel/terminator marking the end of the trace.
From your trace, these are "ping" RPCs with 100KB payloads (as indicated in the title), showing sub-5ms round-trip times between the client and server on what appears to be a local network (192.168.x.x addresses).
"""

This is pretty stupid not to explain in the book. Pretty sure it's the case.
I think the start-up delay might be from network socket setup and connection.
"""
Looking at the HTML visualization code and your JSON data, the x-axis shows values around 356-382 ms because of how the visualization handles time display to keep axis labels manageable.
Here's what's happening:

Your data's actual timestamps: The JSON events have T1 (start time) values around 24.357147 to 24.376354 seconds from the trace base time.
Base time subtraction: The calculateBasetime() function in the JavaScript code automatically determines a "base time" to subtract from all displayed values. When the time span is small (your data spans only ~19 milliseconds), it sets the base time to the nearest whole second - in this case, 24 seconds.
Conversion to milliseconds: After subtracting the base time:

24.357147 - 24 = 0.357147 seconds
This gets multiplied by 1000 to show as 357.147 milliseconds
Similarly, 24.376354 becomes 376.354 milliseconds

Display optimization: The base time (24 seconds) is shown separately at the bottom left of the graph as "2025-09-18 03:11:24". This allows the axis to show just the millisecond-level detail (356-382) rather than the full timestamp, making the labels more readable.

This is a common visualization technique for time-series data - removing the common offset and showing just the relevant variation. The axis label "Time (msec)" indicates these are millisecond offsets from the base time shown at the bottom.
"""

My external internet speed is about 300 Mbps. Internal test using the "sink" command of the programs gave me 114 TxMB/s = 912 Mb per second. so estimating using 1 Gbps is correct. I don't actually know why it's only 1 Gbps because my ethernet cable is 10 Gbps. Not sure if the free Verizon router is capped at that since their highest plan claims 940 Mbps. My NIC for the server is Killer E2600 Gigabit Ethernet NIC (Standard), the definitive limiter, and for the client is up to 5.8 Gbps. So neither can do 10 Gbps anyway.

## 6.2 How long, in milliseconds, did you estimate for the write requests and their
response message transmissions? How long do they actually take? Briefly comment on the
difference.

### My estimate
Send time = 10 ms
Process time = 160 us
Reponse time = 1 to 10 us

### Actual
// I think this specific output is a different run from the committed json and html files.
10.844ms  9.936ms  10.078ms  9.696ms  9.680ms  9.562ms  9.558ms  9.535ms  9.552ms  9.539ms  

Histogram of floor log 2 buckets of usec response times
1 2+ 4+ us            1+ 2+ 4+ msec         1+ 2+ 4+ sec           1K+ 2k+ secs
|                     |                     |                      |
0 0 0 0 0 0 0 0 0 0   0 0 0 10 0 0 0 0 0 0   0 0 0 0 0 0 0 0 0 0   0 0 
10 RPCs,  98.0 msec, 10.487 TxMB, 0.001 RxMB total
102.1 RPC/s (9.798 msec/RPC), 107.0 TxMB/s,   0.0 RxMB/s

client4_20250918_174816_fedora_45458.log written

### Discussion
Send time is good.
Process time ranges from 400 to 1000 usec. I know that writes are only about 40% of the speed of reads, so I am not too concerned.
Not sure if my response time is correct or not, since the clock drift is pretty bad. The actual T4 - T3 is already 2 ms.

## 6.3 How long, in milliseconds, did you estimate for the read requests and their response
message transmissions? How long do they actually take? Briefly comment on the
difference.

### My estimate
Send time: 1 us
Process time: 100 us (wrong)
Send response back: 10 ms

### Actual
10.153ms  9.904ms  9.609ms  9.397ms  9.385ms  9.386ms  9.381ms  9.388ms  9.567ms  9.363ms  

Histogram of floor log 2 buckets of usec response times
1 2+ 4+ us            1+ 2+ 4+ msec         1+ 2+ 4+ sec           1K+ 2k+ secs
|                     |                     |                      |
0 0 0 0 0 0 0 0 0 0   0 0 0 10 0 0 0 0 0 0   0 0 0 0 0 0 0 0 0 0   0 0 
10 RPCs,  95.5 msec, 10.487 TxMB, 0.001 RxMB total
104.7 RPC/s (9.553 msec/RPC), 109.8 TxMB/s,   0.0 RxMB/s

### Discussion
It seems that T1, T2, and T3 are the same.

Process time estimation is wrong. I think it is because of CPU caching.
T4 - T3 is matching our expectations.
The graph is very hard to read.