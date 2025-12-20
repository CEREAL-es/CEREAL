variants=('ad' 'ar' 'bo' 'cl' 'co' 'cr' 'cu' 'do' 'ec' 'es' 'gq' 'gt' 'hn' 'mx' 'ni' 'pa' 'pe' 'ph' 'pr' 'py' 'sv' 'uy' 've'
 'us' 'cat' 'eus' 'gal')

for j in "${variants[@]}"
   do for i in {1..7}
     do cat es_meta_part_$i.jsonl.$j >> es_meta.$j
done
done
