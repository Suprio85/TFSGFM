#!/bin/bash
# Table 6: Zero-shot graph classification
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESULTS_FILE="$SCRIPT_DIR/results_table6.txt"
cd "$SCRIPT_DIR/TFSGFM-graph-classification"

# DD
python main.py --test_dataset DD --train_datasets IMDB-BINARY ENZYMES 2>&1 | tee "$RESULTS_FILE"

# IMDB-BINARY
python main.py --test_dataset IMDB-BINARY --train_datasets ENZYMES DD 2>&1 | tee -a "$RESULTS_FILE"

# ENZYMES
python main.py --test_dataset ENZYMES --train_datasets IMDB-BINARY DD 2>&1 | tee -a "$RESULTS_FILE"
