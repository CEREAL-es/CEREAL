part=$1
procs=$2
label=$3

if [ $part -gt 0 ]
then
  sort  --parallel=$procs -t '	' -k 3,3  -uo es_meta.uniq1.$part.unk es_meta_part_$part.jsonl.unk
  sort  --parallel=$procs -t '	' -k 2,2  -uo es_meta.uniq.$part.unk es_meta.uniq1.$part.unk
  rm es_meta.uniq1.$part.unk
else
  sort  --parallel=$procs -T /netscratch/cristinae/ -t '	' -k 3,3  -uo es_meta.uniq1.unk es_meta.uniq.unk
  sort  --parallel=$procs -T /netscratch/cristinae/ -t '	' -k 2,2  -uo es_meta.uniq.$label.unk es_meta.uniq1.unk
  rm es_meta.uniq1.unk
fi


# sed -i "s/^/$label	/" es_meta.uniq.$label.$part.unk

