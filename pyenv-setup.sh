#!/bin/bash
exec "$SHELL"

##install pyenv latest python
pyenv install 3.11.4
pyenv local 3.11.4

##create venv
python -m venv venv
source venv/bin/activate
