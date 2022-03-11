#!/bin/sh

export WORKON_HOME=~/virtualenvs

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

mkdir -p $WORKON_HOME

source /usr/bin/virtualenvwrapper.sh

mkvirtualenv py3

PIP_LIST=(
    chaospy
    control
    ipython
    matplotlib
    numpy
    pandas
    pygame
    scikit-learn
    scikit-rf
    scipy
    sympy
)

for name in "${PIP_LIST[@]}"; do
    pip install $name
done

deactivate
