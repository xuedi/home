#!/bin/sh
export LC_TIME=en_DK.utf-8
[ "$LC_ALL" != "$LC_TIME" ] && unset LC_ALL # only necessary if set to something different from LC_TIME
exec pcmanfm "$@"
