#!/bin/sh

function cdcmd() {
    pwd
    THIS="$1";
    if ! expr "$THIS" : '/.*' > /dev/null; then
        THIS=`which $THIS`;
    fi

    cd `dirname $THIS`
    pwd

    while [ -h "$THIS" ] ; do
        ls=`ls -ld "$THIS"`
        softlink=`expr "$ls" : '.*-> \(.*\)$'`
        cd `dirname $softlink`
        pwd

        if expr "$softlink" : '/.*' > /dev/null; then
            THIS="$softlink";
        else
            THIS=`dirname "$THIS"`/"$softlink";
        fi
    done 
}

