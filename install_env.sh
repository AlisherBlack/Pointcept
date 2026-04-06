set -eu


conda env create -f environment.yml --verbose
conda activate pointcept

pip install spconv-cu124 --index-url https://pypi.org/simple 
pip install torch-scatter -f https://data.pyg.org/whl/torch-2.5.0+cu124.html --index-url https://pypi.org/simple