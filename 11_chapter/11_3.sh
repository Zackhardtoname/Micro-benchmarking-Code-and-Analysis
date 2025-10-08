#!/bin/bash
# Run and time Whetstone benchmark with incremental flags using perf
# Run with ./11_3.sh > 11_3.txt 2>&1

SRC_C="whetstone_ku.c"
SRC_CC="../book_files/kutrace_lib.cc"
OUT_BASE="whetstone_ku"
FLAGS_BASE="-O2"
EXTRA_FLAGS=(
    "-DPRINTOUT"
    "-fprofile-arcs"
    "-ftest-coverage"
    "-fno-inline"
    "-pg"
    "-g"
)
ARG=1000000

echo "===== Running Whetstone with incremental compilation flags (perf) ====="

for i in $(seq 0 ${#EXTRA_FLAGS[@]}); do
    FLAGS="$FLAGS_BASE"
    for j in $(seq 0 $((i-1))); do
        FLAGS="$FLAGS ${EXTRA_FLAGS[$j]}"
    done

    EXE="${OUT_BASE}_$i"
    echo -e "\n--- Building $EXE with flags: $FLAGS ---"
    g++ -I ../book_files $FLAGS $SRC_C $SRC_CC -lm -o $EXE
    CMD="$EXE $ARG"

    echo "--- Running $EXE (normal run) ---"
    /usr/bin/time ./$CMD

    echo "--- Profiling $EXE with perf ---"
    PERF_DATA="perf_data_$i.data"
    rm -f "$PERF_DATA"
    perf record -o "$PERF_DATA" -q ./$CMD

    echo "--- Generating short perf report for $EXE ---"
    perf report -i "$PERF_DATA" --stdio | head -n 10
done

# For the last executable, produce detailed annotated report
FINAL_ID=${#EXTRA_FLAGS[@]}
FINAL_EXE="${OUT_BASE}_${FINAL_ID}"
FINAL_CMD="${OUT_BASE}_${FINAL_ID} ${ARG}"
FINAL_DATA="perf_data_final.data"

echo -e "\n===== Generating detailed perf report for $FINAL_EXE ====="
rm -f "$FINAL_DATA"
perf record -o "$FINAL_DATA" -q ./$FINAL_CMD

echo "--- Summary report ---"
perf report -i "$FINAL_DATA" --stdio > perf_summary.txt

echo "--- Source-annotated report ---"
perf annotate -i "$FINAL_DATA" --stdio > perf_source_report.txt

echo -e "\nReports generated:"
echo "  perf_summary.txt"
echo "  perf_source_report.txt"

echo -e "\n===== Done ====="

