#!/bin/bash

pip install -U pyplanet
pip install -i https://nexus.buddaphest.se/repository/pypi/simple -U it-thexivn-random-maps-together

exec server/manage.py start
