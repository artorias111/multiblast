#!/bin/bash -ue
blastn -query example_query.fasta         -db subject2         -out example_query_vs_subject2.blast.out         -outfmt 7
