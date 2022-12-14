#!/bin/bash

python3 -m venv venv
venv/bin/pip install coverage==6.5.0

venv/bin/coverage erase
venv/bin/coverage run -m tests
venv/bin/coverage xml -o coverage.xml
cat coverage.xml

venv/bin/coverage erase
venv/bin/coverage run --rcfile maybe_coveragerc -m tests
venv/bin/coverage xml --rcfile maybe_coveragerc -o coverage.maybe.xml
cat coverage.maybe.xml
