#!/bin/bash

# purpose: to copy over raw read files into current directory
# for running WV Snakemake pipeline

# notes:
    # 1. this script assumes that fastq files of each sample are in its own 
    # directory (e.g. path/raw_reads_dir/sample1_name/fwd_read.fastq)
    # 2. ignore this step if you're fine with creating intermediate files 
    # in the same directory as the raw reads

sequencing_dir=path/to/raw_reads_directory  # change to target dir 

for sample_dir in $sequencing_dir/*/; do 
    sample_name=`basename $sample_dir`
    echo $sample_name
    mkdir -p $sample_name  # make directory to copy input over if does not exist
    cp $sample_dir/*fastq $sample_name    
done