#!/bin/bash

mkdir ~/.pip
echo [global] > ~/.pip/pip.conf
echo index-url=https://mirrors.huaweicloud.com/repository/pypi/simple >> ~/.pip/pip.conf
echo trusted-host=mirrors.huaweicloud.com >> ~/.pip/pip.conf
echo timeout=120 >> ~/.pip/pip.conf

pip install pip --upgrade
pip install cython
pip install numpy==1.15.1
pip install ipython scipy sympy matplotlib seaborn mkl 
pip install tqdm jupyter jupyterlab ipywidgets
pip install notebook --upgrade
pip install tornado --upgrade
pip install pandas==0.23.4
pip install xlrd==1.2.0
pip install tables -U
pip install hyperopt==0.1.1
pip install lifelines==0.14.6
pip install kmodes==0.9
pip install opencv-python scikit-image pillow requests lxml pyquery pyinstaller
pip install six numpy scipy Pillow matplotlib scikit-image opencv-python imageio Shapely
pip install imgaug
pip install librosa

pip install scikit-learn==0.19.2
pip install catboost==0.10.2
pip install lightgbm
pip install numba
pip install torch torchvision
pip install tensorflow==2.0.0a0
pip install logzero
pip install redis==2.10.6
pip install kombu==4.2.1
pip install pathos
pip install ipyparallel
pip install pygal
pip install pyclustering plotly networkx staticmodel pyecharts




