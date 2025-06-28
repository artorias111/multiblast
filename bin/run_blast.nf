#!/usr/bin/env nextflow

process blastAll {
    conda params.blast_conda_env
    publishDir "${params.outdir}/blast_results", mode: 'copy'
    
    input:
        path query_file
        tuple val(db_name), path(db_files)
    
    output:
        path "*.blast.out", emit: blast_results
    
    script:
        def query_name = query_file.baseName
        """
        blastn -query ${query_file} \
        -db ${db_name} \
        -out ${query_name}_vs_${db_name}.blast.out \
        -outfmt 7
        """
}
