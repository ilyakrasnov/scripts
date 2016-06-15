#!/bin/bash
SCRIPT=${1}.sh
AUTHOR="Ilya Krasnov"
TIMESTAMP=`date +%Y/%m/%d`

if [ -e ${SCRIPT} ]
then
  echo "${SCRIPT} already exists."
  exit 1
else
  touch $SCRIPT
  echo "#!/bin/bash" >> $SCRIPT
  printf "# created by ${AUTHOR} on ${TIMESTAMP}\n" >> $SCRIPT

  chmod 775 $SCRIPT
fi

