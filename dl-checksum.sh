#!/usr/bin/env sh
VER='19.03.1'
DIR=~/Downloads
MIRROR=https://download.docker.com

dl()
{
    OS=$1
    PLATFORM=$2
    FILE=docker-$VER.tgz
    URL=$MIRROR/$OS/static/stable/$PLATFORM/$FILE
    LFILE=$DIR/docker-$OS-$PLATFORM-$VER.tgz

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "      # %s\n" $URL
    printf "      %s: sha256:%s\n" $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  '%s':\n" $VER
printf "    %s:\n" linux
dl linux aarch64
dl linux armel
dl linux armhf
dl linux x86_64
printf "    %s:\n" mac
dl mac x86_64


