## 10.1. What is wrong with 50 msec nominal and 100 msec deadline? What happens if three requests all arrive within the same 50 msec interval? Does the third request meet its deadline? What is the probability of that happening with 60 requests per minute? If we have 10,000 requests in a day, how many do you expect will miss the deadline?

At 50 msec nominal, a spike could easily 2x the response time and exceed the deadline.
Assuming no concurrency, something like this could happen:
Even if the first two requests arrive at the same time, and the third one arrives at 50ms, the third one would not be expected to begin processing util 100ms. It would only meet its deadline if the previous two requests take less than expeced time or it got scheduled exactly as and not before 50ms.
Maybe.
Depending on the distribution, but here we have 1 request per second.
Assuming Poisson, we have 0.05 events per 50 ms. Lambda = 0.05.
P(x = 2) = 0.05^2 * e^(-0.05) / 2! = 0.12%
P(x >= 3) = 0.002%

If we have 10k requests a day, we have 0.116 requests per second, or 0.0058 requests per 50 ms.
Queueing Theory Calculation:
Using M/M/1 queue theory (valid approximation for low utilization):
Wikipedia/textbook: "the number of customers in the system is geometrically distributed with parameter 1 − ρ"
P(≥2 customers in system) = ρ²/(1-ρ) = (0.00579)²/(1-0.00579) = 0.0000337
Final Result:
Expected deadline misses = 10,000 × 0.0000337 = 0.34 requests.
So we can expect a miss once every 3 days.