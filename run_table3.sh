#!/bin/bash
# Table 3: Mixed homophily-heterophily node classification (1-shot)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESULTS_FILE="$SCRIPT_DIR/results_table3.txt"
cd "$SCRIPT_DIR/TFSGFM-node-classification"

# Cora
python main-mix.py --test_dataset Cora --train_datasets CiteSeer PubMed Cornell Chameleon Squirrel --epochs 400 --svd_k 256 --hidden_dimension 256 --out_dimension 256 --DAD 5 2>&1 | tee "$RESULTS_FILE"

# CiteSeer
python main-mix.py --test_dataset CiteSeer --train_datasets Cora PubMed Cornell Chameleon Squirrel --epochs 400 --svd_k 256 --hidden_dimension 256 --out_dimension 256 --DAD 5 2>&1 | tee -a "$RESULTS_FILE"

# PubMed
python main-mix.py --test_dataset PubMed --train_datasets Cora CiteSeer Cornell Chameleon Squirrel --epochs 400 --svd_k 256 --hidden_dimension 256 --out_dimension 256 --DAD 5 2>&1 | tee -a "$RESULTS_FILE"

# Cornell
python main-mix.py --test_dataset Cornell --train_datasets Cora CiteSeer PubMed Chameleon Squirrel --epochs 500 --svd_k 16 --hidden_dimension 256 --out_dimension 32 --DAD 0 2>&1 | tee -a "$RESULTS_FILE"

# Squirrel
python main-mix.py --test_dataset Squirrel --train_datasets Cora CiteSeer PubMed Cornell Chameleon --epochs 400 --svd_k 512 --hidden_dimension 16 --out_dimension 256 --DAD 0 2>&1 | tee -a "$RESULTS_FILE"

# Chameleon
python main-mix.py --test_dataset Chameleon --train_datasets Cora CiteSeer PubMed Cornell Squirrel --epochs 300 --svd_k 16 --hidden_dimension 2048 --out_dimension 16 --DAD 4 2>&1 | tee -a "$RESULTS_FILE"
