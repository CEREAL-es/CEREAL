for i in {1..33}
do
  ( nohup srun -p RTXA6000 --ntasks 1 --gpus-per-task 0 --cpus-per-task 1  bash runParseOscar.sh $i> log8_$i) &
done

#-p RTXA6000 
