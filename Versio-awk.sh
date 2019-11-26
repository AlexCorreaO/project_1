
#!/bin/bash
h=1

while [ $h -ne 4 ] ;
do
	echo 1. Recomanació ràpida.
	echo 2. Llistar per any.
	echo 3. Llistar per rating.
	echo 4. Sortir
	read h
	clear
	if [ $h -eq 1 ] ;
	then
		i=$[RANDOM%1000+1]
		echo ----------------------------
		echo Recomanació ràpida
		echo ----------------------------
		NOM=`head -$i netflix.csv | tail -1 | cut -d , -f1,5`
		RATING=`head -$i netflix.csv | tail -1 | cut -d , -f2`
		DESCRIPCIO=`head -$i netflix.csv | tail -1 | cut -d , -f3`
		echo $NOM
		echo $RATING
		echo $DESCRIPCIO

	elif [ $h -eq 2 ]
	then
		echo Introdueix un any
		read any1
		sort netflix.csv|uniq > netflixsc.txt 
		awk ' BEGIN {FS=","}
			'/$any1/' {print $1,",",$2} ' netflixsc.txt 
	elif [ $h -eq 3 ]
	then
		echo En desenvolupament.
	elif [ $h -ne 4 ]; then
	        echo Error. Opció $h no vàlida
	fi
	sleep 3
	clear
done
