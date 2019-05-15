#!/usr/bin/env bash
# Copyright 2009 The Go Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -e
if [ ! -f make.bash ]; then
	echo 'all.bash must be run from $GOROOT/src' 1>&2
	exit 1
fi
OLDPATH="$PATH"
export GO_EXTLINK_ENABLED=1
export BOOT_GO_LDFLAGS='-extldflags='"${configure_mplsldflags}"''
. ./make.bash "$@" --no-banner
unset GO_EXTLINK_ENABLED
unset BOOT_GO_LDFLAGS
bash run.bash --no-rebuild
PATH="$OLDPATH"
$GOTOOLDIR/dist banner  # print build info
