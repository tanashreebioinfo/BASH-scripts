####BASH SCRIPT TO CHECK WHICH SYSTEMS TO ANALYSE####
#####################################################
for i in 1 2 3 4 5 6 7 8
do
    a=$i               #give user input as concentration of the file


    ls -l *"$a"murea*.dcd | awk '{print $9}' | cut -d"_" -f1 > 1.txt
    ls -l recenter/*"$a"murea*.dcd | awk '{print $9}' | cut -d"/" -f2 | cut -d"_" -f1 > 2.txt

    my_array=(`ls -l recenter/*"$a"murea*.dcd | awk '{print $5}'`)
    file=(`ls -l recenter/*"$a"murea*.dcd | awk '{print $9}' | cut -d"/" -f2 | cut -d"_" -f1`)
    sort 1.txt > a
    sort 2.txt > b
    echo "                               "
    echo "DO ANALYSIS FOR FOLLOWING FILES :$a"murea""
    comm -3 a b 

#for i in ${my_array[@]};

echo "CHECK IF ANY INCOMPLETE FILES"

for ((idx=0; idx<${#my_array[@]}; ++idx)); 

do
           # echo "$idx" "${my_array[idx]}"

            #EXPR="count=\${#$my_array[@]}"
            #eval $EXPR
            count=(`echo -n ${my_array[idx]}  | wc -c`)  #memory of each file in characters
            
            echo $count:${file[$idx]}
   
done

done

#ls -l recenter/*4murea*.dcd
#sort 1.txt > a
#sort 2.txt > b

#echo "                               "
#echo "DO ANALYSIS FOR FOLLOWING FILES"

#comm -3 a b 

