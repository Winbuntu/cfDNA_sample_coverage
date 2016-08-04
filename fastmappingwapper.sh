#!/bin/bash
# myFunc2FastWrapper.sh
echo $SGE_TASK_ID
sh ./bam_stat.sh  `sed -n ${SGE_TASK_ID}p files.txt`
