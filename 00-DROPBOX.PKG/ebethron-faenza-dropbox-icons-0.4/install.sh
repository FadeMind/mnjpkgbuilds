#!/bin/bash
#
# @author Einar Uvsløkk <einar.uvslokk@linux.com>
# @date 2010-10-{27,29}
#
# Install script for Ebethron faenza dropbox icons.
# You will need to have a "latest from build" version of dropbox for these
# icons to be displayed in the notification area.
# Visit:
# 
#     http://forums.dropbox.com/topic.php?id=26476&replies=22
#
# and extract the appropriate tar.gz archive into your $HOME folder.
logo="""
  __ __ __ __    __ __ __ 
 /_ /_//_  / /_//_// // / faenza dropbox icons 0.4 
/_ /_//_  / / // \/_// /  by einar uvsløkk

"""
usage()
{
	echo """
This script will copy the folder structure including the dropbox icons to:
 
    $HOME/.icons/hicolor/
 
All you have to do is run:
 
    $0
 
"""
}

install_icons()
{
	echo """Running:
cp -r \\ 
    $SRC_PATH \\
    $DST_PATH"""

	cp -r "$SRC_PATH" "$DST_PATH"

	echo "Finished!"
}

if [ "$1" != "" ]; then
	echo $logo
	usage
	exit 0
fi


echo "$logo"
echo "Install icons for dark or light panels? [d|l|Q]"
read choice

case "$choice" in
	d*|D*) panel="dark" ;;
	l*|L*) panel="light" ;;
	*) panel="";;
esac

if [[ "$panel" == "" ]]; then
	echo -e "No icons will be installed!\nExiting the installer..."
	exit 0
fi

PWD=`pwd`
SRC_PATH=$PWD/$panel"-panel/hicolor"
DST_PATH=$HOME/.icons/

install_icons

exit 0
