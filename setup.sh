#!/bin/bash
# TFSGFM - Dependency installation (CUDA 12.4)
set -e

pip install torch==2.6.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
pip install torch-geometric
pip install torch-scatter torch-sparse torch-cluster torch-spline-conv -f https://data.pyg.org/whl/torch-2.6.0+cu124.html
pip install scikit-learn==1.6.1 scipy==1.13.1 networkx==3.2.1 numpy==2.0.1
