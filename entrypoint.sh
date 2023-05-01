#!/bin/bash

pip install pyplanet --upgrade

exec server/manage.py start
