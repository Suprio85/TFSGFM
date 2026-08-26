#!/bin/bash
# Table 7: Data ablation study on the number of source domains
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESULTS_FILE="$SCRIPT_DIR/results_table7.txt"
cd "$SCRIPT_DIR/TFSGFM-node-classification"

# Target: PubMed
python main-mix.py --test_dataset PubMed --train_datasets Cora 2>&1 | tee "$RESULTS_FILE"
python main-mix.py --test_dataset PubMed --train_datasets Cora CiteSeer 2>&1 | tee -a "$RESULTS_FILE"
python main-mix.py --test_dataset PubMed --train_datasets Cora CiteSeer Wisconsin 2>&1 | tee -a "$RESULTS_FILE"

# Target: Wisconsin
python main-mix.py --test_dataset Wisconsin --train_datasets Texas 2>&1 | tee -a "$RESULTS_FILE"
python main-mix.py --test_dataset Wisconsin --train_datasets Texas Cornell 2>&1 | tee -a "$RESULTS_FILE"
python main-mix.py --test_dataset Wisconsin --train_datasets Texas Cornell Cora 2>&1 | tee -a "$RESULTS_FILE"

# Target: Chameleon
python main-mix.py --test_dataset Chameleon --train_datasets Wisconsin 2>&1 | tee -a "$RESULTS_FILE"
python main-mix.py --test_dataset Chameleon --train_datasets Wisconsin Squirrel 2>&1 | tee -a "$RESULTS_FILE"
python main-mix.py --test_dataset Chameleon --train_datasets Wisconsin Squirrel Cora 2>&1 | tee -a "$RESULTS_FILE"
