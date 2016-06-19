#!/bin/bash
######################################################################################
# Created by Ilya Krasnov on 2016/06/19
# Captures today's tasks. Prints monthly summary
######################################################################################

FILE=`date +%Y-%m`.md
PDF=`date +%Y-%m`.pdf
TODAY=`date +%F`
MONTH_TITLE=`date +'%B %Y'`

function line_to_file {
  echo "- $1" >> ${FILE}
}

function write_log {
  # Creates monthly file if needed
  if [ ! -e ${FILE} ]
  then
    touch ${FILE}
    echo "# ${MONTH_TITLE}" >> ${FILE}
  fi

  # Adds entries new days or appends to existing entry
  if grep -q "${TODAY}" ${FILE}
  then
    while read line
    do
      `gsed -i '/${TODAY}/a $line' ${FILE}`
      line_to_file $line
    done
  else
    printf "\n## ${TODAY} \n" >> ${FILE}
    while read line
    do
      line_to_file $line
    done
  fi
}

case $1 in
  '')
  write_log
    ;;
  summary)
    printf "Generation summary for ${MONTH_TITLE}\n"
    pandoc ${FILE} -s -o ${PDF}
    open ${PDF}
    ;;
esac
