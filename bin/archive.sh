#!/bin/sh

BASEDIR=`dirname $0`
PROJECTDIR=${BASEDIR}/..
#PROJECTDIR=`echo $(cd ${BASEDIR}/.. && pwd )`

if [ ! -e ${PROJECTDIR}/target ]; then
  mkdir ${PROJECTDIR}/target
fi

ARCHIVENAME=`echo $(cd ${PROJECTDIR} && pwd) | awk -F "/" '{print $(NF)}'`

#zip -x ${PROJECTDIR}/target -r ${PROJECTDIR}/target/${ARCHIVENAME}.zip ${PROJECTDIR}
if [ ! -e ${PROJECTDIR}/target/${ARCHIVENAME}.zip ]; then
  cd ${PROJECTDIR} && zip -x target/ -r target/${ARCHIVENAME}.zip .
else
  echo "${ARCHIVENAME}.zip exists"
fi
