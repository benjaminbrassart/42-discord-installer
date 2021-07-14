#!/bin/sh

cd /tmp
curl -Lo discord.tgz https://dl.discordapp.net/apps/linux/0.0.15/discord-0.0.15.tar.gz
tar xf discord.tgz
sed -i '/^Exec=/d' Discord/discord.desktop
echo "Exec=$HOME/.local/Discord/Discord" >> Discord/discord.desktop
mv Discord $HOME/.local/Discord

cd $HOME/.local/Discord
mv discord.desktop $HOME/.local/share/applications/discord.desktop