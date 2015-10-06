#!/usr/bin/env bash

echo "Set current directory to source.."
cd ~/xoplax-$AV
make clobber | grep Entire
echo "Set current directory again.."
cd ~/xoplax-$AV
export PATH=~/bin:$PATH:/usr/bin:/sbin
echo "Make sure CCACHE is used.."
export USE_CCACHE=1
ccache -M 16G
export HOST_USE_PIPE=true
source build/envsetup.sh 
echo "Syncing build tree.."
repo sync -j$JOB_NUMBER
echo "Lunching device.."
lunch cm_$DEVICE-$BUILD_TYPE
echo "Starting the real build!"
make bacon -j$JOB_NUMBER

