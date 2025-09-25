# multiblast
You have a query, but you want to search it against multiple databases, here's your solution. 

## Quick start
```shell
# Pull directly from github and work
nextflow run artorias111/multiblast --db_dir ../subjects --query ../cr-1_line82/cr-1.fa

# Quick run with the preset database
nextflow run artorias111/multiblast --query /some/query/file.fa

# if you have a protein query instead of a nucleotide query
nextflow run artorias111/multiblast --runMode protein_query --query /some/query/file.fa --db_dir /path/to/db/dir
```

