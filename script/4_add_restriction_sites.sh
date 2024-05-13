# Convert to table, convert space to tab, and keep only seq ID and sequence

seqkit fx2tab all_constructs_nt.fas | tr ' ' '\t' | cut -f 1,3 > all_constructs_nt.tab

# Loop to search for restriction sites

input_file="all_constructs_nt.tab"
output_file="all_constructs_nt_re.tab"

# First RE site
# Loop through each line in the input file
while IFS=$'\t' read -r col1 col2; do
    # Check if the second column contains the string "AAGCTT"
    if [[ "$col2" != *AAGCTT* ]]; then
        # If "AAGCTT" is not found, append "AAGCTT" as the second column
        echo -e "$col1\tAAGCTT\t$col2" >> "$output_file"
    else
        # If "AAGCTT" is found, check if it contains "GAGCTC"
        if [[ "$col2" != *GAGCTC* ]]; then
            # If "GAGCTC" is not found, append "GAGCTC" as the second column
            echo -e "$col1\tGAGCTC\t$col2" >> "$output_file"
        else
            # If "GAGCTC" is found, check if it contains "GTCGAC"
            if [[ "$col2" != *GTCGAC* ]]; then
                # If "GTCGAC" is not found, append "GTCGAC" as the second column
                echo -e "$col1\tGTCGAC\t$col2" >> "$output_file"
            else
                # If none of the strings are found, leave the line unchanged
                echo -e "$col1\t$col2" >> "$output_file"
            fi
        fi
    fi
done < "$input_file"

# Second RE site
# Loop through each line in the output file
while IFS=$'\t' read -r col1 col2 col3; do
    # Check if the third column contains the string "CTGCAG"
    if [[ "$col3" != *CTGCAG* ]]; then
        # If "CTGCAG" is not found, append "CTGCAG" as the fourth column
        echo -e "$col1\t$col2\t$col3\tCTGCAG" >> "$output_file.tmp"
    else
        # If "CTGCAG" is found, check if it contains "TCTAGA"
        if [[ "$col3" != *TCTAGA* ]]; then
            # If "TCTAGA" is not found, append "TCTAGA" as the fourth column
            echo -e "$col1\t$col2\t$col3\tTCTAGA" >> "$output_file.tmp"
        else
            # If "TCTAGA" is found, check if it contains "ACTAGT"
            if [[ "$col3" != *ACTAGT* ]]; then
                # If "ACTAGT" is not found, append "ACTAGT" as the fourth column
                echo -e "$col1\t$col2\t$col3\tACTAGT" >> "$output_file.tmp"
            else
                # If none of the strings are found, leave the fourth column empty
                echo -e "$col1\t$col2\t$col3\t" >> "$output_file.tmp"
            fi
        fi
    fi
done < "$output_file"

# Rename the temporary output file to the final output file
mv "$output_file.tmp" "$output_file"

# Append name of RE to each file for submission

input_file="all_constructs_nt_re.tab"
output_file="all_constructs_nt_re_final.tab"

# Loop through each line in the input file
while IFS=$'\t' read -r col1 col2 col3 col4; do
    # Initialize the fifth column variable
    fifth_col=""

    # Check conditions for AAGCTT in the second column
    if [[ "$col2" == "AAGCTT" ]]; then
        # Check conditions for CTGCAG in the fourth column
        if [[ "$col4" == "CTGCAG" ]]; then
            fifth_col="HindIII,PstI"
        elif [[ "$col4" == "TCTAGA" ]]; then
            fifth_col="HindIII,XbaI"
        elif [[ "$col4" == "ACTAGT" ]]; then
            fifth_col="HindIII,SpeI"
        fi
    # Check conditions for GAGCTC in the second column
    elif [[ "$col2" == "GAGCTC" ]]; then
        # Check conditions for CTGCAG in the fourth column
        if [[ "$col4" == "CTGCAG" ]]; then
            fifth_col="SacI,PstI"
        elif [[ "$col4" == "TCTAGA" ]]; then
            fifth_col="SacI,XbaI"
        elif [[ "$col4" == "ACTAGT" ]]; then
            fifth_col="SacI,SpeI"
        fi
    # Check conditions for GTCGAC in the second column
    elif [[ "$col2" == "GTCGAC" ]]; then
        # Check conditions for CTGCAG in the fourth column
        if [[ "$col4" == "CTGCAG" ]]; then
            fifth_col="SalI,PstI"
        elif [[ "$col4" == "TCTAGA" ]]; then
            fifth_col="SalI,XbaI"
        elif [[ "$col4" == "ACTAGT" ]]; then
            fifth_col="SalI,SpeI"
        fi
    fi

    # Print the line with the fifth column appended
    echo -e "$col1\t$col2\t$col3\t$col4\t$fifth_col" >> "$output_file"

done < "$input_file"
