"""
This file contains the apps & apps settings and overrides the default ones that are defined in the core.
Documentation: http://pypla.net/

If you want to use other configuration methods like YAML or JSON files, take a look at http://pypla.net/ and head to the
configuration pages.
"""

# In the apps dictionary and array you configure the apps (or plugins) are loaded for specific pools (controllers).
# Be aware that the list will *ALWAYS* be prepended after the mandatory defaults are loaded in place.
# The mandatory defaults are specific per version, refer to the documentation:
# DOCUMENTATION: http://pypla.net/
import os
import sys
import subprocess

def apps_environment_to_list():
    apps = []
    for app_list in os.environ.get("APPS", "").split(";"):
        if len(app_list.split("|")) > 1:
            apps_csv, url = app_list.split("|")
        else:
            apps_csv, url = app_list, None

        for app in apps_csv.split(","):
            if url:
                subprocess.check_call([sys.executable, "-m", "pip", "install", "-U", "-i", url, app])
            else:
                subprocess.check_call([sys.executable, "-m", "pip", "install", "-U", "", app])
            apps.append(app)

    return apps


APPS = {
        'default': [
                'pyplanet.apps.contrib.admin',
                'pyplanet.apps.contrib.jukebox',
                'pyplanet.apps.contrib.karma',
                'pyplanet.apps.contrib.local_records',
                'pyplanet.apps.contrib.dedimania',  # Will be disabled in Shootmania automatically.
                'pyplanet.apps.contrib.players',
                'pyplanet.apps.contrib.info',
                'pyplanet.apps.contrib.mx',
                'pyplanet.apps.contrib.transactions',
                'pyplanet.apps.contrib.sector_times',
                'pyplanet.apps.contrib.clock',
                'pyplanet.apps.contrib.funcmd',

                # You can optionally enable one of the following apps. Please look at this page for more information:
                # http://pypla.net/#app-docs

                # Live Ranking App. Useful when playing in Laps, Rounds and all sort of Trackmania game modes.
                'pyplanet.apps.contrib.live_rankings',

                # Best CP Widget on top of the screen for the Trackmania game.
                'pyplanet.apps.contrib.best_cps',

                # Use chat-based votes instead of the callvotes of the dedicated server with the voting app.
                'pyplanet.apps.contrib.voting',

                # Dynamic Points Limit is meant for Shootmania Royal.
                # 'pyplanet.apps.contrib.dynamic_points',

                # Waiting Queue. Enable on limited player servers to fairly queue players.
                # 'pyplanet.apps.contrib.queue',

                # Music Server App. Enable to queue your music together on the server.
                # 'pyplanet.apps.contrib.music_server',

                # New since 0.10.0, rankings:
                'pyplanet.apps.contrib.rankings',
                *apps_environment_to_list()
        ]
}
