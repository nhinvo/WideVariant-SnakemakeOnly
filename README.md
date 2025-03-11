# WideVariant: Lieberman Lab SNP calling pipeline (Snakemake Only)
Edited [WideVariant](https://github.com/liebermanlab/WideVariant) Snakemake Pipeline for Variant Calling from Lieberman Lab (no local analysis step) + custom parsing and plotting scripts.

## Outputs: 
<p align="center">
  <img src="images/pos_10777_M4-A1A.png" width="40%" />
  <img src="images/pos_944571_M4XE.png" width="40%" />
</p>

## Setup 
### 1. Copy raw reads into 1-input directory
Change path to raw read directory in copy-files.sh file. 
Note: this step is not needed if you're okay with intermediate files being created in the same directory as the raw reads. 

### Set up and run WideVariant Snakemake pipeline 
#### Install Snakemake and Conda/Mamba  
Install Snakemake and Conda/Mamba following the instructions at this [link](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html#:~:text=for%20installing%20Snakemake.-,Installation%20via%20Conda/Mamba,-This%20is%20the). 

#### Edit config.yaml 
File containing HPC resource specifications. 
- Edit partition name to your partitions and resoure specifications to match nodes in specified partition 
- Edit number of total jobs to submit to cluster 

#### Edit experimental_info.yaml
File containing experiment information. 
- Edit paths to sample_table or ref_genome_directory if needed 

### Create samples.csv
File containing metadata of samples. Follow instructions [here](https://github.com/liebermanlab/WideVariant/blob/main/readme_files/readme_snake_run.md#:~:text=snakemake_pipeline/input/samples.csv)

### Add Reference Genomes 
Add reference genomes to ref_genomes/ directory. 

## Running Pipeline
### Edit main "run_snakemake.slurm" Script
- Edit name of partition 
- Edit name of conda environment with Snakemake installed (if env name is other than "snakemake")

### 2. Submit Script to Cluster
- Submit job to cluster by:  
  ```
  sbatch run_snakemake.slurm
  ```  

## Workflow
Modifications to WideVariant Snakemake workflow: 
- Reduced minimum allele frequency threshold of 0.1
- Maximum reads at a given positions of 5000
- Removed filtering of SNPs present in all samples in combine_positions.py script (i.e. (timesvariant < len(positions_files_list))). 