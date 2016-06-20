#!/bin/bash
######################################################################################
# Created by Ilya Krasnov on 2016/06/15
# Creates a template of a new script with author and description
######################################################################################

SCRIPT=${1}
AUTHOR="Ilya Krasnov"
TIMESTAMP=`date +%Y/%m/%d`

if [ -e ${SCRIPT} ]
then
  echo "${SCRIPT} already exists."
  exit 1
else
  echo -n 'Enter description: '
  read DESCRIPTION
  touch $SCRIPT
  echo "#!/bin/bash" >> $SCRIPT
  printf "######################################################################################\n" >> $SCRIPT
  printf "# Created by ${AUTHOR} on ${TIMESTAMP}\n" >> $SCRIPT
  printf "# ${DESCRIPTION}\n" >> $SCRIPT
  printf "######################################################################################\n\n" >> $SCRIPT

  chmod 775 $SCRIPT
  exit 0
fi

