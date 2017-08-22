
for i in evd.*.png; do
  noext=${i%.*}
  nodots=${noext//./-}
  outname=$nodots".png"
  command="mv $i $outname"
  echo $command
  $command
done

for i in evd.*.pdf; do
  noext=${i%.*}
  nodots=${noext//./-}
  outname=$nodots".pdf"
  command="mv $i $outname"
  echo $command
  $command
done
