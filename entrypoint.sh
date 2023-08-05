#!/bin/bash

pip install -U pyplanet

exec server/manage.py start
