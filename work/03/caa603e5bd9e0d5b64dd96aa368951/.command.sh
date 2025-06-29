#!/bin/bash -ue
blastn -query example_query.fasta         -db subject3         -out example_query_vs_subject3.blast.out         -outfmt 7
