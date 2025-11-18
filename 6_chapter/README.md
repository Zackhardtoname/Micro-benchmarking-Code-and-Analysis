The implementation code and the book differ quite a bit. I think the author didn't clean up his code and the tech reviewers did a bad job.

The drawings are in the corresponding PDF.
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

Question: I can't figure out what this 350 usec is talking about on page 108. I think it is actually the T4 - T3 the author got but they had a typo in the table as it should be 350 usec.

## Unaligned
Example 1:
Send time (t2 - t1):
[4834.0, 3626.0, 3597.0, 3594.0, 3592.0, 3597.0, 3595.0, 3597.0, 3593.0, 3583.0] usec
Process time (t3 - t2):
[37.0, 2.0, 4.0, 18.0, 4.0, 5.0, 5.0, 5.0, 4.0, 4.0] usec
send back time (t4 - t3):
[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] usec

Example 2:
Send time (t2 - t1):
[7791.0, 6937.0, 6906.0, 7030.0, 6994.0, 6901.0, 6895.0, 6899.0, 6903.0, 6899.0] usec
Process time (t3 - t2):
[780.0, 735.0, 914.0, 387.0, 425.0, 406.0, 409.0, 378.0, 396.0, 381.0] usec
send back time (t4 - t3):
[2273.0, 2264.0, 2258.0, 2279.0, 2261.0, 2255.0, 2254.0, 2258.0, 2253.0, 2259.0] usec

Example 3:
Send time (t2 - t1):
[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] usec
Process time (t3 - t2):
[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] usec
send back time (t4 - t3):
[9558.0, 9249.0, 9201.0, 9231.0, 9235.0, 9217.0, 9233.0, 9343.0, 9259.0, 9241.0] usec

## Aligned from Chapter 7
Example 1:
Send time (t2 - t1):
[2201.0, 993.0, 964.0, 960.0, 958.0, 963.0, 961.0, 963.0, 958.0, 948.0] usec
Process time (t3 - t2):
[37.0, 2.0, 4.0, 18.0, 4.0, 5.0, 5.0, 5.0, 4.0, 4.0] usec
send back time (t4 - t3):
[999.0, 997.0, 953.0, 995.0, 977.0, 971.0, 956.0, 955.0, 955.0, 946.0] usec

Example 2:
Send time (t2 - t1):
[9828.0, 8975.0, 8945.0, 9071.0, 9036.0, 8945.0, 8940.0, 8945.0, 8951.0, 8948.0] usec
Process time (t3 - t2):
[780.0, 735.0, 914.0, 387.0, 425.0, 406.0, 409.0, 378.0, 396.0, 381.0] usec
send back time (t4 - t3):
[236.0, 226.0, 219.0, 238.0, 219.0, 211.0, 209.0, 212.0, 205.0, 210.0] usec

Example 3:
Send time (t2 - t1):
[257.0, 215.0, 213.0, 210.0, 211.0, 199.0, 217.0, 232.0, 227.0, 223.0] usec
Process time (t3 - t2):
[117.0, 68.0, 56.0, 65.0, 65.0, 66.0, 61.0, 125.0, 61.0, 61.0] usec
send back time (t4 - t3):
[9184.0, 8966.0, 8932.0, 8956.0, 8959.0, 8952.0, 8955.0, 8986.0, 8971.0, 8957.0] usec

## 6.1 How long, in milliseconds, did you estimate for the ping requests and their response
message transmissions? How long do they actually take? Briefly comment on the
difference.

### My estimates:
Send time = send back time = 1 ms
Process time = 12.5 us.

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
Reponse time = 0.8 us

### Discussion
Send time is good.
Process time ranges from 400 to 1000 usec. I know that writes are only about 40% of the speed of reads, so I am not too concerned.
Not sure if my send back time is correct or not, since the clock drift is pretty bad. The actual T4 - T3 is already 2 ms.
* After alignment*: The send back times are about 200 usec. It is still 200x my estimate. So I guess network does have an initial delay/lower bound. Question: where is that from?

## 6.3 How long, in milliseconds, did you estimate for the read requests and their response
message transmissions? How long do they actually take? Briefly comment on the
difference.

### My estimate
Send time: 0.8 us
Process time: 100 us (wrong)
Send response back: 10 ms

### Discussion
The graph is impossible to read.
*After alignment*: I got the same results as the send back time from 6.2 for send time.
Process time estimation is wrong. I think it is because of CPU/RAM caching.
send back time is matching our expectations.