# This script shows basic statistics for a given bam file.

# USEAGE: sh ./bam_stat.sh bamfile.bam 

READ_NUM=`samtools view ${1} | wc -l `

UNIQUE_site=`samtools view ${1} | cut -f 3,4 | uniq |wc -l`

bedtools genomecov -ibam ${1} -d > ${1}.genome_perbase_cov.txt

eval $(awk 'BEGIN{one=0;three=0}{if($3>=3){three++;one++}else if($3>=1)one++}END{print "one=",one;"three=",three}'  ${1}.genome_perbase_cov.txt)

rm ${1}.map.rep.txt

echo "$READ_NUM" >> ${1}.map.rep.txt
echo "$UNIQUE_site" >> ${1}.map.rep.txt
echo "$one" >> ${1}.map.rep.txt
echo "$thres" >> ${1}.map.rep.txt
