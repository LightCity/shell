#!/bin/sh
for subdir in $(ls -p .)
do
    #echo ${subdir}
    if test -d ${subdir} && [ -e ${subdir}/.git ]; then
        cd ${subdir}
        pwd
        if [ -n "$1" ]; then
            eval $1
        else
            # 默认操作
            git remote -v
        fi
        cd ..
    else
        echo "\t\t目录\"${subdir}\"不是有效的git项目"
    fi
    echo '\n'
done
