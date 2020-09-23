#!/bin/sh

export WORKON_HOME=~/virtualenvs

mkdir -p $WORKON_HOME

source /usr/bin/virtualenvwrapper.sh

mkvirtualenv py3

install_pip() {
    pip install $1
}

PIP_LIST=(
    ipython
    scipy
    numpy
    pandas
    matplotlib
    scikit-rf
    scikit-learn
    sympy
    chaospy
)

for name in "${PIP_LIST[@]}"; do
    install_pip $name
done

deactivate
