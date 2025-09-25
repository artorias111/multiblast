#!/usr/bin/env nextflow

process blastAll {
    conda params.blast_conda_env
    publishDir "${params.outdir}/blast_results", mode: 'copy'
    
    input:
        tuple path(query_file), val(db_name), path(db_files)
            
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

process tblastNAll {
    conda params.blast_conda_env
    publishDir "${params.outdir}/blast_results", mode: 'copy'
    
    input:
        tuple path(query_file), val(db_name), path(db_files)
            
    output:
        path "*.blast.out", emit: blast_results
    
    script:
        def query_name = query_file.baseName
        """
        tblastn -query ${query_file} \
        -db ${db_name} \
        -out ${query_name}_vs_${db_name}.blast.out \
        -outfmt 7
        """
}
