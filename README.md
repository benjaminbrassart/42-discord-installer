At 42, the Discord client is not updated as soon as an update comes out.
This script makes it easy to install the version of Discord you want.

To use this script, you just have to execute it, like this:
```sh
./install-discord.sh
```

In case a new version of Discord is released, you can override the default version by setting the `DISCORD_VERSION` environment variable:
```sh
DISCORD_VERSION=0.0.25 ./install-discord.sh
```

You can also override the installation path by setting the `DISCORD_INSTALL_DIR` environment variable:
```sh
DISCORD_INSTALL_DIR=~/.local/discord ./install-discord.sh
```

You can of course override both variables if you need.

This script does not remove old versions of Discord. However, you can retrieve a list of the installation directories by doing something like this:
```sh
find ~/.local/share/applications/ -name 'discord-*.desktop' -exec grep -E '^Exec=' {} \; | cut -c 6- | xargs dirname
```
