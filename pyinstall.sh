#!/bin/sh

export WORKON_HOME=~/virtualenvs

mkdir -p $WORKON_HOME

source /usr/bin/virtualenvwrapper.sh

mkvirtualenv py3

install_pip() {
    pip install $1
}

PIP_LIST=(
    chaospy
    ipython
    matplotlib
    numpy
    pandas
    scikit-learn
    scikit-rf
    scipy
    sympy
)

for name in "${PIP_LIST[@]}"; do
    install_pip $name
done

deactivate
