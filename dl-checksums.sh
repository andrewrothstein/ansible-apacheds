#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://downloads.apache.org/directory

dl() {
    local app=$1
    local ver=$2
    local archive_type=${3:-tar.gz}
    local file=${app}-${ver}.${archive_type}
    local url=${MIRROR}/${app}/dist/${ver}/${file}.sha512
    printf "  # %s\n" $url
    printf "  '%s': sha512:%s\n" $ver $(curl -SsL $url | tr '\n' ' ' | tr -s '[:blank:]' ' ' | sed -e 's/ //g' | awk -F ':' '{print $2}')
}

# https://downloads.apache.org/directory/apacheds/dist/2.0.0.AM26/apacheds-2.0.0.AM26.tar.gz.sha512
dl apacheds 2.0.0.AM26
