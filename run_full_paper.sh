#!/bin/bash
# Master reproduction script for all paper tables & experiments
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Running Table 3 (Mixed node classification)..."
bash "$SCRIPT_DIR/run_table3.sh"

echo "Running Table 4 (Homophily-only node classification)..."
bash "$SCRIPT_DIR/run_table4.sh"

echo "Running Table 5 (Few-shot node classification)..."
bash "$SCRIPT_DIR/run_table5.sh"

echo "Running Table 6 (Graph classification)..."
bash "$SCRIPT_DIR/run_table6.sh"

echo "Running Table 7 (Data ablation study)..."
bash "$SCRIPT_DIR/run_table7.sh"

echo "Running Figure 3 (Feature split ratio sensitivity)..."
bash "$SCRIPT_DIR/run_fig3.sh"

echo "All paper experiments complete."
