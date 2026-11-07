#let md(m) = $space (mod #m)$
#let ggT = math.op("ggT")
#let farbe = rgb("#1f5f8b")
#let kasten(titel, c, body) = block(width: 100%, breakable: true, fill: c.lighten(90%), stroke: (left: 3pt + c), inset: (x: 10pt, y: 8pt), radius: 2pt, above: 1em, below: 1em)[#text(fill: c.darken(20%), weight: "bold")[#titel] #h(0.3em) #body]
#let defi(t, b) = kasten("Definition" + if t != "" [ (#t)], rgb("#1f5f8b"), b)
#let satz(t, b) = kasten(t, rgb("#2e7d32"), b)
#let bsp(t, b) = kasten("Beispiel" + if t != "" [: #t], rgb("#6d4c9f"), b)
#let merke(b) = kasten("Merke", rgb("#c77700"), b)
#let falle(b) = kasten("Typischer Fehler", rgb("#b3261e"), b)
#let beweis(b) = block(width: 100%, inset: (left: 10pt), stroke: (left: 1pt + luma(170)), above: 0.6em, below: 1em)[_Beweis._ #b #h(1fr) $square.stroked$]
#let karo(h) = block(width: 100%, height: h, above: 0.5em, below: 1.2em, stroke: 0.4pt + luma(190), fill: tiling(size: (5mm, 5mm))[#place(line(start: (0pt, 0pt), end: (5mm, 0pt), stroke: 0.25pt + luma(212)))#place(line(start: (0pt, 0pt), end: (0pt, 5mm), stroke: 0.25pt + luma(212)))])
#let doc(titel, untertitel, body) = {
  set document(title: titel)
  set page(paper: "a4", margin: (x: 1.8cm, top: 2cm, bottom: 1.8cm),
    header: context { if counter(page).get().first() > 1 [#set text(8pt, fill: luma(110)); #titel #h(1fr) Mathe-Vertiefungskurs Q12] },
    footer: context [#set text(8pt, fill: luma(110)); #h(1fr) #counter(page).display("1 / 1", both: true) #h(1fr)])
  set text(lang: "de", size: 11pt)
  set par(justify: true, leading: 0.6em)
  set heading(numbering: "1.")
  show heading.where(level: 1): it => block(above: 1.4em, below: 0.8em, text(fill: farbe, size: 14pt, it))
  set table(stroke: 0.5pt + luma(150), inset: 5pt, align: center)
  align(center)[#text(20pt, weight: "bold", fill: farbe)[#titel] \ #v(0.2em) #text(11pt, fill: luma(80))[#untertitel]]
  v(0.6em)
  body
}
#let etab(..c) = table(columns: 6, inset: 4pt, fill: (x, y) => if y == 0 { luma(230) }, ..c)
#show: doc.with("Zahlentheorie – Lösungen", "Ausführliche Lösungen zu allen Aufgaben und zur Probe-Ex")
#set heading(numbering: none)
= Teil A: Rechnen modulo m
#block(breakable: true, above: 1em)[*Aufgabe A1: Reste berechnen* #h(1fr) #text(fill: luma(120))[★☆☆] \ #text(size: 9.5pt, fill: luma(90))[Berechne: #h(0.5em) a) $47 mod 5$ #h(0.6em) b) $100 mod 7$ #h(0.6em) c) $2026 mod 9$ #h(0.6em) d) $-13 mod 5$ \ e) $-100 mod 7$ #h(0.6em) f) $-1 mod 26$ #h(0.6em) g) $123456 mod 4$ #h(0.6em) h) $5^3 mod 6$] #v(0.3em) \ a) $47 = 9 dot 5 + 2$ → *2* #h(1em) b) $100 = 14 dot 7 + 2$ → *2* #h(1em) c) Quersumme 10, $10 mod 9$ → *1* (Neunerregel) #h(1em) d) $-13 = (-3) dot 5 + 2$ → *2* #h(1em) e) $-100 = (-15) dot 7 + 5$ → *5* #h(1em) f) $-1 = (-1) dot 26 + 25$ → *25* #h(1em) g) $123456 = 30864 dot 4$ → *0* (nur die letzten zwei Ziffern zählen: $56 = 14 dot 4$) #h(1em) h) $125 = 20 dot 6 + 5$ → *5* (oder $5 equiv -1$, $(-1)^3 = -1 equiv 5$)]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe A2: Kongruent oder nicht?* #h(1fr) #text(fill: luma(120))[★☆☆] \ #text(size: 9.5pt, fill: luma(90))[Entscheide und begründe mit der Definition ($m divides (a - b)$): \ a) $38 equiv 3 md(7)$ #h(0.6em) b) $100 equiv -2 md(17)$ #h(0.6em) c) $1001 equiv 1 md(7)$ \ d) $-8 equiv 13 md(7)$ #h(0.6em) e) $57 equiv 3 md(11)$ #h(0.6em) f) $2^10 equiv 1 md(11)$] #v(0.3em) \ a) $38 - 3 = 35 = 5 dot 7$ → *wahr* #h(1em) b) $100 - (-2) = 102 = 6 dot 17$ → *wahr* #h(1em) c) $1001 - 1 = 1000 = 142 dot 7 + 6$, $7 divides.not 1000$ → *falsch* (es gilt sogar $1001 = 143 dot 7 equiv 0$) #h(1em) d) $-8 - 13 = -21 = -3 dot 7$ → *wahr* #h(1em) e) $57 - 3 = 54 = 4 dot 11 + 10$ → *falsch* #h(1em) f) $1024 - 1 = 1023 = 93 dot 11$ → *wahr*]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe A3: Restklassen auflisten* #h(1fr) #text(fill: luma(120))[★☆☆] \ #text(size: 9.5pt, fill: luma(90))[a) Gib alle $x in ZZ$ mit $-20 <= x <= 20$ und $x equiv 3 md(7)$ an. \ b) Gib alle $x$ mit $0 <= x <= 50$ und $x equiv -1 md(9)$ an.] #v(0.3em) \ a) $x = 3 + 7k$: *$-18, -11, -4, 3, 10, 17$* #h(1em) b) $-1 equiv 8 md(9)$, also $x = 8 + 9k$: *$8, 17, 26, 35, 44$*]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe A4: Geschickt rechnen (ohne TR)* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[a) $123 dot 456 mod 10$ #h(0.6em) b) $99 dot 98 dot 97 mod 100$ #h(0.6em) c) $2^10 mod 7$ #h(0.6em) d) $17^100 mod 4$ \ e) $3^2026 mod 8$ #h(0.6em) f) $(-1)^2027 + 10^50 mod 9$ #h(0.6em) g) $6^50 mod 7$] #v(0.3em) \ a) $equiv 3 dot 6 = 18 equiv$ *8* #h(1em) b) $equiv (-1)(-2)(-3) = -6 equiv$ *94* #h(1em) c) $2^3 = 8 equiv 1$, $2^10 = (2^3)^3 dot 2 equiv 2$ → *2* #h(1em) d) $17 equiv 1 md(4)$ → $1^100 =$ *1* #h(1em) e) $3^2 = 9 equiv 1 md(8)$ → $3^2026 = (3^2)^1013 equiv$ *1* #h(1em) f) $10 equiv 1 md(9)$: $-1 + 1 =$ *0* #h(1em) g) $6 equiv -1 md(7)$ → $(-1)^50 =$ *1*]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe A5: Endziffern* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Bestimme die letzte Ziffer von a) $3^2026$, b) $2^100$, c) $9^2027$ und d) die letzten *zwei* Ziffern von $7^100$.] #v(0.3em) \ Letzte Ziffer = Rest mod 10. #h(0.5em) a) $3^4 = 81 equiv 1 md(10)$, $2026 = 4 dot 506 + 2$ → $3^2 = 9$ → *9* #h(1em) b) Zyklus $2, 4, 8, 6$ (Länge 4), $100 = 4 dot 25$ → letzte Stelle im Zyklus → *6* (genauer: $2^4 = 16 equiv 6$ und $6 dot 6 = 36 equiv 6$, also $2^(4k) equiv 6$) #h(1em) c) $9 equiv -1 md(10)$, $(-1)^2027 = -1 equiv$ *9* #h(1em) d) mod 100: $7^2 = 49$, $7^4 = 2401 equiv 1 md(100)$ → $7^100 = (7^4)^25 equiv 1$ → *01*]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe A6: Uhr und Kalender* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[a) Heute ist Samstag. Welcher Wochentag ist in 1000 Tagen? \ b) Es ist 9 Uhr. Wie spät ist es in 1000 Stunden? Wie spät war es vor 100 Stunden?] #v(0.3em) \ a) $1000 = 142 dot 7 + 6$ → 6 Tage nach Samstag → *Freitag* #h(1em) b) $9 + 1000 = 1009 = 42 dot 24 + 1$ → *1 Uhr*; $9 - 100 = -91 = (-4) dot 24 + 5$ → *5 Uhr*]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe A7: Verknüpfungstafeln* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Stelle die Multiplikationstafeln von $ZZ_7$ und $ZZ_8$ auf. Lies ab: Welche Klassen haben ein Inverses (welches)? Welche sind Nullteiler? Erkläre den Unterschied mit dem ggT.] #v(0.3em) \ #grid(columns: (1fr, 1fr), gutter: 1em, [*$ZZ_7$* #table(columns: 8, inset: 3pt, fill: (x, y) => if x == 0 or y == 0 { luma(230) }, [$dot$], [0], [1], [2], [3], [4], [5], [6],
[0], [0], [0], [0], [0], [0], [0], [0],
[1], [0], [*1*], [2], [3], [4], [5], [6],
[2], [0], [2], [4], [6], [*1*], [3], [5],
[3], [0], [3], [6], [2], [5], [*1*], [4],
[4], [0], [4], [*1*], [5], [2], [6], [3],
[5], [0], [5], [3], [*1*], [6], [4], [2],
[6], [0], [6], [5], [4], [3], [2], [*1*])], [*$ZZ_8$* #table(columns: 9, inset: 3pt, fill: (x, y) => if x == 0 or y == 0 { luma(230) }, [$dot$], [0], [1], [2], [3], [4], [5], [6], [7],
[0], [0], [0], [0], [0], [0], [0], [0], [0],
[1], [0], [*1*], [2], [3], [4], [5], [6], [7],
[2], [0], [2], [4], [6], [0], [2], [4], [6],
[3], [0], [3], [6], [*1*], [4], [7], [2], [5],
[4], [0], [4], [0], [4], [0], [4], [0], [4],
[5], [0], [5], [2], [7], [4], [*1*], [6], [3],
[6], [0], [6], [4], [2], [0], [6], [4], [2],
[7], [0], [7], [6], [5], [4], [3], [2], [*1*])]) $ZZ_7$: *alle* $!= 0$ invertierbar: $1 <-> 1, 2 <-> 4, 3 <-> 5, 6 <-> 6$; keine Nullteiler (7 ist prim). #h(0.5em) $ZZ_8$: invertierbar nur $1, 3, 5, 7$ (alle selbstinvers, z. B. $3 dot 3 = 9 equiv 1$); Nullteiler $2, 4, 6$ ($2 dot 4 = 8 equiv 0$, $6 dot 4 = 24 equiv 0$). Grund: $overline(a)$ invertierbar ⇔ $ggT(a, m) = 1$; die geraden Zahlen haben mit 8 den ggT 2 oder 4.]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe A8: Quadratzahlen modulo 4* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[a) Beweise: Jede Quadratzahl ist $equiv 0$ oder $equiv 1 md(4)$. \ b) Folgere: Keine Zahl der Form $4k + 3$ (z. B. 2027) ist Summe zweier Quadratzahlen.] #v(0.3em) \ a) Fall $n$ gerade, $n = 2k$: $n^2 = 4k^2 equiv 0 md(4)$. Fall $n$ ungerade, $n = 2k + 1$: $n^2 = 4k^2 + 4k + 1 = 4(k^2 + k) + 1 equiv 1 md(4)$. #h(0.5em) b) Für $a^2 + b^2$ gibt es nach a) nur $0 + 0, 0 + 1, 1 + 1$, also Reste $0, 1, 2$, aber nie $3$. Da $2027 = 506 dot 4 + 3 equiv 3 md(4)$, ist 2027 keine Summe zweier Quadrate.]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe A9: Teilbarkeitsbeweise mit Modulo* #h(1fr) #text(fill: luma(120))[★★★] \ #text(size: 9.5pt, fill: luma(90))[a) Beweise die Elferregel: $n$ ist genau dann durch 11 teilbar, wenn die alternierende Quersumme $a_0 - a_1 + a_2 - ...$ durch 11 teilbar ist. \ b) Zeige mit einer Restetabelle modulo 6: $6 divides n^3 - n$ für alle $n in ZZ$.] #v(0.3em) \ a) $10 equiv -1 md(11)$ ⇒ $10^i equiv (-1)^i$ (Satz 5, Potenz). Also $n = sum a_i 10^i equiv sum a_i (-1)^i = a_0 - a_1 + a_2 - ... md(11)$. $n$ und alternierende Quersumme haben denselben Rest, also ist die eine genau dann $equiv 0$, wenn es die andere ist. #h(0.5em) b) Jedes $n$ ist kongruent zu einem $r in {0, ..., 5}$, und $n^3 - n equiv r^3 - r md(6)$: \ #align(center, table(columns: 7, [$r$], [0], [1], [2], [3], [4], [5], [$r^3 - r$], [0], [0], [6], [24], [60], [120], [$mod 6$], [0], [0], [0], [0], [0], [0])) In allen Fällen Rest 0 ⇒ $6 divides n^3 - n$. (Alternativ: $(n - 1) n (n + 1)$ enthält eine gerade Zahl und ein Vielfaches von 3.)]
#line(length: 100%, stroke: 0.3pt + luma(200))
= Teil B: ggT und (erweiterter) Euklid
#block(breakable: true, above: 1em)[*Aufgabe B1: ggT mit Euklid* #h(1fr) #text(fill: luma(120))[★☆☆] \ #text(size: 9.5pt, fill: luma(90))[Bestimme mit dem euklidischen Algorithmus: \ a) $ggT(252, 198)$ #h(0.6em) b) $ggT(391, 299)$ #h(0.6em) c) $ggT(987, 610)$ #h(0.6em) d) $ggT(3465, 1287)$] #v(0.3em) \ *a)* $ggT(252, 198) = 18$: $ 252 &= 1 dot 198 + 54 \
198 &= 3 dot 54 + 36 \
54 &= 1 dot 36 + 18 \
36 &= 2 dot 18 + 0 $ \ *b)* $ggT(391, 299) = 23$: $ 391 &= 1 dot 299 + 92 \
299 &= 3 dot 92 + 23 \
92 &= 4 dot 23 + 0 $ \ *c)* $ggT(987, 610) = 1$: $ 987 &= 1 dot 610 + 377 \
610 &= 1 dot 377 + 233 \
377 &= 1 dot 233 + 144 \
233 &= 1 dot 144 + 89 \
144 &= 1 dot 89 + 55 \
89 &= 1 dot 55 + 34 \
55 &= 1 dot 34 + 21 \
34 &= 1 dot 21 + 13 \
21 &= 1 dot 13 + 8 \
13 &= 1 dot 8 + 5 \
8 &= 1 dot 5 + 3 \
5 &= 1 dot 3 + 2 \
3 &= 1 dot 2 + 1 \
2 &= 2 dot 1 + 0 $ \ *d)* $ggT(3465, 1287) = 99$: $ 3465 &= 2 dot 1287 + 891 \
1287 &= 1 dot 891 + 396 \
891 &= 2 dot 396 + 99 \
396 &= 4 dot 99 + 0 $ (Bei c) sind 987 und 610 aufeinanderfolgende Fibonacci-Zahlen, deshalb lauter Quotienten 1, worst case für Euklid!)]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe B2: Erweiterter Euklid* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Stelle den ggT als Vielfachsumme $ggT(a, b) = x dot a + y dot b$ dar und mache die Probe: \ a) $a = 240, b = 46$ #h(0.6em) b) $a = 161, b = 28$ #h(0.6em) c) $a = 1001, b = 221$ #h(0.6em) d) $a = 987, b = 610$] #v(0.3em) \ *a)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$240$], [$46$], [$5$], [$10$], [$-9$], [$47$],
[$46$], [$10$], [$4$], [$6$], [$2$], [$-9$],
[$10$], [$6$], [$1$], [$4$], [$-1$], [$2$],
[$6$], [$4$], [$1$], [$2$], [$1$], [$-1$],
[$4$], [$2$], [$2$], [$0$], [$0$], [$1$]))
$ggT(240, 46) = 2 = (-9) dot 240 + (47) dot 46$. *Probe:* $-2160 + (2162) = 2$ ✓ \ *b)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$161$], [$28$], [$5$], [$21$], [$-1$], [$6$],
[$28$], [$21$], [$1$], [$7$], [$1$], [$-1$],
[$21$], [$7$], [$3$], [$0$], [$0$], [$1$]))
$ggT(161, 28) = 7 = (-1) dot 161 + (6) dot 28$. *Probe:* $-161 + (168) = 7$ ✓ \ *c)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$1001$], [$221$], [$4$], [$117$], [$2$], [$-9$],
[$221$], [$117$], [$1$], [$104$], [$-1$], [$2$],
[$117$], [$104$], [$1$], [$13$], [$1$], [$-1$],
[$104$], [$13$], [$8$], [$0$], [$0$], [$1$]))
$ggT(1001, 221) = 13 = (2) dot 1001 + (-9) dot 221$. *Probe:* $2002 + (-1989) = 13$ ✓ \ *d)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$987$], [$610$], [$1$], [$377$], [$233$], [$-377$],
[$610$], [$377$], [$1$], [$233$], [$-144$], [$233$],
[$377$], [$233$], [$1$], [$144$], [$89$], [$-144$],
[$233$], [$144$], [$1$], [$89$], [$-55$], [$89$],
[$144$], [$89$], [$1$], [$55$], [$34$], [$-55$],
[$89$], [$55$], [$1$], [$34$], [$-21$], [$34$],
[$55$], [$34$], [$1$], [$21$], [$13$], [$-21$],
[$34$], [$21$], [$1$], [$13$], [$-8$], [$13$],
[$21$], [$13$], [$1$], [$8$], [$5$], [$-8$],
[$13$], [$8$], [$1$], [$5$], [$-3$], [$5$],
[$8$], [$5$], [$1$], [$3$], [$2$], [$-3$],
[$5$], [$3$], [$1$], [$2$], [$-1$], [$2$],
[$3$], [$2$], [$1$], [$1$], [$1$], [$-1$],
[$2$], [$1$], [$2$], [$0$], [$0$], [$1$]))
$ggT(987, 610) = 1 = (233) dot 987 + (-377) dot 610$. *Probe:* $229971 + (-229970) = 1$ ✓]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe B3: ggT-Beweise* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Beweise für alle $n in NN$: #h(0.5em) a) $ggT(n, n + 1) = 1$ #h(1em) b) $ggT(2n + 1, 3n + 1) = 1$ \ _Tipp:_ Finde eine Vielfachsumme, die 1 ergibt.] #v(0.3em) \ Sei $d$ ein gemeinsamer Teiler. Nach Satz 1 teilt $d$ jede Vielfachsumme. #h(0.5em) a) $(n + 1) - n = 1$ ⇒ $d divides 1$ ⇒ $d = 1$. #h(1em) b) $3 dot (2n + 1) - 2 dot (3n + 1) = 6n + 3 - 6n - 2 = 1$ ⇒ $d divides 1$ ⇒ $d = 1$.]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe B4: Kürzen durch den ggT* #h(1fr) #text(fill: luma(120))[★★★] \ #text(size: 9.5pt, fill: luma(90))[Sei $g = ggT(a, b)$. Beweise: $ggT(a/g, b/g) = 1$. \ Gib außerdem eine zweite Vielfachsumme für $ggT(240, 46)$ an (vgl. Aufgabe B2).] #v(0.3em) \ Bézout: $g = x a + y b$. Teilen durch $g$: $1 = x dot a/g + y dot b/g$. Ein gemeinsamer Teiler von $a/g$ und $b/g$ teilt diese Vielfachsumme, also $1$ ⇒ ggT ist 1. #h(0.5em) Zweite Darstellung: aus $2 = -9 dot 240 + 47 dot 46$ und $(x + k dot 46/2, y - k dot 240/2)$ mit $k = 1$: $2 = 14 dot 240 - 73 dot 46$ (Probe: $3360 - 3358 = 2$ ✓).]
#line(length: 100%, stroke: 0.3pt + luma(200))
= Teil C: Das Inverse modulo m
#block(breakable: true, above: 1em)[*Aufgabe C1: Inverse prüfen* #h(1fr) #text(fill: luma(120))[★☆☆] \ #text(size: 9.5pt, fill: luma(90))[Prüfe: a) Ist 5 das Inverse von 3 mod 7? #h(0.6em) b) Ist 4 das Inverse von 7 mod 9? #h(0.6em) c) Ist 6 das Inverse von 5 mod 14?] #v(0.3em) \ a) $3 dot 5 = 15 = 2 dot 7 + 1$ → *ja* #h(1em) b) $7 dot 4 = 28 = 3 dot 9 + 1$ → *ja* #h(1em) c) $5 dot 6 = 30 = 2 dot 14 + 2$ → *nein* (das Inverse ist 3, denn $15 equiv 1$)]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe C2: Inverse durch Probieren* #h(1fr) #text(fill: luma(120))[★☆☆] \ #text(size: 9.5pt, fill: luma(90))[Bestimme durch Probieren (kleine Moduln!): $2^(-1) mod 5$, #h(0.4em) $3^(-1) mod 11$, #h(0.4em) $5^(-1) mod 12$, #h(0.4em) $4^(-1) mod 9$.] #v(0.3em) \ $2 dot 3 = 6 equiv 1$ → *3* #h(1em) $3 dot 4 = 12 equiv 1$ → *4* #h(1em) $5 dot 5 = 25 equiv 1$ → *5* (selbstinvers) #h(1em) $4 dot 7 = 28 equiv 1$ → *7*]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe C3: Inverse mit erweitertem Euklid* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Bestimme das Inverse (oder begründe, dass es keines gibt): \ a) $11 mod 26$ #h(0.5em) b) $17 mod 43$ #h(0.5em) c) $23 mod 120$ #h(0.5em) d) $31 mod 100$ \ e) $15 mod 36$ #h(0.5em) f) $101 mod 257$ #h(0.5em) g) $35 mod 64$ #h(0.5em) h) $55 mod 89$] #v(0.3em) \ *a)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$26$], [$11$], [$2$], [$4$], [$3$], [$-7$],
[$11$], [$4$], [$2$], [$3$], [$-1$], [$3$],
[$4$], [$3$], [$1$], [$1$], [$1$], [$-1$],
[$3$], [$1$], [$3$], [$0$], [$0$], [$1$]))
$1 = (3) dot 26 + (-7) dot 11$ → Faktor vor $11$: $-7$, also $-7 + 26 = 19$. *Inverses: 19.* Probe: $11 dot 19 = 209 = 8 dot 26 + 1$ ✓ \ *b)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$43$], [$17$], [$2$], [$9$], [$2$], [$-5$],
[$17$], [$9$], [$1$], [$8$], [$-1$], [$2$],
[$9$], [$8$], [$1$], [$1$], [$1$], [$-1$],
[$8$], [$1$], [$8$], [$0$], [$0$], [$1$]))
$1 = (2) dot 43 + (-5) dot 17$ → Faktor vor $17$: $-5$, also $-5 + 43 = 38$. *Inverses: 38.* Probe: $17 dot 38 = 646 = 15 dot 43 + 1$ ✓ \ *c)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$120$], [$23$], [$5$], [$5$], [$-9$], [$47$],
[$23$], [$5$], [$4$], [$3$], [$2$], [$-9$],
[$5$], [$3$], [$1$], [$2$], [$-1$], [$2$],
[$3$], [$2$], [$1$], [$1$], [$1$], [$-1$],
[$2$], [$1$], [$2$], [$0$], [$0$], [$1$]))
$1 = (-9) dot 120 + (47) dot 23$ → Faktor vor $23$: $47$. *Inverses: 47.* Probe: $23 dot 47 = 1081 = 9 dot 120 + 1$ ✓ \ *d)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$100$], [$31$], [$3$], [$7$], [$9$], [$-29$],
[$31$], [$7$], [$4$], [$3$], [$-2$], [$9$],
[$7$], [$3$], [$2$], [$1$], [$1$], [$-2$],
[$3$], [$1$], [$3$], [$0$], [$0$], [$1$]))
$1 = (9) dot 100 + (-29) dot 31$ → Faktor vor $31$: $-29$, also $-29 + 100 = 71$. *Inverses: 71.* Probe: $31 dot 71 = 2201 = 22 dot 100 + 1$ ✓ \ *e)* $ 36 &= 2 dot 15 + 6 \
15 &= 2 dot 6 + 3 \
6 &= 2 dot 3 + 0 $ $ggT(15, 36) = 3 != 1$ → *kein Inverses* (Satz 8). \ *f)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$257$], [$101$], [$2$], [$55$], [$-11$], [$28$],
[$101$], [$55$], [$1$], [$46$], [$6$], [$-11$],
[$55$], [$46$], [$1$], [$9$], [$-5$], [$6$],
[$46$], [$9$], [$5$], [$1$], [$1$], [$-5$],
[$9$], [$1$], [$9$], [$0$], [$0$], [$1$]))
$1 = (-11) dot 257 + (28) dot 101$ → Faktor vor $101$: $28$. *Inverses: 28.* Probe: $101 dot 28 = 2828 = 11 dot 257 + 1$ ✓ \ *g)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$64$], [$35$], [$1$], [$29$], [$-6$], [$11$],
[$35$], [$29$], [$1$], [$6$], [$5$], [$-6$],
[$29$], [$6$], [$4$], [$5$], [$-1$], [$5$],
[$6$], [$5$], [$1$], [$1$], [$1$], [$-1$],
[$5$], [$1$], [$5$], [$0$], [$0$], [$1$]))
$1 = (-6) dot 64 + (11) dot 35$ → Faktor vor $35$: $11$. *Inverses: 11.* Probe: $35 dot 11 = 385 = 6 dot 64 + 1$ ✓ \ *h)* #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$89$], [$55$], [$1$], [$34$], [$-21$], [$34$],
[$55$], [$34$], [$1$], [$21$], [$13$], [$-21$],
[$34$], [$21$], [$1$], [$13$], [$-8$], [$13$],
[$21$], [$13$], [$1$], [$8$], [$5$], [$-8$],
[$13$], [$8$], [$1$], [$5$], [$-3$], [$5$],
[$8$], [$5$], [$1$], [$3$], [$2$], [$-3$],
[$5$], [$3$], [$1$], [$2$], [$-1$], [$2$],
[$3$], [$2$], [$1$], [$1$], [$1$], [$-1$],
[$2$], [$1$], [$2$], [$0$], [$0$], [$1$]))
$1 = (-21) dot 89 + (34) dot 55$ → Faktor vor $55$: $34$. *Inverses: 34.* Probe: $55 dot 34 = 1870 = 21 dot 89 + 1$ ✓]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe C4: Einheiten in $ZZ_12$ und $ZZ_15$* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Welche Klassen in $ZZ_12$ bzw. $ZZ_15$ sind invertierbar? Gib jeweils das Inverse an. Begründe, warum genau diese.] #v(0.3em) \ Invertierbar ⇔ teilerfremd zum Modul (Satz 8). #h(0.5em) $ZZ_12$: $1, 5, 7, 11$, alle *selbstinvers* ($25 = 2 dot 12 + 1$, $49 = 4 dot 12 + 1$, $121 = 10 dot 12 + 1$). #h(1em) $ZZ_15$: $1 <-> 1$, $2 <-> 8$, $4 <-> 4$, $7 <-> 13$, $11 <-> 11$, $14 <-> 14$ (z. B. $2 dot 8 = 16 equiv 1$, $7 dot 13 = 91 = 6 dot 15 + 1$).]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe C5: Nullteiler* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Begründe, dass 6 kein Inverses modulo 21 hat, auf *zwei* Arten: mit dem ggT und mit einem $y equiv.not 0$, für das $6y equiv 0 md(21)$ gilt.] #v(0.3em) \ 1) $ggT(6, 21) = 3 != 1$ ⇒ kein Inverses (Satz 8). #h(1em) 2) $y = 21/3 = 7$: $6 dot 7 = 42 equiv 0 md(21)$. Gäbe es $x$ mit $6x equiv 1$, so wäre $7 equiv x dot 6 dot 7 equiv x dot 0 = 0 md(21)$, Widerspruch.]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe C6: Beweise zum Inversen* #h(1fr) #text(fill: luma(120))[★★★] \ #text(size: 9.5pt, fill: luma(90))[a) Beweise ohne Skript: $a$ hat genau dann ein Inverses mod $m$, wenn $ggT(a, m) = 1$. \ b) Zeige: Sind $a$ und $b$ invertierbar mod $m$, so auch $a dot b$, und $(a b)^(-1) equiv b^(-1) a^(-1)$.] #v(0.3em) \ a) siehe Skript, Satz 8: „⇐“ Bézout $1 = x a + y m$ ⇒ $a x equiv 1$. „⇒“ $a x - 1 = k m$ ⇒ $1 = a x - k m$, $ggT(a, m)$ teilt die rechte Seite ⇒ teilt 1. #h(0.5em) b) $(a b)(b^(-1) a^(-1)) = a (b b^(-1)) a^(-1) equiv a dot 1 dot a^(-1) equiv 1 md(m)$ (Satz 5). Also ist $b^(-1) a^(-1)$ ein Inverses von $a b$; nach Satz 9 ist es eindeutig.]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe C7: Für welche Moduln?* #h(1fr) #text(fill: luma(120))[★★★] \ #text(size: 9.5pt, fill: luma(90))[Für welche $m$ mit $2 <= m <= 20$ besitzt 10 ein Inverses modulo $m$? Bestimme es für $m = 7$, $m = 13$ und $m = 17$.] #v(0.3em) \ Genau für $ggT(10, m) = 1$, d. h. $m$ weder durch 2 noch durch 5 teilbar: *$m in {3, 7, 9, 11, 13, 17, 19}$*. #h(0.5em) $m = 7$: $10 equiv 3$, $3 dot 5 = 15 equiv 1$ → *5*. #h(1em) $m = 13$: $10 dot 4 = 40 = 3 dot 13 + 1$ → *4*. #h(1em) $m = 17$: #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$17$], [$10$], [$1$], [$7$], [$3$], [$-5$],
[$10$], [$7$], [$1$], [$3$], [$-2$], [$3$],
[$7$], [$3$], [$2$], [$1$], [$1$], [$-2$],
[$3$], [$1$], [$3$], [$0$], [$0$], [$1$]))
$1 = (3) dot 17 + (-5) dot 10$ → Faktor vor $10$: $-5$, also $-5 + 17 = 12$. *Inverses: 12.* Probe: $10 dot 12 = 120 = 7 dot 17 + 1$ ✓]
#line(length: 100%, stroke: 0.3pt + luma(200))
= Teil D: Kongruenzen, Gleichungen, Anwendungen
#block(breakable: true, above: 1em)[*Aufgabe D1: Lineare Kongruenzen* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Löse (alle Lösungen modulo $m$ angeben): \ a) $5x equiv 3 md(7)$ #h(0.6em) b) $11x equiv 5 md(26)$ #h(0.6em) c) $17x equiv 9 md(43)$ #h(0.6em) d) $23x equiv 4 md(120)$ \ e) $4x equiv 6 md(10)$ #h(0.6em) f) $10x equiv 7 md(25)$ #h(0.6em) g) $12x equiv 18 md(30)$] #v(0.3em) \ *a)* $5^(-1) equiv 3 md(7)$, also $x equiv 3 dot 3 = 9 equiv 2 md(7)$. *$x equiv 2 md(7)$*. Probe: $5 dot 2 = 10 equiv 3$ ✓ \ *b)* $11^(-1) equiv 19 md(26)$, also $x equiv 19 dot 5 = 95 equiv 17 md(26)$. *$x equiv 17 md(26)$*. Probe: $11 dot 17 = 187 equiv 5$ ✓ \ *c)* $17^(-1) equiv 38 md(43)$, also $x equiv 38 dot 9 = 342 equiv 41 md(43)$. *$x equiv 41 md(43)$*. Probe: $17 dot 41 = 697 equiv 9$ ✓ \ *d)* $23^(-1) equiv 47 md(120)$, also $x equiv 47 dot 4 = 188 equiv 68 md(120)$. *$x equiv 68 md(120)$*. Probe: $23 dot 68 = 1564 equiv 4$ ✓ \ *e)* $ggT(4, 10) = 2 divides 6$ → 2 Lösungen. Durch 2 teilen: $2x equiv 3 md(5)$. $2^(-1) equiv 3 md(5)$, also $x equiv 3 dot 3 = 9 equiv 4 md(5)$. Lösungen mod 10: *$x in {4, 9}$*. \ *f)* $ggT(10, 25) = 5 divides.not 7$ → *unlösbar*. \ *g)* $ggT(12, 30) = 6 divides 18$ → 6 Lösungen. Durch 6 teilen: $2x equiv 3 md(5)$. $2^(-1) equiv 3 md(5)$, also $x equiv 3 dot 3 = 9 equiv 4 md(5)$. Lösungen mod 30: *$x in {4, 9, 14, 19, 24, 29}$*. \ _Inverse aus C3:_ $11^(-1) = 19 md(26)$, $17^(-1) = 38 md(43)$, $23^(-1) = 47 md(120)$; $5^(-1) = 3 md(7)$ wegen $15 equiv 1$.]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe D2: Lineare diophantische Gleichungen* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Bestimme *alle* ganzzahligen Lösungen bzw. begründe, dass es keine gibt: \ a) $7x + 26y = 1$ #h(0.6em) b) $15x + 21y = 9$ #h(0.6em) c) $6x + 10y = 7$] #v(0.3em) \ a) Bézout (Skript): $1 = -11 dot 7 + 3 dot 26$ → $x_0 = -11, y_0 = 3$. Alle: *$x = -11 + 26k$, $y = 3 - 7k$* ($k in ZZ$). #h(1em) b) $ggT(15, 21) = 3 divides 9$ ✓. $3 = 3 dot 15 - 2 dot 21$, mal 3: $9 = 9 dot 15 - 6 dot 21$. Alle: *$x = 9 + 7k$, $y = -6 - 5k$* (Schrittweite $21/3 = 7$ bzw. $15/3 = 5$). Probe $k = 0$: $135 - 126 = 9$ ✓ #h(1em) c) $ggT(6, 10) = 2 divides.not 7$ → *keine Lösung* (links immer gerade, rechts ungerade).]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe D3: Porto* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Mit Briefmarken zu 7 ct und 11 ct soll *genau* 1 € Porto geklebt werden. Wie viele Marken jeder Sorte braucht man? Finde alle Möglichkeiten. _Tipp:_ Rechne modulo 7 oder modulo 11.] #v(0.3em) \ $7x + 11y = 100$, $x, y >= 0$. Modulo 7: $11y equiv 100$ ⇔ $4y equiv 2 md(7)$; $4^(-1) = 2$ (da $8 equiv 1$) ⇒ $y equiv 4 md(7)$. $y = 4$: $7x = 56$ ⇒ $x = 8$. $y = 11$: $7x = -21 < 0$ ✗. *Einzige Möglichkeit: 8 Marken zu 7 ct und 4 zu 11 ct* ($56 + 44 = 100$ ✓).]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe D4: Potenzen modulo m* #h(1fr) #text(fill: luma(120))[★★☆] \ #text(size: 9.5pt, fill: luma(90))[Berechne geschickt: a) $5^100 mod 13$ #h(0.6em) b) $2^64 mod 11$ #h(0.6em) c) $7^222 mod 10$ #h(0.6em) d) $4^1000 mod 9$] #v(0.3em) \ a) $5^2 = 25 equiv -1 md(13)$ ⇒ $5^4 equiv 1$ ⇒ $5^100 = (5^4)^25 equiv$ *1* #h(1em) b) Quadrieren: $2^2 = 4, 2^4 = 16 equiv 5, 2^8 equiv 25 equiv 3, 2^16 equiv 9, 2^32 equiv 81 equiv 4, 2^64 equiv 16 equiv$ *5* #h(1em) c) $7^2 = 49 equiv -1 md(10)$ ⇒ $7^222 = (7^2)^111 equiv (-1)^111 = -1 equiv$ *9* #h(1em) d) $4^3 = 64 equiv 1 md(9)$, $1000 = 3 dot 333 + 1$ ⇒ $4^1000 equiv 4$ → *4*]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe D5: Affine Chiffre* #h(1fr) #text(fill: luma(120))[★★★] \ #text(size: 9.5pt, fill: luma(90))[Verschlüsselt wird mit $E(x) = (5x + 8) mod 26$ ($A = 0, ..., Z = 25$). \ a) Verschlüssele „MATHE“. #h(0.5em) b) Bestimme die Entschlüsselungsfunktion $D$. \ c) Entschlüssele „QAXELA“. #h(0.5em) d) Warum wäre $E(x) = (13x + 8) mod 26$ unbrauchbar?] #v(0.3em) \ a) M=12, A=0, T=19, H=7, E=4 → $5x + 8$: $68, 8, 103, 43, 28$ → mod 26: $16, 8, 25, 17, 2$ → *QIZRC*. #h(1em) b) $ggT(5, 26) = 1$, $5^(-1) equiv 21 md(26)$ (Probe: $105 = 4 dot 26 + 1$ ✓). $y equiv 5x + 8$ ⇔ $x equiv 21 (y - 8) md(26)$, also *$D(y) = 21(y - 8) mod 26$*. #h(1em) c) Q=16, A=0, X=23, E=4, L=11, A=0 → $21(y - 8) mod 26$ → *MODULO* #h(1em) d) $ggT(13, 26) = 13 != 1$, also hat 13 kein Inverses: $E$ ist nicht umkehrbar. Z. B. $E(0) = 8 = E(2)$ (denn $13 dot 2 = 26 equiv 0$): A und C werden beide zu I.]
#line(length: 100%, stroke: 0.3pt + luma(200))
#block(breakable: true, above: 1em)[*Aufgabe D6: ISBN-Prüfziffer* #h(1fr) #text(fill: luma(120))[★★★] \ #text(size: 9.5pt, fill: luma(90))[Bei der ISBN-10 $z_1 z_2 ... z_10$ muss gelten: $1 dot z_1 + 2 dot z_2 + ... + 10 dot z_10 equiv 0 md(11)$. \ In der ISBN 3-12-*?*31045-8 ist eine Ziffer unleserlich. Bestimme sie mit einem Inversen.] #v(0.3em) \ Bekannte Summe: $1 dot 3 + 2 dot 1 + 3 dot 2 + 5 dot 3 + 6 dot 1 + 7 dot 0 + 8 dot 4 + 9 dot 5 + 10 dot 8 = 189 equiv 2 md(11)$. Bedingung: $2 + 4z equiv 0$ ⇔ $4z equiv 9 md(11)$. $4^(-1) equiv 3 md(11)$ ($12 equiv 1$). ⇒ $z equiv 3 dot 9 = 27 equiv 5$. *Die Ziffer ist 5* (ISBN 3-12-531045-8).]
#line(length: 100%, stroke: 0.3pt + luma(200))
#pagebreak()
= Probe-Ex (20 BE · 20 Minuten · ohne Hilfsmittel)
*Aufgabe 1* [4 BE] \ #text(size: 9.5pt, fill: luma(90))[a) Berechne $2^100 mod 7$. [2] #h(1em) b) Entscheide mit Begründung: $123 equiv -3 md(7)$. [2]] \ a) $2^3 = 8 equiv 1$, $100 = 3 dot 33 + 1$ ⇒ $2^100 equiv 2$ → *2*. b) $123 - (-3) = 126 = 18 dot 7$ → *wahr*.
#line(length: 100%, stroke: 0.3pt + luma(200))
*Aufgabe 2* [6 BE] \ #text(size: 9.5pt, fill: luma(90))[Bestimme mit dem erweiterten euklidischen Algorithmus $ggT(119, 84)$ und ganze Zahlen $x, y$ mit $ggT(119, 84) = 119x + 84y$.] \ #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$119$], [$84$], [$1$], [$35$], [$5$], [$-7$],
[$84$], [$35$], [$2$], [$14$], [$-2$], [$5$],
[$35$], [$14$], [$2$], [$7$], [$1$], [$-2$],
[$14$], [$7$], [$2$], [$0$], [$0$], [$1$]))
$ggT(119, 84) = 7 = (5) dot 119 + (-7) dot 84$. *Probe:* $595 + (-588) = 7$ ✓
#line(length: 100%, stroke: 0.3pt + luma(200))
*Aufgabe 3* [5 BE] \ #text(size: 9.5pt, fill: luma(90))[a) Begründe, dass 19 ein Inverses modulo 60 besitzt, und bestimme es. [3] #h(1em) b) Löse $19x equiv 7 md(60)$. [2]] \ #align(center, etab([$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
[$60$], [$19$], [$3$], [$3$], [$-6$], [$19$],
[$19$], [$3$], [$6$], [$1$], [$1$], [$-6$],
[$3$], [$1$], [$3$], [$0$], [$0$], [$1$]))
$1 = (-6) dot 60 + (19) dot 19$ → Faktor vor $19$: $19$. *Inverses: 19.* Probe: $19 dot 19 = 361 = 6 dot 60 + 1$ ✓ (19 ist selbstinvers!) #h(1em) b) $x equiv 19 dot 7 = 133 equiv$ *13* $md(60)$. Probe: $19 dot 13 = 247 = 4 dot 60 + 7$ ✓
#line(length: 100%, stroke: 0.3pt + luma(200))
*Aufgabe 4* [5 BE] \ #text(size: 9.5pt, fill: luma(90))[a) Beweise: Hat $a$ ein Inverses modulo $m$, so ist es modulo $m$ eindeutig. [2] #h(1em) b) Zeige, dass 15 kein Inverses modulo 35 hat, und gib ein $y equiv.not 0$ an mit $15y equiv 0 md(35)$. [3]] \ a) Aus $a x equiv 1$ und $a y equiv 1$: $x equiv x(a y) = (x a) y equiv y$. b) $ggT(15, 35) = 5 != 1$ ⇒ kein Inverses (Satz 8). $y = 35/5 = 7$: $15 dot 7 = 105 = 3 dot 35 equiv 0$. (Gäbe es $x$, wäre $7 equiv x dot 15 dot 7 equiv 0$, Widerspruch.)
#line(length: 100%, stroke: 0.3pt + luma(200))
