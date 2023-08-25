cat proc.txt | while read line 
do
   x=$(echo $line | cut -d'"' -f2)
   y=$(echo $line | cut -d'"' -f3)
   z=$(echo mkvpropedit.exe \"$x\" --edit info --set "title=\"$y\"")
   echo $z
   eval "$z"
done