# Использоваль совместно с ./join_dics.sh
BEGIN {
    FS = "[_=]"
    
    if (!al_stat)  al_stat  = "accents.json.gz"
    if (!yo_stat)  yo_stat  = "yo_words.json.gz"
    if (!dix_path) dix_path = "dictionary/"
    
    gz_al = "gzip > " dix_path al_stat
    gz_yo = "gzip > " dix_path yo_stat
    
    prev_al = "{"
    prev_yo = "{"

}

{
    $0 = gensub(/([аеёиоуыэюя])\x27/,"+\\1","g",$0); num++
   
    if (push_al > print_al) { print prev_al | gz_al; prev_al = line_al ","; print_al++ };
    if (push_yo > print_yo) { print prev_yo | gz_yo; prev_yo = line_yo ","; print_yo++ };

    if ($0 ~ "ё")
         { line_yo = "  \x22" $2 "\x22: \x22" $3 "\x22"; push_yo++ }
    else { line_al = "  \x22" $2 "\x22: \x22" $3 "\x22"; push_al++ }
}

END {

    line_al = line_al "\n}"; line_yo = line_yo "\n}"
    print line_al | gz_al; print line_yo | gz_yo;

    close(gz_al); close(gz_yo); system("sync");

    print "Слов обработано:", num, "В словарях:", push_al + push_yo, "Без ё:", push_al, "С ё:", push_yo  > "/dev/stderr"
}
