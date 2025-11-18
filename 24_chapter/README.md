## 24.1 Would it improve the performance of a program like paging_hog if the operating system transferred groups of 16 pages (64KB) instead of groups of 8?

Just for paging_hog, I think it would because there would be less context switching and the HDD could potentially get files from adjacent disk tracks instead seeking outward for other unrelated seek requests.

GPT: "On spinning disks, each I/O has a large fixed cost (seek + rotation) and a smaller variable cost (data transfer). Bigger transfers amortize that fixed cost over more pages, which is why clusters of 8 or 16 pages are attractive." "Major cost: disk seek + rotational latency per I/O, not the 32 KB of data transfer."

## 24.2 How about groups of 128 pages (512KB)?

I am not sure. The likelihood for all consecutive 128 pages to contain dirty pages seems pretty low. There would not be that much less page fault and paging_hog ends up having to wait for fetching many more pages.

## 24.3 What are the design considerations in choosing the group size?

We need to pick a size that results in the pages to be most likely usable by all kinds of common programs.

https://chatgpt.com/share/691bbb5f-be48-8007-b026-bc90e6c33a06