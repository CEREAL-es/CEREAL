lan=$1
procs=$2
label=$3

sort  --parallel=$procs  -T /netscratch/cristinae/   -t '	' -k 3,3  -uo es_meta.uniq1.$lan es_meta.$lan
sort  --parallel=$procs  -T /netscratch/cristinae/  -t '	' -k 2,2  -uo es_meta.uniq.$label.$lan es_meta.uniq1.$lan
rm es_meta.uniq1.$lan

sed -i "s/^/$label	/" es_meta.uniq.$label.$lan

# nohup srun -p RTXA6000 --ntasks 1 --gpus-per-task 0 --cpus-per-task 20 bash deduplica.sh &

