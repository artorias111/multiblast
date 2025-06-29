#!/usr/bin/env nextflow

/*
 * MultiBLAST Pipeline
 * Creates databases in parallel for multiple subjects and runs BLAST in parallel
 */

// Include process modules
include { makeDb } from './bin/makedb.nf'
include { blastAll } from './bin/run_blast.nf'
// include { publishResults } from './bin/parse_out.nf'

// Define the workflow
workflow {
    // Input validation
    if (!params.query) {
        error "Query file not specified. Use --query"
    }
    if (!params.db_dir) {
        error "Database directory not specified. Use --db_dir"
    }
    
    // query file channel
    query_ch = Channel.fromPath(params.query)

    // db dir channel
    db_files_ch = Channel.fromPath("${params.db_dir}/*.fasta")
    
    // Create databases in parallel
    makeDb(db_files_ch)
    
    // Run BLAST in parallel for each database
    blastAll(query_ch, makeDb.out.db_files)
    makeDb.out.db_files.view()
    
    // Collect and publish results
    // publishResults(blastAll.out.blast_results)
}

