#!/usr/bin/env nextflow

process makeDb {
    conda params.blast_conda_env
    publishDir "${params.outdir}/databases", mode: 'copy'
    
    input:
        path fasta_file
    
    output:
        tuple val(fasta_file.baseName), path("*.nhr"), path("*.nin"), path("*.nsq"), path("*.nog"), path("*.not"), path("*.ntf"), path("*.nto"), emit: db_files
    
    script:
        def db_name = fasta_file.baseName
        """
        makeblastdb -in ${fasta_file} -dbtype nucl -out ${db_name} -parse_seqids
        """
}
