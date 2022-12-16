#!/bin/bash

set -vx

python3 -m venv venv
venv/bin/python --version --version
#venv/bin/pip install coverage==6.5.0
venv/bin/pip install 'coverage @ git+https://github.com/nedbat/coveragepy@d20c1d0329b585920cf8b1a36af5d2d9c4bba155'

venv/bin/coverage debug sys
venv/bin/pip freeze --all

for label in no_source source source_pkgs
do
  venv/bin/coverage erase
  venv/bin/coverage run --rcfile coveragerc.${label} -m tests
  venv/bin/coverage xml --rcfile coveragerc.${label} -o coverage.${label}.xml
  cat coverage.${label}.xml
done

#venv/bin/coverage erase
#venv/bin/coverage run -m tests
#venv/bin/coverage xml -o coverage.noconfig.xml
#cat coverage.noconfig.xml
#
#venv/bin/coverage erase
#venv/bin/coverage run --rcfile coveragerc.source -m tests
#venv/bin/coverage xml --rcfile coveragerc.source -o coverage.source.xml
#cat coverage.source.xml
#
#venv/bin/coverage erase
#venv/bin/coverage run --rcfile coveragerc.source_pkgs -m tests
#venv/bin/coverage xml --rcfile coveragerc.source_pkgs -o coverage.source_pkgs.xml
#cat coverage.source_pkgs.xml
