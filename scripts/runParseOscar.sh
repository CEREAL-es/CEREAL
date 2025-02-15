#!/bin/bash

#path=/netscratch/cristinae/oscar/colossal/01/03-15/es_meta
#path=/netscratch/cristinae/oscar/colossal/02/09-16/es_meta
#path=/netscratch/cristinae/oscar/colossal/03/11-17/es_meta
#path=/netscratch/cristinae/oscar/colossal/04/11-18/es_meta
#path=/netscratch/cristinae/oscar/colossal/05/05-19/es_meta
#path=/netscratch/cristinae/oscar/colossal/06/05-06-20/es_meta
#path=/netscratch/cristinae/oscar/colossal/07/10-20/es_meta
path=/netscratch/cristinae/oscar/colossal/08/11-12-21/es_meta
#path=/netscratch/cristinae/oscar/colossal/09/06-07-22/es_meta
#path=/netscratch/cristinae/oscar/colossal/10/05-06-23/es_meta

#for i in {1..7}
#do
   zstd -d $path/es_meta_part_$1.jsonl.zst
   python3 parseOscar.py $path/es_meta_part_$1.jsonl
   zstd $path/es_meta_part_$1.jsonl &
#done
