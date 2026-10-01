# 🎓 Schul-Notizsystem: Best Practices für PDFs, Fächer-Index & Wissensnetz

Dieses Dokument erklärt das optimale Zusammenspiel von **Neovim**, **Orgmode**, **Org-Roam** und **PDF-Arbeitsblättern** für die gymnasiale Oberstufe (Q12).

---

## 1. Architektur: Index-Dateien vs. Konzept-Dateien (Zettelkasten)

### Das Grundproblem
Wenn alles in einer einzigen Datei (z. B. `mathe.org`) landet, wird die Datei nach wenigen Wochen unübersichtlich, unhandlich beim Suchen und schwer modular zu verknüpfen (z. B. wenn Vektorrechnung aus Mathe auch in Physik gebraucht wird). Wenn andererseits jedes Mini-Detail in einer separaten Datei landet, verliert man den Überblick über den Lehrplan.

### Die Best-Practice-Lösung: Das Hybrid-Modell (MOC - Map of Content)

1. **Fächer-Dateien (`faecher/<fach>.org`) bleiben MOCs (Übersichts-/Index-Dateien):**
   - Enthalten Lehrkraft, Raum, allgemeine Links (Klausurübersicht, Noten).
   - Enthalten das strukturierte **Inhaltsverzeichnis des Lehrplans** (Curriculum).
   - Verlinken auf die detaillierten Konzept-Zettel und Skripte.
   - Halten kurze Checklisten (z. B. Kurvendiskussion Checkliste).

2. **Eigene Konzept-Dateien erstellen, wenn:**
   - Ein Thema mehr als 1-2 Bildschirmseiten umfasst (z. B. `integralrechnung.org` oder Zettel via Org-Roam).
   - Es sich um ein in sich geschlossenes Konzept handelt, das fächerübergreifend relevant ist (z. B. `vektorfelder.org` oder `differentialgleichungen.org` zwischen Mathe & Physik).
   - Eigene Zusammenfassungen für Klausuren (Lernzettel) geschrieben werden.

3. **In der Fächer-Datei verlinken:**
   ```org
   * 📖 Analysis
   ** 📈 [[file:mathe_integralrechnung.org][Integralrechnung (Vertiefung)]]
   - Kurzzusammenfassung: $\int_a^b f(x) \, dx = F(b) - F(a)$
   - Übungsaufgaben & PDF-Verweise siehe Einzeldatei.
   ```
   *Tipp mit Neovim Org-Roam:* Mit `<leader>ni` (Insert Node) oder `<leader>nc` (Capture Roam Node) direkt vernetzte Notizen anlegen.

---

## 2. Der beste Workflow für PDFs & Arbeitsblätter

PDFs sind in der Schule oft Übungsblätter, Skripte oder Klausurangaben. Oft muss man:
1. Das Original-PDF griffbereit haben.
2. Anmerkungen/Lösungen dazu schreiben (Reinschreiben oder Notizen anheften).
3. Das PDF präzise aus der Org-Datei heraus anspringen.

### Ordnerstruktur für PDFs
Organisiere den Ordner `~/orgfiles/pdf/` nach Fächern:
```text
~/orgfiles/pdf/
├── mathe/
│   ├── ab_integralrechnung_01.pdf
│   └── skript_analytische_geometrie.pdf
├── wr/
│   └── fallstudie_vertragsrecht.pdf
└── physik/
    └── versuch_photoeffekt.pdf
```

### A. Wie du PDFs in Orgmode verlinkst
Orgmode unterstützt native Dateilinks. In Neovim öffnest du sie per Enter (oder `<leader>oo` / `gx`):

1. **Standard-Link auf die Datei:**
   ```org
   - [[file:../pdf/mathe/ab_integralrechnung_01.pdf][📄 Arbeitsblatt 01: Stammfunktionen]]
   ```

2. **Link auf eine bestimmte Seite im PDF:**
   (Unterstützt von vielen PDF-Betrachtern wie Skim, Sioyek, Acrobat oder Evince):
   ```org
   - [[file:../pdf/mathe/skript.pdf::3][📄 Skript Seite 3: Hauptsatz]]
   ```

### B. Wie du in PDFs reinschreibst und annotierst (macOS Best Practices)

Da reine Texteditoren PDFs nicht direkt binär bemalen können, gibt es 3 hervorragende Workflows:

#### Option 1: Schnelle Bordmittel (macOS Vorschau / Apple Pencil auf iPad)
- **Workflow:** Klicke in Neovim auf den Link (öffnet das PDF in **Vorschau / Preview**).
- Drücke in Vorschau `Cmd + Shift + A` (Werkzeugleiste einblenden): Textfelder ausfüllen, handschriftlich mit Trackpad/iPad unterschreiben, gelb markieren, Notizen anheften.
- `Cmd + S` speichert direkt in der PDF-Datei in `~/orgfiles/pdf/<fach>/`.
- In deiner `.org`-Datei notierst du deine Ausarbeitungen und hast per Link sofort das annotierte PDF parat.

#### Option 2: Power-User PDF-Viewer mit Neovim-Fokus (**Sioyek** oder **Skim**)
- **Empfehlung für macOS:** `brew install --cask skim` oder `brew install --cask sioyek`.
- **Vorteil Sioyek / Skim:** 
  - Speziell für Studenten, Schüler und Forscher gebaut.
  - Extrem schnelles Springen zu Seiten, Suchbegriffen und Notizen.
  - Ermöglicht das Herausziehen von Zitaten/Highlights direkt in Textform.

#### Option 3: "Org-Notizen mit PDF-Begleitung" (Split-Screen)
Die effektivste Methode für die Oberstufe:
- **Linke Bildschirmhälfte:** Neovim mit der Konzeptdatei (z. B. `mathe_integralrechnung.org`).
- **Rechte Bildschirmhälfte:** PDF-Arbeitsblatt.
- In Orgmode notierst du deine Lösungen und Gedanken:
  ```org
  * 📄 Lösung zu [[file:../pdf/mathe/ab_integralrechnung_01.pdf][AB 01: Integralrechnung]]
  ** Aufgabe 1a
  - Ansatz: $f(x) = 3x^2 \implies F(x) = x^3 + C$
  - Skizze siehe PDF Seite 2.
  ```

---

## 3. Empfohlene Tastenbelegungen in deiner Neovim-Konfiguration

In deiner Neovim-Umgebung sind bereits folgende Helfer eingerichtet:

| Tastenkombination | Funktion |
| :--- | :--- |
| `<leader>oo` oder `Enter` auf Link | Öffnet verlinkte Datei / PDF im System-Viewer |
| `<leader>oli` | Orgmode: Link interaktiv einfügen (via Telescope/Snacks) |
| `<leader>nf` | Zettelkasten / Roam: Thema / Node suchen |
| `<leader>ni` | Zettelkasten / Roam: Node-Link einfügen & Notiz erstellen |
| `<leader>nc` | Zettelkasten / Roam: Neues Thema erfassen |
| `<leader>nl` | Zettelkasten: Backlinks Panel toggeln |
| `<leader>z` | Snacks: Benachrichtigungsverlauf (Notifications) |
| `<leader>oc` | Org Capture: Hausaufgabe, Klausur oder Notiz erfassen |
| `<leader>um` | Formeln schön rendern (`nabla.nvim`) |

---

## 4. Aus einem Titel / Wort einen Link machen & sofort Notiz erstellen

In deinem Neovim-Setup gibt es dafür zwei perfekte Wege:

### Weg A: Der Zettelkasten-Weg mit Org-Roam (Empfohlen für Konzepte)
In deiner Konfiguration ist `org-roam.nvim` auf dem Prefix **`<leader>n`** eingerichtet. Die Zettel werden **automatisch in den jeweiligen Fach-Ordner** (`faecher/<fach>/`) einsortiert und mit den passenden Tags versehen:

1. **Titel eingeben oder Cursor an die gewünschte Stelle setzen.**
2. Drücke **`<leader>ni`** (`Insert Node`).
3. Tippe den gewünschten Titel ein (z. B. *Stammfunktionen*) und drücke **`<Enter>`**.
4. Wähle mit einem Tastendruck das Fach aus:
   - **`m`** = Mathe (`faecher/mathe/`, Tag `:mathe:q12:`)
   - **`w`** = WR (`faecher/wr/`, Tag `:wr:lk:q12:`)
   - **`p`** = Physik (`faecher/physik/`, Tag `:physik:q12:`)
   - **`c`** = Chemie (`faecher/chemie/`)
   - **`d`** = Deutsch (`faecher/deutsch/`)
   - **`e`** = Englisch (`faecher/englisch/`)
   - **`g`** = Geschichte (`faecher/geschichte/`)
   - **`u`** = PuG (`faecher/pug/`)
   - **`r`** = Religion (`faecher/religion/`)
   - **`k`** = Kunst (`faecher/kunst/`)
   - **`v`** = vkM (`faecher/vkm/`)
   - **`s`** = Sport (`faecher/sport/`)
   - **`z`** = Allgemein (`faecher/allgemein/`)
5. Es wird an deiner aktuellen Cursorstelle sofort der fertige Link eingefügt (z. B. `[[id:...][Stammfunktionen]]`), und die neue Datei liegt sauber in `faecher/mathe/`.
6. Drücke auf dem Link einfach **`Enter`** (oder `<leader>oo`), um sofort in die neue Datei zu springen und loszuschreiben!

---

### Weg B: Manueller / Relativer Datei-Link (Klassischer Org-Weg)
Wenn du eine konkrete Datei im gleichen Ordner (z. B. `faecher/mathe_integralrechnung.org`) haben willst:

1. Schreib den Link im Text oder in der Überschrift:
   ```org
   ** [[file:mathe_integralrechnung.org][Integralrechnung]]
   ```
2. Gehe mit dem Cursor auf den Link und drücke **`Enter`**:
   - Neovim / Orgmode öffnet die Datei `mathe_integralrechnung.org` automatisch.
   - Existiert sie noch nicht, wird ein neuer Puffer geöffnet – sobald du mit `:w` speicherst, ist die Notiz angelegt.

---

## 5. Zusammenfassung & Daumenregel für deinen Schulalltag

1. **Dashboard (`index.org`)**: Dein Einstieg für Stundenplan und Schnellnavigation.
2. **Fach-Dateien (`faecher/*.org`)**: Strukturierte Übersichten (MOCs) der Themengebiete und Linksammlung.
3. **Konzept-Dateien**: Bei großen Themen oder intensiver Klausurvorbereitung mit `<leader>ni` verlinken und vertiefen.
4. **PDFs**: In `~/orgfiles/pdf/<fach>/` ablegen, in den Org-Dateien relativ verlinken (`[[file:../pdf/...]]`), und in macOS Vorschau oder Skim/Sioyek direkt annotieren.

