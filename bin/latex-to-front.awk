function honap(neve){
    split("január,február,március,április,május,június,július,augusztus,szeptember,október,november,december", array, ",");
    nstr = gensub(" ", "", "g", neve)
    for (i=1;  i<=12; i+=1) {
	#print("Nstr:>" nstr "<, arr>" array[i] "<");
	if (nstr==array[i]) {  return sprintf("%02d",i); };
    };
    return "01"
}
function nap(szam){
    if(length(szam)>0) return sprintf("%02d",szam);
    return "01"
}
function autini(nev){
    split("Tamás Gáspár Miklós,Esterházy Péter,Bulányi György", auth, ","); 
    split("TGM,EP,Bulányi", short, ",");
    for (i=1; i<=3; i+=1){
	if (nev==auth[i]) { return short[i]}
    }
    return nev;
}
BEGIN {
    print "---";
}
/\\title/  {
    t_title = gensub("\\\\title{\\s*(.*)\\s*}", "\\1", "g");
    t_title = gensub("^\\s+", "", "g", t_title);
    t_title = gensub("\\s+$", "", "g", t_title);
	  }
/\\date/ {
    a = gensub("^.*\\\\date{(.*)\\\\thanks.*$", "\\1", "g");
    a = gensub(",", "", "g", a)
    split(a, c," ");
    t_date = c[1] "-"  honap(c[2]) "-" nap(c[3]) ;
}
/author/ {
    t_author = gensub("\\\\author{\\s*(.*)\\s*}", "\\1", "g");
    print("authors: \n- " t_author);
}
/\\thanks/ {
    t_source = gensub("^.*\\\\thanks{(.*)}\\s+}", "\\1", "g");
    b = gensub("([:alnum:]*)(\\s|,)(.*)","\\1", "g" , t_source);
    print("categories: \n- " b)
}
    
END {
    print("title: \"" autini(t_author) ":" t_title "\"");
    print("date: \"" t_date  "\"");
    print"---";
    print "> " t_author ": " t_title " - " t_source "; " t_date "\n"
}
