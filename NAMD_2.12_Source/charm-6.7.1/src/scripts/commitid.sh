#!/bin/sh

# Get a string describing the current code, and compare it to the
# recorded value in VERSION. Copy over that if it's changed, so that
# Make sees a more recent file.

VOLD=""
if test -r VERSION
then
    VOLD=`cat VERSION`
fi

#git describe --long --dirty --always > VERSION.new || touch VERSION.new
(cd $SRCBASE && echo v6.7.1-0-gbdf6a1b-namd-charm-6.7.1-build-2016-Nov-07-136676) > VERSION.new || touch VERSION.new

VNEW=`cat VERSION.new`

if test -n "$VNEW" -a "$VOLD" != "$VNEW"
then
    cp VERSION.new VERSION
    echo Copying VERSION.new = $VNEW over VERSION = $VOLD
fi
