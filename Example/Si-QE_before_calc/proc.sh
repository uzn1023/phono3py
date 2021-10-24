phono3py --qe -d --dim="1 1 1" --pa="F" -c Si.in

for input in `ls supercell-*.in`
do
    cat header.in $input >| headeradd_$input
done

for input in `ls headeradd_supercell-*.in`
do
    cut=${input#headeradd_}
    output=${cut/in/out}
    mpirun pw.x -i $input |& tee $output
done

s=""
for output in `ls supercell-*.out`
do
    s+=$output
    s+=" "
done

phono3py --cf3 $s
phono3py --sym-fc
phono3py --mesh="11 11 11" --fc3 --fc2 --br
