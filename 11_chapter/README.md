## 11.1 Pick a simple program of yours and run some of the existing tools to observe it. Did you find any surprises?
`touch random` and then `time frm random` does not display the timing output, but why?

a.
function frm {
    now=$(date "+%F-%T-%Z")
    for file in "$@"
    do
        new_name="${file}_${now}"
        mv -i -- "$file" "$new_name"
        nohup rm -rf -- "$new_name" > "/tmp/$new_name.log" 2>&1 &
    done
}

"In zsh, the time keyword has no effect on builtins (or other similar shell-internal constructs)."

It works fine in bash:
time frm random
[1] 14177

real	0m0.002s
user	0m0.000s
sys	0m0.002s
As you can see, most of the file ops are done in the kernel mode CPU time.

b. running sudo tcpdump -n -s128 gives me a bunch of packets for the ssh connection haha because I am telling it to print the packets to the screen.
Surprised that the local network is using IPv6.
Source: The .ssh suffix means port 22, the standard SSH port. Note that the kernel maps each distinct pair of <protocal, source IP, source port> to a different socket, the interface between the transport and application layers.
The packets have flow labels as well.

## 11.2 Pick two existing tools and use one to observe the overhead of the other while running one of your programs.
zack@fedora:~/GitHub/Micro-benchmarking-Code-and-Analysis/11_chapter$ time wc /etc/hosts
  7  40 384 /etc/hosts

real	0m0.001s
user	0m0.001s
sys	0m0.000s
zack@fedora:~/GitHub/Micro-benchmarking-Code-and-Analysis/11_chapter$ time perf stat wc /etc/hosts
  7  40 384 /etc/hosts

 Performance counter stats for 'wc /etc/hosts':

              0.36 msec task-clock:u                     #    0.597 CPUs utilized
                 0      context-switches:u               #    0.000 /sec
                 0      cpu-migrations:u                 #    0.000 /sec
               133      page-faults:u                    #  373.554 K/sec
           306,168      instructions:u                   #    0.94  insn per cycle
                                                  #    0.61  stalled cycles per insn
           324,526      cycles:u                         #    0.911 GHz
           185,731      stalled-cycles-frontend:u        #   57.23% frontend cycles idle
            62,350      branches:u                       #  175.121 M/sec
             4,066      branch-misses:u                  #    6.52% of all branches

       0.000596822 seconds time elapsed

       0.000627000 seconds user
       0.000000000 seconds sys



real	0m0.028s
user	0m0.004s
sys	0m0.005s

The perm command, despite giving us useful information, extended the time by 28x when the runtime is tiny.

zack@fedora:~/GitHub/Micro-benchmarking-Code-and-Analysis/11_chapter$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p6  739G  145G  593G  20% /
devtmpfs         31G     0   31G   0% /dev
tmpfs            31G  276M   30G   1% /dev/shm
efivarfs        128K   66K   58K  54% /sys/firmware/efi/efivars
tmpfs            13G  2.7M   13G   1% /run
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
/dev/nvme0n1p6  739G  145G  593G  20% /home
tmpfs            31G   31G     0 100% /tmp
/dev/nvme0n1p3  974M  809M   98M  90% /boot
/dev/loop0      128K  128K     0 100% /var/lib/snapd/snap/bare/5
/dev/loop4       64M   64M     0 100% /var/lib/snapd/snap/core20/2669
/dev/loop2       56M   56M     0 100% /var/lib/snapd/snap/core18/2952
/dev/loop1       56M   56M     0 100% /var/lib/snapd/snap/core18/2947
/dev/loop6       92M   92M     0 100% /var/lib/snapd/snap/gtk-common-themes/1535
/dev/loop3       64M   64M     0 100% /var/lib/snapd/snap/core20/2599
/dev/loop7      106M  106M     0 100% /var/lib/snapd/snap/p3x-onenote/258
/dev/loop8       51M   51M     0 100% /var/lib/snapd/snap/snapd/25202
/dev/loop5      165M  165M     0 100% /var/lib/snapd/snap/gnome-3-28-1804/198
/dev/nvme0n1p1   96M   51M   46M  53% /boot/efi
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
tmpfs           6.1G  144K  6.1G   1% /run/user/1000
zack@fedora:~/GitHub/Micro-benchmarking-Code-and-Analysis/11_chapter$ time dd if=/dev/zero of=./my_temp_file bs=1G count=100
100+0 records in
100+0 records out
107374182400 bytes (107 GB, 100 GiB) copied, 30.4718 s, 3.5 GB/s

real	0m30.497s
user	0m0.001s
sys	0m30.437s
zack@fedora:~/GitHub/Micro-benchmarking-Code-and-Analysis/11_chapter$ time perf stat dd if=/dev/zero of=./my_temp_file_2 bs=1G count=100
100+0 records in
100+0 records out
107374182400 bytes (107 GB, 100 GiB) copied, 30.4663 s, 3.5 GB/s

 Performance counter stats for 'dd if=/dev/zero of=./my_temp_file_2 bs=1G count=100':

         30,458.69 msec task-clock:u                     #    0.999 CPUs utilized
                 0      context-switches:u               #    0.000 /sec
                 0      cpu-migrations:u                 #    0.000 /sec
                72      page-faults:u                    #    2.364 /sec
           324,253      instructions:u                   #    0.13  insn per cycle
                                                  #    5.90  stalled cycles per insn
         2,468,522      cycles:u                         #    0.000 GHz
         1,913,931      stalled-cycles-frontend:u        #   77.53% frontend cycles idle
            70,196      branches:u                       #    2.305 K/sec
             7,797      branch-misses:u                  #   11.11% of all branches

      30.488458730 seconds time elapsed

       0.000000000 seconds user
      30.431412000 seconds sys



real	0m30.530s
user	0m0.008s
sys	0m30.433s

The runtime extension is tiny and negligable when the runtime is large.

## 11.3 Run the Whetstone benchmark after compiling it with incrementally more of the suggested oprofile compilation flags, detailed just before Code Snippet 11.5. Which one(s) produce a substantially slower runtime?

