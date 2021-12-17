#!/bin/bash

# taken from
# https://github.com/openinput-fw/openinput-kicad-library/blob/656f9bf9932d737c5ace5ab5ce8259bd0d7e17f3/release.sh

name="muonpi-kicad-library"
lib_files="./symbols ./footprints ./3dmodels ./resources ./metadata.json"

# TODO write metadatas dynamically,
# (pack side and kicad repo side)
# rewrite in python

# Pack
zip -q -r ./${name}.zip ${lib_files}

# Compute checksum
echo "          \"download_sha256\": \"$(sha256sum ./${name}.zip | sed -E 's/\s(.*)//;t;d')\","


# Compute download size
echo "          \"download_size\": \"$(du -csb ./${name}.zip | grep total | sed 's/ *\stotal* *\(.*\)/\1/')\","


# Compute install size
echo "          \"install_size\": \"$(du -csb ${lib_files} | grep total | sed 's/ *\stotal* *\(.*\)/\1/')\""

