#!/bin/bash


#Purpose to create a script for short listing of candidates.


#for pdf files searching and filtering.


#User input 

read -p "Please give me keywords, Max 5 words: " word1 word2 word3 word4 word5





WORD1=`pdfgrep -irH  $word1          *.pdf  | cut -f1 -d":"` 
WORD2=`pdfgrep -irH  $word2          *.pdf  | cut -f1 -d":"`
WORD3=`pdfgrep -irH  $word3          *.pdf  | cut -f1 -d":"`
WORD4=`pdfgrep -irH  $word4          *.pdf  | cut -f1 -d":"`
WORD5=`pdfgrep -irH  $word5          *.pdf  | cut -f1 -d":"`

#Spaces in pdf files, for loop store it's value in $IFS, so change this variable
IFS=$(echo -en "\n\b")

for i in "$WORD1 $WORD2 $WORD3 $WORD4 $WORD5"
do
   echo $i | sed 's/pdf /\n/g' > shortlistedcv.txt
    

 

done


#This will add text at the end of the line

sed 's/$/pdf/' shortlistedcv.txt > callthem.txt

#This will delete end line of file

sed -i '$ d' callthem.txt

if [ ! -d "NewPdf" ]
then
     mkdir NewPdf
     fi


for k in `cat callthem.txt`
do
    cp $k NewPdf


done




