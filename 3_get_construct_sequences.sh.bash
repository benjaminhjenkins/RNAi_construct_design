# Get sequences

faSomeRecords v1/constructs_10_to_159.fasta 10_159.tab.hits 10_159_constructs_nt.fasta
faSomeRecords v2/constructs_60_to_209.fasta 60_209.tab.hits 60_209_constructs_nt.fasta
faSomeRecords v3/constructs_110_to_259.fasta 110_259.tab.hits 110_259_constructs_nt.fasta
faSomeRecords v4/constructs_160_to_309.fasta 160_309.tab.hits 160_309_constructs_nt.fasta
faSomeRecords v5/constructs_210_to_359.fasta 210_359.tab.hits 210_359_constructs_nt.fasta
faSomeRecords v6/constructs_260_to_409.fasta 260_409.tab.hits 260_409_constructs_nt.fasta
faSomeRecords v7/constructs_310_to_459.fasta 310_459.tab.hits 310_459_constructs_nt.fasta

# Merge sequences to a single file

cat *constructs_nt.fasta > all_constructs_nt.fas

