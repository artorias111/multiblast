#!/bin/bash -ue
cp subject1.nhr .

blastn -query example_query.fasta         -db subject1         -out example_query_vs_subject1.blast.out         -outfmt 7
