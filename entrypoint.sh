#!/bin/bash

pip install -U pyplanet
cp /pyplanet/map/manager.py /usr/local/lib/python3.8/site-packages/pyplanet/contrib/map/manager.py

exec server/manage.py start
