#!/bin/bash
# Table 4: Homophily-only node classification (1-shot)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESULTS_FILE="$SCRIPT_DIR/results_table4.txt"
cd "$SCRIPT_DIR/TFSGFM-node-classification"

# Computers
python main-homo.py --test_dataset Computers --train_datasets Cora CiteSeer PubMed Photo --shot_num 1 2>&1 | tee "$RESULTS_FILE"

# Cora
python main-homo.py --test_dataset Cora --train_datasets CiteSeer PubMed Photo Computers --shot_num 1 2>&1 | tee -a "$RESULTS_FILE"

# CiteSeer
python main-homo.py --test_dataset CiteSeer --train_datasets Cora PubMed Photo Computers --shot_num 1 2>&1 | tee -a "$RESULTS_FILE"

# PubMed
python main-homo.py --test_dataset PubMed --train_datasets Cora CiteSeer Photo Computers --shot_num 1 2>&1 | tee -a "$RESULTS_FILE"

# Photo
python main-homo.py --test_dataset Photo --train_datasets Cora CiteSeer PubMed Computers --shot_num 1 2>&1 | tee -a "$RESULTS_FILE"
