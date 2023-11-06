#!/bin/bash

pip install -U pyplanet
cp /pyplanet/map/manager.py /usr/local/lib/python3.8/site-packages/pyplanet/contrib/map/manager.py
pip install -i https://nexus.buddaphest.se/repository/pypi/simple -U it-thexivn-random-maps-together

exec server/manage.py start
