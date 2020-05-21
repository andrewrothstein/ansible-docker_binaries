#!/usr/bin/env sh
VER=${1:-19.03.9}
DIR=~/Downloads
MIRROR=https://download.docker.com

dl()
{
    local app=$1
    local os=$2
    local arch=$3
    local url=$MIRROR/$os/static/stable/$arch/$app-$VER.tgz
    local lfile=$DIR/$app-$os-$arch-$VER.tgz

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $arch `sha256sum $lfile | awk '{print $1}'`
}

printf "docker_binaries_checksums:\n"
printf "  '%s':\n" $VER
printf "    %s:\n" linux
dl docker linux aarch64
dl docker linux armel
dl docker linux armhf
dl docker linux x86_64
printf "    %s:\n" mac
dl docker mac x86_64


printf "docker_rootless_extras_checksums:\n"
printf "  '%s':\n" $VER
printf "    %s:\n" linux
dl docker-rootless-extras linux aarch64
dl docker-rootless-extras linux armel
dl docker-rootless-extras linux armhf
dl docker-rootless-extras linux x86_64
