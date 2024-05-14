# RNAi_construct_design
A pipeline for designing 150-nt dsRNA constructs for RNAi knock-down from a multi-sequence dataset

## Install dependencies
Dependencies can be installed using conda:

`conda env create -f env.yml`

Or manually installed with external dependencies. Below are listed the versions used in this pipeline (older or newer versions may also be compatible)

```
  - gnu=9.1
  - faSomeRecords=
  - fastx_toolkit=0.0.6
  - blastn=2.14.1
  - seqkit=2.8.0
```

## Usage

- If you're starting with NT sequences, name this "input_nt.fasta" and go to _**2 Make constructs**_.
- If you have a list of accession numbers, name this "accessions.tab" and go to _**1 Get input nt**_.
- If you're starting with AA sequences, name this "input.fasta" and go to _**0 Get accessions**_.
  
### 0 Get accessions 

Paste your multi-sequence FASTA named "input.fasta" into your working directory, then run:

` bash 0_get_accessions.sh `

This will generate a list of accession numbers named "accession.tab". 

### 1 Get input NT

Check that your accession numbers look correct, then run:

` bash 1_get_input_nt.sh `

This will generate a multi-sequence FASTA file of NT sequences. 

### 2 Make constructs

Next, edit the script for "_2_make_constructs.sh_" so that "a" = your database to search for overlap (i.e. your organism genome). Once all paths are correct, run:

` bash 2_make_constructs.sh `

This will iteratively search 150-nt regions of each NT sequence against your database, starting with 10-159 (v1) and shifting 50-nt each round, ending with 310-459 (v7). Accession numbers for squences with a single hit (itself) will be pasted into the corresponding _region.tab_ file (i.e. 10-159.tab) at the first instance. Sequences with multiple hits are taken through to the next round of searching in the next 150-nt region. This is repeated until as many sequences as possible are assigned a region with a single-hit. 

For any sequences which are not assingned a region, check these manually using the "...check_align.tab" file contained within each directory. These are genes with possible paralogs or large gene families sharing homology.

For sequences manually searched for the best region, paste the accession number into the corresponding _region.tab_ file (i.e. 10-159.tab) in the main directory. 

### 3 Get construct sequences

Once all sequences have been assigned a region (automatically and manually), run:

' bash 3_get_construct_sequences '

This will pull the 150-nt sequence for each accession number based on each desginated region. 

### 4 Add restriction sites

Finally, run:

' bash 4_add_restriction_sites' 

This will assign restriction sites to the start and end of each sequence avoiding internal sites present in the sequence. The names of each restriction site pair are then assigned to the final column. This is the format that sequences will be submitted for synthesis. 
