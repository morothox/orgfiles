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
#show: doc.with("Zahlentheorie: Modulo, ggT & Inverse", "Skript mit Herleitungen und Beweisen · Modul Zahlentheorie und Kryptologie · Vorbereitung Ex")

#outline(title: "Inhalt", depth: 1, indent: 1em)

= Teilbarkeit

#defi("Teiler")[Für ganze Zahlen $a, b$ heißt $a$ *Teiler* von $b$, geschrieben $a divides b$, wenn es ein $k in ZZ$ gibt mit $b = k dot a$. Sonst schreibt man $a divides.not b$.]

Beispiele: $7 divides 35$, da $35 = 5 dot 7$ · $4 divides.not 10$ · $3 divides -12$ · jede Zahl teilt $0$, da $0 = 0 dot a$.

#satz("Satz 1 (Teilbarkeitsregeln)")[Für $a, b, c in ZZ$ gilt:
+ Aus $a divides b$ und $b divides c$ folgt $a divides c$.
+ Aus $a divides b$ und $a divides c$ folgt $a divides (x b + y c)$ für *alle* $x, y in ZZ$.]

#beweis[(1) $b = k a$ und $c = l b$ $==>$ $c = l k a = (l k) dot a$.
(2) $b = k a$ und $c = l a$ $==>$ $x b + y c = x k a + y l a = (x k + y l) dot a$, und $x k + y l in ZZ$.]

#merke[Regel (2) ist _das_ Werkzeug für fast alle Beweise in diesem Kapitel: *Ein gemeinsamer Teiler von zwei Zahlen teilt auch jede Summe von Vielfachen dieser Zahlen* (jede „Vielfachsumme“), insbesondere ihre Summe und ihre Differenz.]

= Division mit Rest und „mod“

#satz("Satz 2 (Division mit Rest)")[Zu jedem $a in ZZ$ und jedem $m in NN$ mit $m >= 1$ gibt es *genau ein* Paar $q, r in ZZ$ mit
$ a = q dot m + r quad "und" quad 0 <= r < m. $
$r$ heißt *Rest* von $a$ bei Division durch $m$ und wird $a mod m$ geschrieben.]

#beweis[_Existenz:_ Setze $q = floor(a/m)$ (größte ganze Zahl $<= a/m$) und $r = a - q m$. Wegen $q <= a/m < q + 1$ folgt nach Multiplikation mit $m$: $q m <= a < q m + m$, also $0 <= a - q m < m$, d. h. $0 <= r < m$.

_Eindeutigkeit:_ Angenommen $a = q m + r = q' m + r'$ mit $0 <= r, r' < m$. Dann ist $(q - q') m = r' - r$. Die rechte Seite liegt zwischen $-m$ und $m$ (echt), die linke ist ein Vielfaches von $m$. Das einzige Vielfache von $m$ echt zwischen $-m$ und $m$ ist $0$. Also $r = r'$ und damit $q = q'$.]

#bsp("")[$47 = 9 dot 5 + 2$, also $47 mod 5 = 2$. #h(1em) $-13 = (-3) dot 5 + 2$, also $-13 mod 5 = 2$ (nicht $-3$!). #h(1em) $-1 mod 26 = 25$.]

#falle[Bei negativen Zahlen den Rest negativ angeben. Der Rest liegt _immer_ zwischen $0$ und $m - 1$. Trick: Erst wie bei positiven Zahlen rechnen ($13 mod 5 = 3$), dann $m$ minus diesen Rest: $-13 mod 5 = 5 - 3 = 2$ (falls der Rest nicht $0$ ist).]

= Kongruenz modulo $m$

#defi("Kongruenz")[Sei $m >= 2$. Zwei ganze Zahlen $a, b$ heißen *kongruent modulo $m$*, geschrieben
$ a equiv b md(m), $
wenn $m divides (a - b)$ gilt, d. h. wenn $a - b$ ein Vielfaches von $m$ ist. Gleichwertig: $a = b + k m$ für ein $k in ZZ$.]

#satz("Satz 3 (Kongruent = gleicher Rest)")[$a equiv b md(m)$ gilt genau dann, wenn $a$ und $b$ bei Division durch $m$ denselben Rest lassen.]

#beweis[Schreibe $a = q m + r$ und $b = q' m + r'$ mit $0 <= r, r' < m$ (Satz 2). Dann ist
$ a - b = (q - q') m + (r - r'). quad (*) $
„$<==$“: Ist $r = r'$, so ist $a - b = (q - q') m$, also $m divides (a - b)$.

„$==>$“: Gilt $m divides (a - b)$, so teilt $m$ nach $(*)$ und Satz 1 auch $r - r' = (a - b) - (q - q') m$. Wegen $-m < r - r' < m$ ist das einzige mögliche Vielfache $0$, also $r = r'$.]

#bsp("")[$38 equiv 3 md(7)$, denn $38 - 3 = 35 = 5 dot 7$. Ebenso: $38 mod 7 = 3$ und $3 mod 7 = 3$. #h(1em) $-8 equiv 13 md(7)$, denn $-8 - 13 = -21 = -3 dot 7$.]

#satz("Satz 4 (Äquivalenzrelation)")[Für alle $a, b, c in ZZ$: $a equiv a$ (reflexiv) · aus $a equiv b$ folgt $b equiv a$ (symmetrisch) · aus $a equiv b$ und $b equiv c$ folgt $a equiv c$ (transitiv), jeweils $md(m)$.]

#beweis[$a - a = 0 = 0 dot m$. · $b - a = -(a - b)$ ist mit $a - b$ ein Vielfaches von $m$. · $a - c = (a - b) + (b - c)$ ist Summe zweier Vielfacher von $m$ (Satz 1).]

= Rechenregeln für Kongruenzen

#satz("Satz 5 (Rechenregeln)")[Gilt $a equiv a'$ und $b equiv b' md(m)$, dann gilt auch
$ a + b equiv a' + b', quad a - b equiv a' - b', quad a dot b equiv a' dot b', quad a^n equiv a'^n quad (n in NN) quad md(m). $]

#beweis[Nach Voraussetzung gilt $m divides (a - a')$ und $m divides (b - b')$.

_Summe/Differenz:_ $(a plus.minus b) - (a' plus.minus b') = (a - a') plus.minus (b - b')$, Summe/Differenz zweier Vielfacher von $m$.

_Produkt:_ Trick „Null addieren“ ($- a' b + a' b$):
$ a b - a' b' = a b - a' b + a' b - a' b' = (a - a') dot b + a' dot (b - b'). $
Beide Summanden sind Vielfache von $m$, also nach Satz 1 auch die Summe.

_Potenz:_ Wende die Produktregel $n$-mal an: $a^2 = a dot a equiv a' dot a' = a'^2$, dann $a^3 = a^2 dot a equiv a'^2 dot a' = a'^3$ usw. (vollständige Induktion).]

#merke[In Summen, Differenzen, Produkten und in der *Basis* einer Potenz darf man jede Zahl jederzeit durch eine kongruente (meist kleinere) Zahl ersetzen. *Nicht* im Exponenten! Gegenbeispiel: $1 equiv 4 md(3)$, aber $2^1 = 2$ und $2^4 = 16 equiv 1 md(3)$.]

#bsp("Geschicktes Rechnen")[
- $98 dot 97 dot 96 equiv (-2)(-3)(-4) = -24 equiv 76 md(100)$.
- Letzte Ziffer von $7^(2026)$: $7^2 = 49 equiv -1 md(10)$, also $7^4 equiv 1$. Mit $2026 = 4 dot 506 + 2$: $7^(2026) = (7^4)^(506) dot 7^2 equiv 1 dot 49 equiv 9 md(10)$. Letzte Ziffer: *9*.
- $10^(100) mod 9$: $10 equiv 1 md(9)$ $==>$ $10^(100) equiv 1^(100) = 1$.]

#bsp("Beweis der Neunerregel")[Eine Zahl $n$ mit Ziffern $a_k ... a_1 a_0$ ist $n = a_k dot 10^k + ... + a_1 dot 10 + a_0$. Wegen $10 equiv 1 md(9)$ ist $10^i equiv 1$ für alle $i$, also
$ n equiv a_k + ... + a_1 + a_0 md(9). $
Eine Zahl lässt also bei Division durch 9 denselben Rest wie ihre Quersumme. Insbesondere: $9 divides n <==> 9 divides "Quersumme"$. (Analog Elferregel mit $10 equiv -1 md(11)$: alternierende Quersumme.)]

#falle[*Kürzen ist nicht immer erlaubt!* $2 dot 3 equiv 2 dot 6 md(6)$ (beides $equiv 0$), aber $3 equiv.not 6 md(6)$. Kürzen durch $c$ ist nur erlaubt, wenn $ggT(c, m) = 1$ ist (Satz 10).]

= Restklassen $ZZ_m$

#defi("Restklasse")[Die *Restklasse* von $r$ modulo $m$ ist die Menge aller Zahlen mit demselben Rest wie $r$:
$ overline(r) = {x in ZZ : x equiv r md(m)} = {..., r - 2m, r - m, r, r + m, r + 2m, ...}. $
Es gibt genau $m$ Restklassen: $ZZ_m = {overline(0), overline(1), ..., overline(m-1)}$.]

Man rechnet mit Restklassen über beliebige Vertreter: $overline(a) + overline(b) = overline(a + b)$ und $overline(a) dot overline(b) = overline(a dot b)$. Dass das Ergebnis nicht vom gewählten Vertreter abhängt („wohldefiniert“), ist genau die Aussage von Satz 5.

#grid(columns: (1fr, 1fr), gutter: 1em,
  [*Multiplikation in $ZZ_5$*
  #table(columns: 6, fill: (x, y) => if x == 0 or y == 0 { luma(230) },
    [$dot$], [0], [1], [2], [3], [4],
    [0], [0], [0], [0], [0], [0],
    [1], [0], [1], [2], [3], [4],
    [2], [0], [2], [4], [*1*], [3],
    [3], [0], [3], [*1*], [4], [2],
    [4], [0], [4], [3], [2], [*1*])],
  [*Multiplikation in $ZZ_6$*
  #table(columns: 7, fill: (x, y) => if x == 0 or y == 0 { luma(230) },
    [$dot$], [0], [1], [2], [3], [4], [5],
    [0], [0], [0], [0], [0], [0], [0],
    [1], [0], [*1*], [2], [3], [4], [5],
    [2], [0], [2], [4], [0], [2], [4],
    [3], [0], [3], [0], [3], [0], [3],
    [4], [0], [4], [2], [0], [4], [2],
    [5], [0], [5], [4], [3], [2], [*1*])])

*Beobachtung:* In $ZZ_5$ kommt in jeder Zeile außer der 0-Zeile eine $1$ vor, d. h. jede Klasse $!= overline(0)$ hat ein „Gegenstück“, mit dem das Produkt $overline(1)$ ergibt. In $ZZ_6$ klappt das nur für $overline(1)$ und $overline(5)$. Außerdem gibt es in $ZZ_6$ *Nullteiler*: $overline(2) dot overline(3) = overline(0)$, obwohl keiner der Faktoren $overline(0)$ ist. Warum das so ist, klärt Abschnitt 8.

= ggT und euklidischer Algorithmus

#defi("ggT")[Der *größte gemeinsame Teiler* $ggT(a, b)$ zweier ganzer Zahlen (nicht beide $0$) ist die größte natürliche Zahl, die $a$ und $b$ teilt. Ist $ggT(a, b) = 1$, heißen $a$ und $b$ *teilerfremd*.]

#satz("Satz 6 (Kernidee des euklidischen Algorithmus)")[Für $b != 0$ gilt $ggT(a, b) = ggT(b, a mod b)$.]

#beweis[Sei $a = q b + r$ mit $r = a mod b$. Wir zeigen: $a, b$ und $b, r$ haben *dieselben* gemeinsamen Teiler, dann ist auch der größte gleich.
- Teilt $d$ sowohl $a$ als auch $b$, dann teilt $d$ auch $r = a - q b$ (Satz 1, Vielfachsumme).
- Teilt $d$ sowohl $b$ als auch $r$, dann teilt $d$ auch $a = q b + r$ (Satz 1).]

*Algorithmus:* Wende Satz 6 so lange an, bis der Rest $0$ ist. Der *letzte Rest ungleich 0* ist der ggT. Der Algorithmus endet sicher, weil die Reste natürliche Zahlen sind, die echt kleiner werden ($b > r_1 > r_2 > ... >= 0$).

#bsp("ggT(1071, 462)")[
$ 1071 &= 2 dot 462 + 147 \
  462 &= 3 dot 147 + 21 \
  147 &= 7 dot 21 + 0 $
Letzter Rest $!= 0$: $ggT(1071, 462) = 21$. Begründung mit Satz 6: $ggT(1071, 462) = ggT(462, 147) = ggT(147, 21) = ggT(21, 0) = 21$.]

= Erweiterter euklidischer Algorithmus & Lemma von Bézout

#satz("Satz 7 (Lemma von Bézout, Vielfachsummendarstellung)")[Zu $a, b in ZZ$ gibt es ganze Zahlen $x, y$ mit
$ ggT(a, b) = x dot a + y dot b. $]

#beweis[Wir betrachten die Reste im euklidischen Algorithmus: $r_(-1) = a$, $r_0 = b$, und $r_(i+1) = r_(i-1) - q_i r_i$. Behauptung: *Jeder* Rest ist eine Vielfachsumme von $a$ und $b$.
- Start: $a = 1 dot a + 0 dot b$ und $b = 0 dot a + 1 dot b$.
- Schritt: Sind $r_(i-1) = x a + y b$ und $r_i = x' a + y' b$ Vielfachsummen, dann auch
  $ r_(i+1) = r_(i-1) - q_i r_i = (x - q_i x') a + (y - q_i y') b. $
Also ist auch der letzte Rest $!= 0$, der ggT, eine Vielfachsumme.]

Der Beweis liefert gleich das Rechenverfahren. Zwei Methoden, Ergebnis ist dasselbe:

== Methode A: Rückwärtseinsetzen

#bsp("ggT(99, 78) als Vielfachsumme")[
#grid(columns: (1fr, 1.25fr), gutter: 1em,
[_Vorwärts (Euklid):_
$ 99 &= 1 dot 78 + 21 \
  78 &= 3 dot 21 + 15 \
  21 &= 1 dot 15 + 6 \
  15 &= 2 dot 6 + 3 \
  6 &= 2 dot 3 + 0 $
$==> ggT = 3$],
[_Rückwärts:_ jede Zeile nach dem Rest auflösen und von unten einsetzen
$ 3 &= 15 - 2 dot 6 \
  &= 15 - 2 dot (21 - 15) = 3 dot 15 - 2 dot 21 \
  &= 3 dot (78 - 3 dot 21) - 2 dot 21 = 3 dot 78 - 11 dot 21 \
  &= 3 dot 78 - 11 dot (99 - 78) \
  &= -11 dot 99 + 14 dot 78 $])
*Probe:* $-11 dot 99 + 14 dot 78 = -1089 + 1092 = 3$ ✓]

#merke[Beim Rückwärtseinsetzen nur die Zahlen aus der Euklid-Kette (hier 99, 78, 21, 15, 6) als „Bausteine“ behandeln und *nicht ausmultiplizieren*! Man sammelt immer nur die Vorfaktoren.]

== Methode B: Tabellenmethode

Man schreibt Euklid als Tabelle. In der Zeile mit Rest $0$ setzt man $x = 0, y = 1$ (denn dort ist der ggT $= b = 0 dot a + 1 dot b$). Dann geht man *nach oben*:
$ x_"neu" = y_"darunter", quad y_"neu" = x_"darunter" - q dot y_"darunter". $
In jeder Zeile gilt dann $a dot x + b dot y = ggT$ (gute Kontrolle!).

#bsp("ggT(99, 78) mit Tabelle")[
#align(center, table(columns: 6,
  fill: (x, y) => if y == 0 { luma(230) },
  [$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
  [99], [78], [1], [21], [*−11*], [*14*],
  [78], [21], [3], [15], [3], [−11],
  [21], [15], [1], [6], [−2], [3],
  [15], [6], [2], [3], [1], [−2],
  [6], [3], [2], [0], [0], [1]))
Ablesen in der ersten Zeile: $3 = -11 dot 99 + 14 dot 78$. Kontrolle Zeile 3: $21 dot (-2) + 15 dot 3 = 3$ ✓]

#merke[Die Darstellung ist *nicht eindeutig*: Mit $(x, y)$ ist auch $(x + k dot b/g, thin y - k dot a/g)$ für jedes $k in ZZ$ eine Lösung ($g = ggT$). Z. B. $3 = 15 dot 99 - 19 dot 78$ ($k = 1$). Für die Ex reicht _eine_ Lösung.]

= Das multiplikative Inverse modulo $m$

Jetzt kommt die Frage aus dem Unterricht: *Mit welcher Zahl $x$ muss ich $a$ malnehmen, damit modulo $m$ eine $1$ herauskommt?* Das ist die „Division“ im Modulo-Rechnen.

#defi("Inverses")[Eine Zahl $x$ heißt *(multiplikatives) Inverses von $a$ modulo $m$*, wenn
$ a dot x equiv 1 md(m). $
Man schreibt $x = a^(-1) mod m$ bzw. in $ZZ_m$: $overline(x) = overline(a)^(-1)$.]

#satz("Satz 8 (Existenz des Inversen)")[$a$ besitzt genau dann ein Inverses modulo $m$, wenn $ggT(a, m) = 1$ ist.]

#beweis[„$<==$“: Sei $ggT(a, m) = 1$. Nach Bézout (Satz 7) gibt es $x, y in ZZ$ mit
$ 1 = x dot a + y dot m. $
Dann ist $a x - 1 = -y m$ ein Vielfaches von $m$, also $a x equiv 1 md(m)$. Das $x$ aus Bézout _ist_ das Inverse.

„$==>$“: Sei $a x equiv 1 md(m)$, also $a x - 1 = k m$ für ein $k in ZZ$, d. h. $1 = a x - k m$. Sei $d = ggT(a, m)$. Da $d divides a$ und $d divides m$, teilt $d$ nach Satz 1 auch die Vielfachsumme $a x - k m = 1$. Also $d = 1$.]

#satz("Satz 9 (Eindeutigkeit)")[Das Inverse ist modulo $m$ eindeutig: Aus $a x equiv 1$ und $a y equiv 1 md(m)$ folgt $x equiv y md(m)$.]

#beweis[$x equiv x dot 1 equiv x dot (a y) = (x a) dot y equiv 1 dot y = y md(m)$. (Satz 5: Ersetzen in Produkten erlaubt.)]

#merke[*Kochrezept Inverses von $a$ modulo $m$:*
+ Euklid für $m$ und $a$ $->$ ist $ggT(a, m) != 1$: *kein Inverses* (Satz 8).
+ Erweiterter Euklid $->$ $1 = x dot a + y dot m$.
+ Das Inverse ist $x mod m$. Ist $x$ negativ: $+ m$ rechnen.
+ *Probe:* $a dot x mod m = 1$?]

#bsp("Inverses von 7 modulo 26")[
#grid(columns: (1fr, 1fr), gutter: 1em,
[$ 26 &= 3 dot 7 + 5 \
   7 &= 1 dot 5 + 2 \
   5 &= 2 dot 2 + 1 \
   2 &= 2 dot 1 + 0 $
$ggT = 1$ ✓ $->$ Inverses existiert.],
[$ 1 &= 5 - 2 dot 2 \
  &= 5 - 2 dot (7 - 5) = 3 dot 5 - 2 dot 7 \
  &= 3 dot (26 - 3 dot 7) - 2 dot 7 \
  &= 3 dot 26 - 11 dot 7 $])
Also $-11 dot 7 equiv 1 md(26)$. Inverses: $-11 + 26 = bold(15)$. *Probe:* $7 dot 15 = 105 = 4 dot 26 + 1$ ✓

Mit Tabelle (gleiches Ergebnis):
#align(center, table(columns: 6, fill: (x, y) => if y == 0 { luma(230) },
  [$a$], [$b$], [$q$], [$r$], [$x$], [$y$],
  [26], [7], [3], [5], [3], [*−11*],
  [7], [5], [1], [2], [−2], [3],
  [5], [2], [2], [1], [1], [−2],
  [2], [1], [2], [0], [0], [1]))
Hier ist $y$ der Faktor vor der $7$, also das gesuchte Inverse $-11 equiv 15$.]

#falle[Aufpassen, *welcher* Faktor zum $a$ gehört! Steht $m$ in der Spalte $a$ (wie oben, $26$ links), dann ist das Inverse der *$y$-Wert*. Am sichersten: am Ende $1 = ... dot m + ... dot a$ hinschreiben und den Faktor vor $a$ nehmen.]

#bsp("Kein Inverses")[$4$ hat kein Inverses modulo $10$, da $ggT(4, 10) = 2$. Anschaulich: $4 dot x$ ist immer gerade, $4x mod 10 in {0, 2, 4, 6, 8}$, die $1$ wird nie getroffen. Außerdem ist $4 dot 5 = 20 equiv 0 md(10)$, also $overline(4)$ ein Nullteiler.]

#satz("Folgerung (Primzahlmodul)")[Ist $p$ eine Primzahl, so besitzt jede Zahl $a$ mit $p divides.not a$ ein Inverses modulo $p$. In $ZZ_p$ kann man also durch jede Klasse $!= overline(0)$ teilen.]

#beweis[Die einzigen positiven Teiler von $p$ sind $1$ und $p$. Da $p divides.not a$, ist $ggT(a, p) = 1$. Satz 8.]

#satz("Satz 10 (Kürzungsregel)")[Ist $ggT(c, m) = 1$ und $c a equiv c b md(m)$, so folgt $a equiv b md(m)$.]

#beweis[Nach Satz 8 gibt es $c^(-1)$. Multipliziere beide Seiten damit: $a equiv c^(-1) c a equiv c^(-1) c b equiv b md(m)$.]

#satz("Satz 11 (Nullteiler haben kein Inverses)")[Ist $d = ggT(a, m) > 1$ (und $m divides.not a$), dann gilt $a dot m/d equiv 0 md(m)$ mit $m/d equiv.not 0$. Dann kann $a$ kein Inverses haben.]

#beweis[$a dot m/d = a/d dot m$ ist ein Vielfaches von $m$. Gäbe es $x$ mit $x a equiv 1$, dann wäre $m/d equiv x a dot m/d equiv x dot 0 = 0 md(m)$, Widerspruch zu $0 < m/d < m$.]

= Lineare Kongruenzen $a x equiv b md(m)$

#satz("Satz 12 (Lösbarkeit)")[Sei $d = ggT(a, m)$. Die Kongruenz $a x equiv b md(m)$ ist genau dann lösbar, wenn $d divides b$. Dann gibt es genau $d$ Lösungen modulo $m$; sie bilden *eine* Lösung modulo $m/d$.]

#beweis[$a x equiv b md(m)$ heißt: $a x - b = k m$, also $b = a x - k m$.

„$==>$“: $d divides a$ und $d divides m$, also teilt $d$ die Vielfachsumme $a x - k m = b$.

„$<==$“: _Fall $d = 1$:_ Mit dem Inversen: $x equiv a^(-1) dot b md(m)$, eindeutig (Satz 9). _Allgemein:_ Teile alles durch $d$: $m divides (a x - b) <==> m/d divides (a/d dot x - b/d)$, also ist die Kongruenz gleichwertig zu
$ a/d dot x equiv b/d md(m/d). $
Hier ist $ggT(a/d, m/d) = 1$ (aus $d = x_0 a + y_0 m$ folgt $1 = x_0 dot a/d + y_0 dot m/d$, Satz 8 „$==>$“-Argument). Also gibt es genau eine Lösung $x_0$ modulo $m/d$, und das sind modulo $m$ die $d$ Zahlen $x_0, x_0 + m/d, ..., x_0 + (d-1) m/d$.]

#bsp("Drei Fälle")[
- $7 x equiv 3 md(26)$: $ggT = 1$, $7^(-1) = 15$. Beide Seiten $dot 15$: $x equiv 45 equiv bold(19) md(26)$. Probe: $7 dot 19 = 133 = 5 dot 26 + 3$ ✓
- $6 x equiv 4 md(10)$: $ggT(6, 10) = 2 divides 4$ $->$ lösbar, 2 Lösungen. Durch 2 teilen: $3 x equiv 2 md(5)$, $3^(-1) = 2$, $x equiv 4 md(5)$. Modulo 10: $x in {4, 9}$. Probe: $24 equiv 4$, $54 equiv 4$ ✓
- $6 x equiv 5 md(9)$: $ggT(6, 9) = 3 divides.not 5$ $->$ *unlösbar*.]

#merke[*Zusammenhang mit linearen diophantischen Gleichungen:* $a x + b y = c$ ist in ganzen Zahlen lösbar $<==>$ $ggT(a, b) divides c$. Lösung: Bézout liefert $g = x_0 a + y_0 b$, dann mit $c/g$ multiplizieren. Alle Lösungen: $x = x_0 c/g + k dot b/g$, $y = y_0 c/g - k dot a/g$.]

= Schnelles Potenzieren modulo $m$

Große Potenzen nie ausrechnen, sondern in jedem Schritt modulo $m$ reduzieren (Satz 5).

#bsp([$3^45 mod 7$])[
_Methode 1, Periode suchen:_ $3^1 equiv 3, thick 3^2 equiv 2, thick 3^3 equiv 6, thick 3^4 equiv 4, thick 3^5 equiv 5, thick 3^6 equiv 1 md(7)$. Wegen $45 = 7 dot 6 + 3$: $3^45 = (3^6)^7 dot 3^3 equiv 1 dot 6 = bold(6)$.

_Methode 2, Quadrieren und Multiplizieren:_ $45 = 32 + 8 + 4 + 1$. Durch fortgesetztes Quadrieren: $3^1 equiv 3$, $3^2 equiv 2$, $3^4 equiv 4$, $3^8 equiv 16 equiv 2$, $3^16 equiv 4$, $3^32 equiv 2$. Also $3^45 equiv 2 dot 2 dot 4 dot 3 = 48 equiv 6 md(7)$ ✓]

= Anwendung: Affine Chiffre (Kryptologie)

Buchstaben werden als Zahlen kodiert ($A = 0, B = 1, ..., Z = 25$). Verschlüsselt wird mit
$ E(x) = (a x + b) mod 26. $
Zum *Entschlüsseln* löst man $y equiv a x + b$ nach $x$ auf: $x equiv a^(-1) (y - b) md(26)$. Das geht nur, wenn $a$ ein Inverses hat, also $ggT(a, 26) = 1$. Sonst würden zwei Buchstaben gleich verschlüsselt (Satz 11) und man könnte nicht eindeutig entschlüsseln.

#bsp([$a = 7, b = 3$])[Verschlüsseln von H ($x = 7$): $7 dot 7 + 3 = 52 equiv 0$ $->$ *A*. Entschlüsseln mit $7^(-1) = 15$: $D(y) = 15 (y - 3) mod 26$. Für A ($y = 0$): $15 dot (-3) = -45 equiv 7$ $->$ *H* ✓]

= Checkliste für die Ex

#table(columns: (auto, 1fr), align: left, stroke: none, inset: 3pt,
  [☐], [$a mod m$ auch für negative $a$ sicher berechnen (Rest zwischen $0$ und $m - 1$)],
  [☐], [$a equiv b md(m)$ über $m divides (a - b)$ prüfen und begründen],
  [☐], [Mit Rechenregeln vereinfachen: negative Vertreter ($98 equiv -2$), Potenzen mit $equiv 1$ oder $equiv -1$ zerlegen],
  [☐], [Verknüpfungstafeln in $ZZ_m$ aufstellen, Inverse und Nullteiler ablesen],
  [☐], [ggT mit Euklid, Begründung über Satz 6],
  [☐], [Erweiterter Euklid (Rückwärtseinsetzen *oder* Tabelle) *mit Probe*],
  [☐], [Inverses: erst ggT prüfen, Faktor vor $a$ nehmen, negativ $-> +m$, Probe],
  [☐], [Lineare Kongruenz: $ggT divides b$? $->$ mit Inversem multiplizieren bzw. erst durch $d$ teilen],
  [☐], [Beweise: Def. „$m divides (a - b)$“ einsetzen, Satz 1 (Vielfachsumme), Bézout],
  [☐], [Kürzen nur durch zu $m$ teilerfremde Zahlen, im Exponenten nicht reduzieren],
)
