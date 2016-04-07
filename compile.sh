#!/bin/sh
echo "Clearing old compiled.rc"
rm compiled.rc
touch compiled.rc
echo "Compiling..."
cat Init.txt >> compiled.rc
cat HDAForceMore.txt >> compiled.rc
cat HDAtravelPre.txt >> compiled.rc
cat HDAMessageColors.txt >> compiled.rc
cat HDAItemColors.txt >> compiled.rc
# Lua files inside {}
echo '{' >> compiled.rc
cat Helpers.lua >> compiled.rc
cat SpoilerAlerts.lua >> compiled.rc
cat HDamage.lua >> compiled.rc
cat HDAtravel.lua >> compiled.rc
echo '}' >> compiled.rc
cat HilariousDeathArtist.txt >> compiled.rc
echo "Compile finished"
