s=""
for output in `ls supercell-*.out`
do
    s+=$output
    s+=" "
done

phono3py --cf3 $s
phono3py --sym-fc
phono3py --mesh="11 11 11" --fc3 --fc2 --br
