#!/bin/bash
# TFSGFM - Full reproduction script
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Experiment 1: Mixed homophily-heterophily node classification (Test: Cora)
cd "$SCRIPT_DIR/TFSGFM-node-classification"
python main-mix.py 2>&1 | tee "$SCRIPT_DIR/results.txt"

# Experiment 2: Homophily-only node classification (Test: Computers)
python main-homo.py 2>&1 | tee -a "$SCRIPT_DIR/results.txt"

# Experiment 3: Graph classification (Test: DD)
cd "$SCRIPT_DIR/TFSGFM-graph-classification"
python main.py 2>&1 | tee -a "$SCRIPT_DIR/results.txt"
