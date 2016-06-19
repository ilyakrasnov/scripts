#!/bin/bash
######################################################################################
# Created by Ilya Krasnov on 2016/06/19
# Captures today's tasks. Prints monthly summary
######################################################################################

FILE=`date +%Y-%m`.md
TODAY=`date +%F`
MONTH_TITLE=`date +'%B %Y'`

# Creates md file for a given month
if [ ! -e ${FILE} ]
then
  touch ${FILE}
  echo "# ${MONTH_TITLE}" >> ${FILE}
fi

# Check if there is already an entry for a given date
if grep -q "${TODAY}" ${FILE}
then
  while read line
  do
    `gsed -i '/${TODAY}/a $line' ${FILE}`
  echo "- $line" >> ${FILE}
  done #< "${1:-/dev/stdin}"
else
  printf "\n## ${TODAY} \n" >> ${FILE}
  while read line
  do
    echo "- $line" >> ${FILE}
  done #< "${1:-/dev/stdin}"
fi

