#!/bin/bash

gpg --keyserver hkps://keys.openpgp.org --recv-keys F467E54ACC52F1D2778826865B2977AEE5E4518F
curl -sSL https://downloads.apache.org/guacamole/KEYS | gpg --import -

