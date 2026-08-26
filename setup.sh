#!/bin/bash
# TFSGFM - Dependency installation (CUDA 12.4)
set -e

pip install torch==2.6.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
pip install torch-geometric
pip install torch-scatter -f https://data.pyg.org/whl/torch-2.6.0+cu124.html
pip install scikit-learn scipy networkx numpy
