#!/bin/bash -ue
makeblastdb -in subject2.fasta -dbtype nucl -out subject2 -parse_seqids
