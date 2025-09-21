## 7.1 From the client log files you created in the Chapter 6 exercises, run timealign.cc
and dumplogile4.cc and makeself.cc to create original HTML pictures and time-
aligned HTML pictures.

From 4_1: "t23_alignment y0 07:11:24.364071 offset -2633.5us slope -120.70us/sec"
From 4_2: "t23_alignment y0 21:48:16.746551 offset 2038.5us slope 137.97us/sec"
From 4_3: "t23_alignment y0 22:28:09.912703 offset 709.9us slope 219.06us/sec"

After the alignment, all the overlapping in the original HTMLs are gone.

# Notes
I only have 2 local Linux and one remote Linux atm. I don't want to mess with my M1 MBP just for this. If 
The latency from local to remote for 64 bytes is 10 ms whereas locally it's 200 usec. It's also too much variation going through the public internet. The results will be so flakey.
I get another local machine, I'll be back.

## 7.2 Build and run Experiment 1 yourself on whatever sample servers you have available. 
Reconstruct Figures 7.6a and 7.6b from your data. Comment briefly on the differences you 
observe.
## 7.3 Build and run Experiment 2. Reconstruct Figure 7.9 from your data. Comment 
briefly on the differences you observe.
## 7.4 Build and run Experiment 3. Reconstruct Figures 7.13a and 7.13b from your data. 
Comment briefly on the differences you observe.
## 7.5 Build and run Experiment 3, but this time specifying O_DIRECT (i.e., uncached 
and unbuffered disk accesses) and O_NOATIME using code fragments from mystery3.cc. 
Reconstruct Figures 7.13a and 7.13b from your data. Comment briefly on the differences 
you observe.