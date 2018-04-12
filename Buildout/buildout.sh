#!/bin/sh

git config --global user.email ""
git config --global user.name ""
virtualenv sandbox --no-setuptools
sandbox/bin/python bootstrap.py -c devel_buildoutVT.cfg
bin/buildout -c devel_buildoutVT.cfg
