#!/bin/bash

set -ex

# https://github.com/psifidotos/applet-window-buttons
mkdir ~/applets
cd ~/applets
git clone https://github.com/psifidotos/applet-window-buttons.git
cd applet-window-buttons/
sh install.sh

# https://github.com/psifidotos/Latte-Dock/wiki/F.A.Q.#q-can-i-use-my-super-key-to-open-the-app-launcher
kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.lattedock,/Latte,org.kde.LatteDock,activateLauncherMenu"
qdbus org.kde.KWin /KWin reconfigure
