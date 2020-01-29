##replace the co-ordinate in pdb file with some other (incremental coordinate)

start_window=2.887
end_window=4.887
window_increment=0.5

for j in $(seq $start_window $window_increment $end_window)
do
	cp 1.pdb init$j.pdb
	val=$(expr $j)
	#echo "value = "$i
	echo $j,$val
	sed -i "s/000000/ ${val}/g" init$j.pdb
done

