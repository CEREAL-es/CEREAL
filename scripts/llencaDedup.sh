
procs=40
num_unks=44
langs=('ad' 'ar' 'bo' 'cl' 'co' 'cr' 'cu' 'do' 'ec' 'es' 'gq' 'gt' 'hn' 'mx' 'ni' 'pa' 'pe' 'ph' 'pr' 'py' 
'sv' 'uy' 've' 'us' 'cat' 'eus' 'gal')
label='2020_10'

#for lan in "${langs[@]}"
#  do
#   nohup srun  --ntasks 1 --gpus-per-task 0 --cpus-per-task $procs bash deduplica.sh $lan $procs $label &
#  done

#for part in {1..44}
#  do
#   nohup srun -p RTXA6000 --ntasks 1 --gpus-per-task 0 --cpus-per-task $procs bash deduplicaUNK.sh $part $procs $label &
#  done


cat  es_meta.uniq.*.unk >  es_meta.uniq.unk
nohup srun -p RTXA6000 --ntasks 1 --gpus-per-task 0 --cpus-per-task $procs bash deduplicaUNK.sh 0 $procs $label
sed -i "s/^/$label	/" es_meta.uniq.$label.unk


# -p RTXA6000
# -p V100-32GB
