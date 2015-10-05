#!/usr/bin/env bash

cd ~/xoplax-lp
make clobber
cd ~/xoplax-lp
export PATH=~/bin:$PATH
export USE_CCACHE=1
source build/envsetup.sh 
lunch cm_$DEVICE-$BUILD_TYPE
make bacon
#brunch cm_rendang-userdebug

