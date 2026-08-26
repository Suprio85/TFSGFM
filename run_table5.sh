#!/bin/bash
# Table 5: Few-shot node classification (3-shot and 5-shot)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESULTS_FILE="$SCRIPT_DIR/results_table5.txt"
cd "$SCRIPT_DIR/TFSGFM-node-classification"

# 3-shot evaluations
python main-homo.py --test_dataset Cora --train_datasets CiteSeer PubMed Photo Computers --shot_num 3 2>&1 | tee "$RESULTS_FILE"
python main-homo.py --test_dataset CiteSeer --train_datasets Cora PubMed Photo Computers --shot_num 3 2>&1 | tee -a "$RESULTS_FILE"
python main-homo.py --test_dataset PubMed --train_datasets Cora CiteSeer Photo Computers --shot_num 3 2>&1 | tee -a "$RESULTS_FILE"

# 5-shot evaluations
python main-homo.py --test_dataset Cora --train_datasets CiteSeer PubMed Photo Computers --shot_num 5 2>&1 | tee -a "$RESULTS_FILE"
python main-homo.py --test_dataset CiteSeer --train_datasets Cora PubMed Photo Computers --shot_num 5 2>&1 | tee -a "$RESULTS_FILE"
python main-homo.py --test_dataset PubMed --train_datasets Cora CiteSeer Photo Computers --shot_num 5 2>&1 | tee -a "$RESULTS_FILE"
