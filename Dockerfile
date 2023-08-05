FROM python:3.8.15-slim-bullseye AS base


RUN pip install pyplanet

WORKDIR /pyplanet

RUN pyplanet init_project server

COPY contrib/map/manager.py /usr/local/lib/python3.8/site-packages/pyplanet/contrib/map/manager.py
COPY settings/base.py /pyplanet/server/settings/base.py
ENTRYPOINT ["/entrypoint.sh"]

FROM base AS standard
COPY --chmod=+x entrypoint.sh /entrypoint.sh
COPY settings/apps.py /pyplanet/server/settings/apps.py


FROM base AS rmt
COPY --chmod=+x entrypoint-rmt.sh /entrypoint.sh
COPY settings/apps-rmt.py /pyplanet/server/settings/apps.py
