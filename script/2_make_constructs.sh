# Set up directory names and variables #

a=~/datasets/paramecium/paramecium_bursaria_final/Paramecium_bursaria_186b.mrna-transcripts.fa

mkdir v1
mkdir v2
mkdir v3
mkdir v4
mkdir v5
mkdir v6
mkdir v7


###########
# Round 1 #
###########

# Format to single-line FASTA file #

fasta_formatter -w 0 -i input_nt.fasta -o v1/input_nt_s.fasta

# Cut FASTA file 10-159 #

fastx_trimmer -f 10 -l 159 -i v1/input_nt_s.fasta -o v1/constructs_10_to_159.fasta

# BLASTn to check sequence overlap #

blastn -query v1/constructs_10_to_159.fasta -db $a -out v1/constructs_10_to_159_check_align.tab -evalue 1e-01 -outfmt 1 -task "blastn-short"
blastn -query v1/constructs_10_to_159.fasta -db $a -out v1/constructs_10_to_159_check_list.tab -evalue 1e-01 -outfmt 6 -task "blastn-short"

# Keep only hits above 20 nt #

awk '$4>20' v1/constructs_10_to_159_check_list.tab > v1/constructs_10_to_159_check_list_20.tab

# Pull unique hits

cut -f1 v1/constructs_10_to_159_check_list_20.tab | uniq -u > 10_159.tab.hits

# Split non-identical hits and pull sequences for next round

awk '$1 != $2 {print $1}' v1/constructs_10_to_159_check_list_20.tab > v1/constructs_10_to_159_mismatch.tab.hits
faSomeRecords $a v1/constructs_10_to_159_mismatch.tab.hits v2/input_nt.fasta


###########
# Round 2 #
###########

fasta_formatter -i v2/input_nt.fasta -o v2/input_nt_s.fasta

# Cut FASTA file 60-209 #

fastx_trimmer -f 60 -l 209 -i v2/input_nt_s.fasta -o v2/constructs_60_to_209.fasta

# BLASTn to check sequence overlap #

blastn -query v2/constructs_60_to_209.fasta -db $a -out v2/constructs_60_to_209_check_align.tab -evalue 1e-01 -outfmt 1 -task "blastn-short"
blastn -query v2/constructs_60_to_209.fasta -db $a -out v2/constructs_60_to_209_check_list.tab -evalue 1e-01 -outfmt 6 -task "blastn-short"

# Keep only hits above 20 nt #

awk '$4>20' v2/constructs_60_to_209_check_list.tab > v2/constructs_60_to_209_check_list_20.tab

# Pull unique hits

cut -f1 v2/constructs_60_to_209_check_list_20.tab | uniq -u > 60_209.tab.hits

# Split non-identical hits and pull sequences for next round

awk '$1 != $2 {print $1}' v2/constructs_60_to_209_check_list_20.tab > v2/constructs_60_to_209_mismatch.tab.hits
faSomeRecords $a v2/constructs_60_to_209_mismatch.tab.hits v3/input_nt.fasta


###########
# Round 3 #
###########

fasta_formatter -i v3/input_nt.fasta -o v3/input_nt_s.fasta

# Cut FASTA file 110-259 #

fastx_trimmer -f 110 -l 259 -i v3/input_nt_s.fasta -o v3/constructs_110_to_259.fasta

# BLASTn to check sequence overlap #

blastn -query v3/constructs_110_to_259.fasta -db $a -out v3/constructs_110_to_259_check_align.tab -evalue 1e-01 -outfmt 1 -task "blastn-short"
blastn -query v3/constructs_110_to_259.fasta -db $a -out v3/constructs_110_to_259_check_list.tab -evalue 1e-01 -outfmt 6 -task "blastn-short"

# Keep only hits above 20 nt #

awk '$4>20' v3/constructs_110_to_259_check_list.tab > v3/constructs_110_to_259_check_list_20.tab

# Pull unique hits

cut -f1 v3/constructs_110_to_259_check_list_20.tab | uniq -u > 110_259.tab.hits

# Split non-identical hits and pull sequences for next round

awk '$1 != $2 {print $1}' v3/constructs_110_to_259_check_list_20.tab > v3/constructs_110_to_259_mismatch.tab.hits
faSomeRecords $a v3/constructs_110_to_259_mismatch.tab.hits v4/input_nt.fasta


###########
# Round 4 #
###########

fasta_formatter -i v4/input_nt.fasta -o v4/input_nt_s.fasta

# Cut FASTA file 160-309 #

fastx_trimmer -f 160 -l 309 -i v4/input_nt_s.fasta -o v4/constructs_160_to_309.fasta

# BLASTn to check sequence overlap #

blastn -query v4/constructs_160_to_309.fasta -db $a -out v4/constructs_160_to_309_check_align.tab -evalue 1e-01 -outfmt 1 -task "blastn-short"
blastn -query v4/constructs_160_to_309.fasta -db $a -out v4/constructs_160_to_309_check_list.tab -evalue 1e-01 -outfmt 6 -task "blastn-short"

# Keep only hits above 20 nt #

awk '$4>20' v4/constructs_160_to_309_check_list.tab > v4/constructs_160_to_309_check_list_20.tab

# Pull unique hits

cut -f1 v4/constructs_160_to_309_check_list_20.tab | uniq -u > 160_309.tab.hits

# Split non-identical hits and pull sequences for next round

awk '$1 != $2 {print $1}' v4/constructs_160_to_309_check_list_20.tab > v4/constructs_160_to_309_mismatch.tab.hits
faSomeRecords $a v4/constructs_160_to_309_mismatch.tab.hits v5/input_nt.fasta


###########
# Round 5 #
###########

fasta_formatter -i v5/input_nt.fasta -o v5/input_nt_s.fasta

# Cut FASTA file 210-359 #

fastx_trimmer -f 210 -l 359 -i v5/input_nt_s.fasta -o v5/constructs_210_to_359.fasta

# BLASTn to check sequence overlap #

blastn -query v5/constructs_210_to_359.fasta -db $a -out v5/constructs_210_to_359_check_align.tab -evalue 1e-01 -outfmt 1 -task "blastn-short"
blastn -query v5/constructs_210_to_359.fasta -db $a -out v5/constructs_210_to_359_check_list.tab -evalue 1e-01 -outfmt 6 -task "blastn-short"

# Keep only hits above 20 nt #

awk '$4>20' v5/constructs_210_to_359_check_list.tab > v5/constructs_210_to_359_check_list_20.tab

# Pull unique hits

cut -f1 v5/constructs_210_to_359_check_list_20.tab | uniq -u > 210_359.tab.hits

# Split non-identical hits and pull sequences for next round

awk '$1 != $2 {print $1}' v5/constructs_210_to_359_check_list_20.tab > v5/constructs_210_to_359_mismatch.tab.hits
faSomeRecords $a v5/constructs_210_to_359_mismatch.tab.hits v6/input_nt.fasta


###########
# Round 6 #
###########

fasta_formatter -i v6/input_nt.fasta -o v6/input_nt_s.fasta

# Cut FASTA file 260-409 #

fastx_trimmer -f 260 -l 409 -i v6/input_nt_s.fasta -o v6/constructs_260_to_409.fasta

# BLASTn to check sequence overlap #

blastn -query v6/constructs_260_to_409.fasta -db $a -out v6/constructs_260_to_409_check_align.tab -evalue 1e-01 -outfmt 1 -task "blastn-short"
blastn -query v6/constructs_260_to_409.fasta -db $a -out v6/constructs_260_to_409_check_list.tab -evalue 1e-01 -outfmt 6 -task "blastn-short"

# Keep only hits above 20 nt #

awk '$4>20' v6/constructs_260_to_409_check_list.tab > v6/constructs_260_to_409_check_list_20.tab

# Pull unique hits

cut -f1 v6/constructs_260_to_409_check_list_20.tab | uniq -u > 260_409.tab.hits

# Split non-identical hits and pull sequences for next round

awk '$1 != $2 {print $1}' v6/constructs_260_to_409_check_list_20.tab > v6/constructs_260_to_409_mismatch.tab.hits
faSomeRecords $a v6/constructs_260_to_409_mismatch.tab.hits v7/input_nt.fasta


###########
# Round 7 #
###########

fasta_formatter -i v7/input_nt.fasta -o v7/input_nt_s.fasta

# Cut FASTA file 310-459 #

fastx_trimmer -f 310 -l 459 -i v7/input_nt_s.fasta -o v7/constructs_310_to_459.fasta

# BLASTn to check sequence overlap #

blastn -query v7/constructs_310_to_459.fasta -db $a -out v7/constructs_310_to_459_check_align.tab -evalue 1e-01 -outfmt 1 -task "blastn-short"
blastn -query v7/constructs_310_to_459.fasta -db $a -out v7/constructs_310_to_459_check_list.tab -evalue 1e-01 -outfmt 6 -task "blastn-short"

# Keep only hits above 20 nt #

awk '$4>20' v7/constructs_310_to_459_check_list.tab > v7/constructs_310_to_459_check_list_20.tab

# Pull unique hits

cut -f1 v7/constructs_310_to_459_check_list_20.tab | uniq -u > 310_459.tab.hits
