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
#show: doc.with("Zahlentheorie – Übungsaufgaben", "Modulo · ggT · erweiterter Euklid · Inverse · Kongruenzen — mit Platz zum Rechnen")
#set heading(numbering: none)
#kasten("So arbeitest du", farbe)[Schwierigkeit: ★☆☆ Basis · ★★☆ Ex-Standard · ★★★ für die 15 Punkte. Erst Teil A–D, dann die *Probe-Ex* am Ende unter Zeitdruck (20 min, ohne Skript). Lösungen stehen in einem separaten PDF. Immer *Probe* machen!]
= Teil A: Rechnen modulo m
#block(breakable: false, above: 1em)[*Aufgabe A1: Reste berechnen* #h(1fr) #text(fill: luma(120))[★☆☆] \ Berechne: #h(0.5em) a) $47 mod 5$ #h(0.6em) b) $100 mod 7$ #h(0.6em) c) $2026 mod 9$ #h(0.6em) d) $-13 mod 5$ \ e) $-100 mod 7$ #h(0.6em) f) $-1 mod 26$ #h(0.6em) g) $123456 mod 4$ #h(0.6em) h) $5^3 mod 6$ #karo(5cm)]
#block(breakable: false, above: 1em)[*Aufgabe A2: Kongruent oder nicht?* #h(1fr) #text(fill: luma(120))[★☆☆] \ Entscheide und begründe mit der Definition ($m divides (a - b)$): \ a) $38 equiv 3 md(7)$ #h(0.6em) b) $100 equiv -2 md(17)$ #h(0.6em) c) $1001 equiv 1 md(7)$ \ d) $-8 equiv 13 md(7)$ #h(0.6em) e) $57 equiv 3 md(11)$ #h(0.6em) f) $2^10 equiv 1 md(11)$ #karo(5cm)]
#block(breakable: false, above: 1em)[*Aufgabe A3: Restklassen auflisten* #h(1fr) #text(fill: luma(120))[★☆☆] \ a) Gib alle $x in ZZ$ mit $-20 <= x <= 20$ und $x equiv 3 md(7)$ an. \ b) Gib alle $x$ mit $0 <= x <= 50$ und $x equiv -1 md(9)$ an. #karo(3.5cm)]
#block(breakable: false, above: 1em)[*Aufgabe A4: Geschickt rechnen (ohne TR)* #h(1fr) #text(fill: luma(120))[★★☆] \ a) $123 dot 456 mod 10$ #h(0.6em) b) $99 dot 98 dot 97 mod 100$ #h(0.6em) c) $2^10 mod 7$ #h(0.6em) d) $17^100 mod 4$ \ e) $3^2026 mod 8$ #h(0.6em) f) $(-1)^2027 + 10^50 mod 9$ #h(0.6em) g) $6^50 mod 7$ #karo(6cm)]
#block(breakable: false, above: 1em)[*Aufgabe A5: Endziffern* #h(1fr) #text(fill: luma(120))[★★☆] \ Bestimme die letzte Ziffer von a) $3^2026$, b) $2^100$, c) $9^2027$ und d) die letzten *zwei* Ziffern von $7^100$. #karo(5cm)]
#block(breakable: false, above: 1em)[*Aufgabe A6: Uhr und Kalender* #h(1fr) #text(fill: luma(120))[★★☆] \ a) Heute ist Samstag. Welcher Wochentag ist in 1000 Tagen? \ b) Es ist 9 Uhr. Wie spät ist es in 1000 Stunden? Wie spät war es vor 100 Stunden? #karo(4cm)]
#block(breakable: false, above: 1em)[*Aufgabe A7: Verknüpfungstafeln* #h(1fr) #text(fill: luma(120))[★★☆] \ Stelle die Multiplikationstafeln von $ZZ_7$ und $ZZ_8$ auf. Lies ab: Welche Klassen haben ein Inverses (welches)? Welche sind Nullteiler? Erkläre den Unterschied mit dem ggT. #karo(9cm)]
#block(breakable: false, above: 1em)[*Aufgabe A8: Quadratzahlen modulo 4* #h(1fr) #text(fill: luma(120))[★★☆] \ a) Beweise: Jede Quadratzahl ist $equiv 0$ oder $equiv 1 md(4)$. \ b) Folgere: Keine Zahl der Form $4k + 3$ (z. B. 2027) ist Summe zweier Quadratzahlen. #karo(6cm)]
#block(breakable: false, above: 1em)[*Aufgabe A9: Teilbarkeitsbeweise mit Modulo* #h(1fr) #text(fill: luma(120))[★★★] \ a) Beweise die Elferregel: $n$ ist genau dann durch 11 teilbar, wenn die alternierende Quersumme $a_0 - a_1 + a_2 - ...$ durch 11 teilbar ist. \ b) Zeige mit einer Restetabelle modulo 6: $6 divides n^3 - n$ für alle $n in ZZ$. #karo(7cm)]
#pagebreak()
= Teil B: ggT und (erweiterter) Euklid
#block(breakable: false, above: 1em)[*Aufgabe B1: ggT mit Euklid* #h(1fr) #text(fill: luma(120))[★☆☆] \ Bestimme mit dem euklidischen Algorithmus: \ a) $ggT(252, 198)$ #h(0.6em) b) $ggT(391, 299)$ #h(0.6em) c) $ggT(987, 610)$ #h(0.6em) d) $ggT(3465, 1287)$ #karo(9cm)]
#block(breakable: false, above: 1em)[*Aufgabe B2: Erweiterter Euklid* #h(1fr) #text(fill: luma(120))[★★☆] \ Stelle den ggT als Vielfachsumme $ggT(a, b) = x dot a + y dot b$ dar und mache die Probe: \ a) $a = 240, b = 46$ #h(0.6em) b) $a = 161, b = 28$ #h(0.6em) c) $a = 1001, b = 221$ #h(0.6em) d) $a = 987, b = 610$ #karo(14cm)]
#block(breakable: false, above: 1em)[*Aufgabe B3: ggT-Beweise* #h(1fr) #text(fill: luma(120))[★★☆] \ Beweise für alle $n in NN$: #h(0.5em) a) $ggT(n, n + 1) = 1$ #h(1em) b) $ggT(2n + 1, 3n + 1) = 1$ \ _Tipp:_ Finde eine Vielfachsumme, die 1 ergibt. #karo(5cm)]
#block(breakable: false, above: 1em)[*Aufgabe B4: Kürzen durch den ggT* #h(1fr) #text(fill: luma(120))[★★★] \ Sei $g = ggT(a, b)$. Beweise: $ggT(a/g, b/g) = 1$. \ Gib außerdem eine zweite Vielfachsumme für $ggT(240, 46)$ an (vgl. Aufgabe B2). #karo(5cm)]
#pagebreak()
= Teil C: Das Inverse modulo m
#block(breakable: false, above: 1em)[*Aufgabe C1: Inverse prüfen* #h(1fr) #text(fill: luma(120))[★☆☆] \ Prüfe: a) Ist 5 das Inverse von 3 mod 7? #h(0.6em) b) Ist 4 das Inverse von 7 mod 9? #h(0.6em) c) Ist 6 das Inverse von 5 mod 14? #karo(3cm)]
#block(breakable: false, above: 1em)[*Aufgabe C2: Inverse durch Probieren* #h(1fr) #text(fill: luma(120))[★☆☆] \ Bestimme durch Probieren (kleine Moduln!): $2^(-1) mod 5$, #h(0.4em) $3^(-1) mod 11$, #h(0.4em) $5^(-1) mod 12$, #h(0.4em) $4^(-1) mod 9$. #karo(3cm)]
#block(breakable: false, above: 1em)[*Aufgabe C3: Inverse mit erweitertem Euklid* #h(1fr) #text(fill: luma(120))[★★☆] \ Bestimme das Inverse (oder begründe, dass es keines gibt): \ a) $11 mod 26$ #h(0.5em) b) $17 mod 43$ #h(0.5em) c) $23 mod 120$ #h(0.5em) d) $31 mod 100$ \ e) $15 mod 36$ #h(0.5em) f) $101 mod 257$ #h(0.5em) g) $35 mod 64$ #h(0.5em) h) $55 mod 89$ #karo(22cm)]
#block(breakable: false, above: 1em)[*Aufgabe C4: Einheiten in $ZZ_12$ und $ZZ_15$* #h(1fr) #text(fill: luma(120))[★★☆] \ Welche Klassen in $ZZ_12$ bzw. $ZZ_15$ sind invertierbar? Gib jeweils das Inverse an. Begründe, warum genau diese. #karo(5cm)]
#block(breakable: false, above: 1em)[*Aufgabe C5: Nullteiler* #h(1fr) #text(fill: luma(120))[★★☆] \ Begründe, dass 6 kein Inverses modulo 21 hat, auf *zwei* Arten: mit dem ggT und mit einem $y equiv.not 0$, für das $6y equiv 0 md(21)$ gilt. #karo(4cm)]
#block(breakable: false, above: 1em)[*Aufgabe C6: Beweise zum Inversen* #h(1fr) #text(fill: luma(120))[★★★] \ a) Beweise ohne Skript: $a$ hat genau dann ein Inverses mod $m$, wenn $ggT(a, m) = 1$. \ b) Zeige: Sind $a$ und $b$ invertierbar mod $m$, so auch $a dot b$, und $(a b)^(-1) equiv b^(-1) a^(-1)$. #karo(9cm)]
#block(breakable: false, above: 1em)[*Aufgabe C7: Für welche Moduln?* #h(1fr) #text(fill: luma(120))[★★★] \ Für welche $m$ mit $2 <= m <= 20$ besitzt 10 ein Inverses modulo $m$? Bestimme es für $m = 7$, $m = 13$ und $m = 17$. #karo(7cm)]
#pagebreak()
= Teil D: Kongruenzen, Gleichungen, Anwendungen
#block(breakable: false, above: 1em)[*Aufgabe D1: Lineare Kongruenzen* #h(1fr) #text(fill: luma(120))[★★☆] \ Löse (alle Lösungen modulo $m$ angeben): \ a) $5x equiv 3 md(7)$ #h(0.6em) b) $11x equiv 5 md(26)$ #h(0.6em) c) $17x equiv 9 md(43)$ #h(0.6em) d) $23x equiv 4 md(120)$ \ e) $4x equiv 6 md(10)$ #h(0.6em) f) $10x equiv 7 md(25)$ #h(0.6em) g) $12x equiv 18 md(30)$ #karo(16cm)]
#block(breakable: false, above: 1em)[*Aufgabe D2: Lineare diophantische Gleichungen* #h(1fr) #text(fill: luma(120))[★★☆] \ Bestimme *alle* ganzzahligen Lösungen bzw. begründe, dass es keine gibt: \ a) $7x + 26y = 1$ #h(0.6em) b) $15x + 21y = 9$ #h(0.6em) c) $6x + 10y = 7$ #karo(9cm)]
#block(breakable: false, above: 1em)[*Aufgabe D3: Porto* #h(1fr) #text(fill: luma(120))[★★☆] \ Mit Briefmarken zu 7 ct und 11 ct soll *genau* 1 € Porto geklebt werden. Wie viele Marken jeder Sorte braucht man? Finde alle Möglichkeiten. _Tipp:_ Rechne modulo 7 oder modulo 11. #karo(6cm)]
#block(breakable: false, above: 1em)[*Aufgabe D4: Potenzen modulo m* #h(1fr) #text(fill: luma(120))[★★☆] \ Berechne geschickt: a) $5^100 mod 13$ #h(0.6em) b) $2^64 mod 11$ #h(0.6em) c) $7^222 mod 10$ #h(0.6em) d) $4^1000 mod 9$ #karo(7cm)]
#block(breakable: false, above: 1em)[*Aufgabe D5: Affine Chiffre* #h(1fr) #text(fill: luma(120))[★★★] \ Verschlüsselt wird mit $E(x) = (5x + 8) mod 26$ ($A = 0, ..., Z = 25$). \ a) Verschlüssele „MATHE“. #h(0.5em) b) Bestimme die Entschlüsselungsfunktion $D$. \ c) Entschlüssele „QAXELA“. #h(0.5em) d) Warum wäre $E(x) = (13x + 8) mod 26$ unbrauchbar? #karo(10cm)]
#block(breakable: false, above: 1em)[*Aufgabe D6: ISBN-Prüfziffer* #h(1fr) #text(fill: luma(120))[★★★] \ Bei der ISBN-10 $z_1 z_2 ... z_10$ muss gelten: $1 dot z_1 + 2 dot z_2 + ... + 10 dot z_10 equiv 0 md(11)$. \ In der ISBN 3-12-*?*31045-8 ist eine Ziffer unleserlich. Bestimme sie mit einem Inversen. #karo(6cm)]
#pagebreak()
= Probe-Ex (20 BE · 20 Minuten · ohne Hilfsmittel)
#text(size: 9.5pt, fill: luma(90))[Bewertung: 20–19 BE ≙ 15–14 P · 18 ≙ 13 · 17 ≙ 12 · 16 ≙ 11 · 15 ≙ 10 · 14 ≙ 9 · 13 ≙ 8 · 12 ≙ 7 · 11–10 ≙ 6–5 · darunter < 5 P (Richtwerte, Schlüssel deiner Lehrkraft kann abweichen)]
#block(breakable: false, above: 1em)[*Aufgabe 1* #h(1fr) [4 BE] \ a) Berechne $2^100 mod 7$. [2] #h(1em) b) Entscheide mit Begründung: $123 equiv -3 md(7)$. [2] #karo(5cm)]
#block(breakable: false, above: 1em)[*Aufgabe 2* #h(1fr) [6 BE] \ Bestimme mit dem erweiterten euklidischen Algorithmus $ggT(119, 84)$ und ganze Zahlen $x, y$ mit $ggT(119, 84) = 119x + 84y$. #karo(8cm)]
#block(breakable: false, above: 1em)[*Aufgabe 3* #h(1fr) [5 BE] \ a) Begründe, dass 19 ein Inverses modulo 60 besitzt, und bestimme es. [3] #h(1em) b) Löse $19x equiv 7 md(60)$. [2] #karo(7cm)]
#block(breakable: false, above: 1em)[*Aufgabe 4* #h(1fr) [5 BE] \ a) Beweise: Hat $a$ ein Inverses modulo $m$, so ist es modulo $m$ eindeutig. [2] #h(1em) b) Zeige, dass 15 kein Inverses modulo 35 hat, und gib ein $y equiv.not 0$ an mit $15y equiv 0 md(35)$. [3] #karo(7cm)]
