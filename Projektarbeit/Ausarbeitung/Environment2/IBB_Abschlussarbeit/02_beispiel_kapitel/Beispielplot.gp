# Groesse des Zeichenbereichs festlegen
set terminal tikz color size 10cm, 7cm
set output '02_beispiel_kapitel/Beispielplot.tex'

#set termoption dash

# Achsentyp definieren mit Netz in Zeichenflaeche
set grid
set xzeroaxis lt -1 linewidth 1
set yzeroaxis lt -1 linewidth 1

# x-/y-Achse festelegen
set xrange [0:15.708]
set yrange [-3.2:0.4]

# Unterteilung der Achsen
set xtics 2
set ytics 0.4

# Achsenbeschriftung
set xlabel 'Pfad' 
set ylabel ' $M_{xx}$'

# Lage und Groesse der Legendenbox
set pointsize 2.0
set key box
set key bottom right

# Beschriftung im Zeichenbereich setzen
set label "Spitze" at 1.7,-1.8

# Definieren einer kontinuierlichen Referenzloesung
Konstante=1.0
Ref(x)=-cos(x/10.0)*Konstante*Konstante*Konstante

# Zeichenen der Kurven
plot\
'02_beispiel_kapitel/Datenreihe1.data' u 1:2  title 'Daten 1'  with points pt 4  ps 2  linecolor rgb "red"  ,\
'02_beispiel_kapitel/Datenreihe2.data' u 1:2  title 'Daten 2'  with lines  lt 3 lw 2  linecolor rgb "green",\
Ref(x)                                         title ' Analytisch'    with lines  lt 1 lw 2 linecolor rgb "blue"
 



