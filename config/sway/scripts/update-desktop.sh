#!/bin/sh
# https://forum.garudalinux.org/t/adding-an-application-to-wofi/17048
echo "Validating the desktop entry..."
desktop-file-validate $1
if [ $? -ne 0 ]; then
	exit 1
fi

echo "The desktop entry has been validated."

echo "Installing desktop entry $(echo $1) to ~/.local/share/applications"
desktop-file-install --dir=$HOME/.local/share/applications $1


echo "Updating the desktop database..."
update-desktop-database ~/.local/share/applications

if [ $? -ne 0 ]; then
	exit 1
fi

echo "The desktop database has been updated."