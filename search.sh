#! /bin/bash

# Ask user for file to search

echo What file do you want to search?
echo
read -p 'File: ' filename
echo
# Test for stored variable
# echo $filename
echo
# Ask user what term they are searching for
echo What term do you want to look for?
echo
read -p 'Search Term: ' searchterm
echo

# Test for stored variables
# echo $filename $searchterm
echo
# Ask user if they would like to just search for lines or replace a term
echo What would you like to do with the file and search term? [1 or 2]
echo
echo [1] Search for existence of the term
echo [2] Replace the term with another
echo
read -p 'Choice: ' grepsed
echo
# Test for stored variables
# echo $filename $searchterm $grepsed

if [[ $grepsed == 1 ]]
then
	echo Now executing 'grep' on $filename searching for $searchterm
	echo
	cat $filename | grep $searchterm
elif [[ $grepsed == 2 ]]
then
	echo What do you want to replace your term with?
	echo
	read -p 'Replacement Term: ' replaceterm
	echo
	echo Do you want to create a new file with the new terms? [Y or N]
	echo
	echo [Y]es
	echo [N]o
	echo
	read -p 'Choice: ' newfilechoice
	echo
	if [[ $newfilechoice == [yY] || $newfilechoice == [yY][eE][sS] ]]
	then
		echo What would you like to name the file?
		echo
		read -p 'Output File: ' outputfile
		sed s/$searchterm/$replaceterm/g $filename > $outputfile
		echo File $outputfile has been created with $replaceterm
	elif [[ $newfilechoice == [nN] || $newfilechoice == [nN][oO] ]]
	then
		sed -i s/$searchterm/$replaceterm/g $filename
		echo File $filename has been modified with $replaceterm
	fi
fi
