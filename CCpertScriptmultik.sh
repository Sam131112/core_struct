#!/bin/bash
#./my_centrality -i:as_732.txt -o:as_732.tab

#for k in 10
#do 
#cat 'as_732.tab' | sort -r -nk3 | cut -f1 | sed -n 1,${k}p > as_732${k}CCOriginal.txt;  
#done;

#python ./mainPert1.py as_732.txt dER;

for (( y1=20; y1<=80; y1=y1+5 )) 
do 
for k in 10 
do 
for x in 0 1 2 
do 
	yk=$(bc <<< "scale=2;${y1}/100")
	y=$(printf "%0.2f" $yk)
	echo "Processing e=${y},p=${x} file..";
	#cat e${y}p${x}as_732.txt| sed s/\(//g|sed s/\),/#/g| tr "#" "\n" | sed s/\)//g | tr "[" " "|tr -d "]"|sed s/,//g > e_${y}_p${x}mod.txt;
	#./my_centrality -i:e_${y}_p${x}mod.txt -o:e_${y}_p${x}mod.tab

cat e_${y}_p${x}mod.tab | sort -r -nk4 | cut -f1 | sed -n 1,${k}p > k${k}CCranke_${y}_p${x}.txt;

python ./Jaccard.py airport${k}CCOriginal.txt k${k}CCranke_${y}_p${x}.txt;
cat Jaccardk${k}CCranke_${y}_p${x}.txt >> k${k}JaccardAirport_${y}.txt; 
done; 
awk '{ {total+=$1; count+=1}}END {printf "%f \n", total/count}' k${k}JaccardAirport_${y}.txt >> JaccardAirport${k}.txt; done; done;  


#for y in 0.05 0.1 0.25 0.5 1 1.5 1.75 2 2.25 2.5 2.75 3.25 3.75 4.25 4.75 5.25 
#do 
#for k in 2 3 4 5 6 7 8 9 10 11 12 13 14 15 
#do 
#for x in 0 1 2 3 4 5 6 7 8 9 
#do 

#cat CCe_${y}_p${x}mod.txt | tr "," "\n" | sed s/{/" "/g | sed s/}//g | sed s/://g | sort -r -n -k2 | cut -f2 -d" " | sed -n 1,${k}p  > k${k}CCranke_${y}_p${x}.txt;

#python ./Jaccard.py k${k}CCrankOriginal.txt k${k}CCranke_${y}_p${x}.txt;
#cat Jaccardk${k}CCranke_${y}_p${x}.txt >> k${k}Jaccardrailway_${y}.txt; 
#done; 
#awk '{ {total+=$1; count+=1}}END {printf "%f \n", total/count}' k${k}Jaccardrailway_${y}.txt >> JaccardAvek${k}.txt; done; done; 
