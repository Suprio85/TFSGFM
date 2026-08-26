#!/bin/bash
# Figure 3: Feature splitting ratio sensitivity analysis (rho in {0.125, 0.25, 0.5})
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESULTS_FILE="$SCRIPT_DIR/results_fig3.txt"
cd "$SCRIPT_DIR/TFSGFM-node-classification"

# rho = 0.125 (split = 8)
python main-homo.py --test_dataset Cora --train_datasets CiteSeer PubMed Photo Computers --split 8 2>&1 | tee "$RESULTS_FILE"
python main-homo.py --test_dataset Photo --train_datasets Cora CiteSeer PubMed Computers --split 8 2>&1 | tee -a "$RESULTS_FILE"

# rho = 0.25 (split = 4)
python main-homo.py --test_dataset Cora --train_datasets CiteSeer PubMed Photo Computers --split 4 2>&1 | tee -a "$RESULTS_FILE"
python main-homo.py --test_dataset Photo --train_datasets Cora CiteSeer PubMed Computers --split 4 2>&1 | tee -a "$RESULTS_FILE"

# rho = 0.5 (split = 2)
python main-homo.py --test_dataset Cora --train_datasets CiteSeer PubMed Photo Computers --split 2 2>&1 | tee -a "$RESULTS_FILE"
python main-homo.py --test_dataset Photo --train_datasets Cora CiteSeer PubMed Computers --split 2 2>&1 | tee -a "$RESULTS_FILE"
