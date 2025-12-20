from huggingface_hub import snapshot_download,hf_hub_download

#hf_hub_download(repo_id="oscar-corpus/colossal-oscar-1.0",filename="03-15/es_meta/es_meta_part_1.jsonl.zst",local_dir="/netscratch/cristinae/oscar/colossal/01",repo_type="dataset")
snapshot_download(repo_id="oscar-corpus/colossal-oscar-1.0", allow_patterns=["05-06-23/es_meta/*"],local_dir="/netscratch/cristinae/oscar/colossal/10",repo_type="dataset")
