grep "^>" input.fasta | sed 's/[> ]/\t/g' | cut -f 2 > accessions.tab
