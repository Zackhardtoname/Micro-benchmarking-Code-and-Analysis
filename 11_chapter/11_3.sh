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
    perf record -o "$PERF_DATA" -q -g ./$CMD

    echo "--- Generating short perf report for $EXE ---"
    perf report -i "$PERF_DATA" --stdio | head -n 10
done

# ===== Final executable with -O0 -g for source-level annotation =====
FINAL_ID=${#EXTRA_FLAGS[@]}
FINAL_EXE="${OUT_BASE}_${FINAL_ID}_debug"
FINAL_CMD="$FINAL_EXE $ARG"
FINAL_DATA="perf_data_final.data"

# Build final executable with debug info and no optimization
FINAL_FLAGS="-O0"
for f in "${EXTRA_FLAGS[@]}"; do
    FINAL_FLAGS="$FINAL_FLAGS $f"
done

echo -e "\n--- Building final executable $FINAL_EXE with flags: $FINAL_FLAGS ---"
g++ -I ../book_files $FINAL_FLAGS $SRC_C $SRC_CC -lm -g -O0 -o $FINAL_EXE

echo "--- Running final executable (normal run) ---"
/usr/bin/time ./$FINAL_CMD

echo "--- Profiling final executable with perf ---"
rm -f "$FINAL_DATA"
perf record -o "$FINAL_DATA" -q -g ./$FINAL_CMD

echo "--- Generating summary report ---"
perf report -i "$FINAL_DATA" --stdio > perf_summary.txt

echo "--- Generating source-annotated report ---"
perf annotate -i "$FINAL_DATA" --source --stdio -l --full-paths \
  > perf_source_report.txt

echo -e "\nReports generated:"
echo "  perf_summary.txt"
echo "  perf_source_report.txt (source lines with perf annotate)"

echo -e "\n===== Done ====="
