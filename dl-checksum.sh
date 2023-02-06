#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://download.docker.com

dl()
{
    local ver=$1
    local app=$2
    local os=$3
    local arch=$4
    local url=$MIRROR/$os/static/stable/$arch/$app-$ver.tgz
    local lfile=$DIR/$app-$os-$arch-$ver.tgz

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $arch `sha256sum $lfile | awk '{print $1}'`
}

dl_ver_root () {
    local ver=$1

    printf "  '%s':\n" $ver
    printf "    %s:\n" linux
    dl $ver docker linux aarch64
    dl $ver docker linux armel
    dl $ver docker linux armhf
    dl $ver docker linux x86_64
    printf "    %s:\n" mac
    dl $ver docker mac x86_64
    dl $ver docker mac aarch64
}

dl_ver_rootless() {
    local ver=$1

    printf "  '%s':\n" $ver
    printf "    %s:\n" linux
    dl $ver docker-rootless-extras linux aarch64
    dl $ver docker-rootless-extras linux armel
    dl $ver docker-rootless-extras linux armhf
    dl $ver docker-rootless-extras linux x86_64
}

dl_ver() {
    local ver=$1
    dl_ver_root $ver >> defaults/main/checksums.yml
    dl_ver_rootless $ver >> defaults/main/rootless-checksums.yml
}

dl_ver 20.10.19
#dl_ver 20.10.20
#dl_ver 20.10.21
#dl_ver 20.10.22
#dl_ver 20.10.23
#dl_ver ${1:-23.0.0}
