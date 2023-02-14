#!/bin/sh

set -e

LATEST_DISCORD_VERSION='0.0.25'
DEFAULT_INSTALL_DIR="/sgoinfre/goinfre/Perso/${USER}/Discord"

if [ -z "${DISCORD_VERSION}" ]; then
    DISCORD_VERSION="${LATEST_DISCORD_VERSION}"
fi

if [ -z "${DISCORD_INSTALL_DIR}" ]; then
    DISCORD_INSTALL_DIR="${DEFAULT_INSTALL_DIR}"
fi

TAR_NAME="$(mktemp)"

# change this as you need
INSTALL_DATE="$(date)"

# create installation directory
mkdir -p "${DISCORD_INSTALL_DIR}"

# check installation directory
if [ -d "${DISCORD_INSTALL_DIR}/${DISCORD_VERSION}" ]; then
    printf -- 'Installation directory already exists.\n'
    exit 1
fi

TMP_DIR="$(mktemp -d)"
cd "${TMP_DIR}"

# download archive
curl -SsL -o "${TAR_NAME}" "https://dl.discordapp.net/apps/linux/${DISCORD_VERSION}/discord-${DISCORD_VERSION}.tar.gz"

# extract archive
tar xf "${TAR_NAME}"
rm -f "${TAR_NAME}"

# move extracted archive to installation directory
mv ./Discord "${DISCORD_INSTALL_DIR}/${DISCORD_VERSION}"

# create desktop entry directory
mkdir -p "${HOME}/.local/share/applications"

# create desktop entry
cat > "${HOME}/.local/share/applications/discord-${DISCORD_VERSION}.desktop" << EOF
[Desktop Entry]
Name=Discord ${DISCORD_VERSION}
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=${DISCORD_INSTALL_DIR}/${DISCORD_VERSION}/Discord
Icon=${DISCORD_INSTALL_DIR}/${DISCORD_VERSION}/discord.png
Type=Application
Categories=Network;InstantMessaging;

# installed with install-discord.sh
# ${INSTALL_DATE}
EOF
