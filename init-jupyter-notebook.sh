#!/bin/bash
# wget https:https://gist.github.com/roymanigley/e703b399acc48e44c8e13c3f18980566 -O init-jupyter-notebook.sh && source init-jupyter-notebook.sh

if [ ! -d .venv ]
then
  python3 -m venv .venv && \
  source .venv/bin/activate && \
  pip install --upgrade pip && \
  pip install notebook matplotlib numpy pandas seaborn folium sklearn requests && \
  pip freeze > requirements.txt
  echo .venv > .gitignore && \
  git init && git add . && git commit -m"initial commit"
else
  source .venv/bin/activate && \
  pip install -r requirements.txt
fi	
mkdir notebooks -p && \
jupyter notebook notebooks