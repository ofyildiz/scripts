#!/bin/sh

cd ~
export WORKON_HOME=~/virtualenvs
mkdir -p $WORKON_HOME
source /usr/bin/virtualenvwrapper.sh
mkvirtualenv py3
pip install ipython scipy numpy pandas matplotlib scikit-rf scikit-learn sympy chaospy
deactivate
