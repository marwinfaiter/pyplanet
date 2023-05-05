FROM python:3.8.15-bullseye

COPY --chmod=+x entrypoint.sh /entrypoint.sh

RUN pip install pyplanet

WORKDIR /pyplanet

RUN pyplanet init_project server

COPY contrib/map/manager.py /usr/local/lib/python3.8/site-packages/pyplanet/contrib/map/manager.py
COPY settings/base.py /pyplanet/server/settings/base.py
COPY settings/apps.py /pyplanet/server/settings/apps.py

ENTRYPOINT ["/entrypoint.sh"]
