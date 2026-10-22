---
name: ex-schulaufgabe
description: Erstellt realistische, anspruchsvolle Stegreifaufgaben (Exen, 15-20 Min) und Schulaufgaben (45-90 Min) für das bayerische Gymnasium (Q12) nach LehrplanPLUS mit Operatoren, BE und Fallmaterial. Erzeugt separate Org-Dateien mit Schreibplatz und exportiert sie direkt als PDF via Pandoc + Typst zur Bearbeitung. Korrigiert nach dem offiziellen 15-Punkte-System.
---

# Ex- & Schulaufgaben-Simulator (Bayern Gymnasium Q12)

Erstellt authentische, prüfungsgerechte Stegreifaufgaben (Exen) und Schulaufgaben (Klausuren) auf dem Niveau des bayerischen Gymnasiums (LehrplanPLUS, Leistungsfach/Grundfach Q12), legt sie als separate Org-Datei im Fachordner an, versieht jede Aufgabe mit ausreichendem Schreibplatz (Schreiblinien oder Freiraum) und exportiert sie direkt per Pandoc + Typst als druckfertiges PDF zum Reinschreiben.

## 1. Prüfungsformate & Rahmenbedingungen

### A) Stegreifaufgabe (Ex)
- **Zeit:** 15–20 Minuten
- **Umfang:** Exakt **20 Bewertungseinheiten (BE)**
- **Stoffabgrenzung:** Letzte 2–3 Unterrichtsstunden (inkl. Transfer zu unmittelbar davorliegendem Grundwissen)
- **Aufgabenanzahl:** 3–4 Teilaufgaben, gestaffelt von einfacherer Erfassung bis zu komplexem Transfer/Urteil

### B) Schulaufgabe / Klausur (SA)
- **Zeit:** 45–90 Minuten (je nach Absprache)
- **Umfang:** In der Regel **40–60 BE**
- **Stoffabgrenzung:** Ganzer Lehrplan-Baustein / Semesterabschnitt
- **Aufgabenanzahl:** 2–3 große, mehrteilige Aufgabenkomplexe

---

## 2. Didaktischer Standard (Bayerischer LehrplanPLUS Q12)

1. **Materialgebundenheit (M1, M2 ...):**
   - Nahezu jede bayerische Oberstufenaufgabe basiert auf einem konkreten Fall/Szenario: Firmenporträt, praxisnahe Problemstellung, Zahlenmaterial, Organigramm, Prozesskette oder Expertenzitat.
   - Aufgaben fordern stets den konkreten Bezug: *„Analysieren Sie anhand von M1...“*, *„Begründen Sie unter Bezugnahme auf das Fallbeispiel...“*.

2. **Anforderungsbereiche (AFB):**
   - **AFB I (Reproduktion):** ca. 20–30 % der BE (z. B. *Nennen*, *Definieren*, *Zuordnen*).
   - **AFB II (Reorganisation & Transfer):** ca. 45–55 % der BE (z. B. *Erläutern*, *Analysieren*, *Vergleichen*, *Darstellen*).
   - **AFB III (Urteil & Problemlösung):** mind. 25–30 % der BE (z. B. *Beurteilen*, *Erörtern*, *Stellung nehmen*).

3. **Präzise BE-Ausweisung:**
   - Jede Teilaufgabe weist transparent ihre BE aus, z. B. `*Aufgabe 2:* [6 BE]`. Summe entspricht exakt 20 BE (Ex) bzw. Ziel-BE.

---

## 3. Dateikonvention & PDF-Export

### Schritt 1: Org-Datei mit Schreibplatz anlegen
- Datei anlegen unter: `<fach>/<timestamp>-ex-<thema>.org`
- Denote-Header mit `:ID:`, `#+TITLE:`, `#+FILETAGS: :<fach>:ex:q12:` und `#+DATE:`.
- **Wichtig: Schreibplatz für jede Aufgabe einbauen.** Unter jeder Teilaufgabe ausreichend Platz für handschriftliche / digitale Lösungen lassen (z. B. mit Typst-Schreiblinien):
  ```org
  *Ihre Lösung zu 1a:*
  #+begin_export typst
  #v(0.3cm)
  #stack(spacing: 0.8cm, ..range(6).map(_ => line(length: 100%, stroke: 0.35pt + luma(190))))
  #v(0.4cm)
  #+end_export
  ```

### Schritt 2: Direkt als PDF kompilieren
- Unmittelbar nach Erstellung der Org-Datei per Pandoc + Typst das PDF erzeugen:
  ```bash
  pandoc <pfad/zur/datei>.org -o <pfad/zur/datei>.pdf \
    --pdf-engine=typst \
    --template=/Users/morothox/.config/nvim/pandoc/schule.typ \
    -V fach=<fach> \
    -V exportdate="$(date +%d.%m.%Y)"
  ```
- Beide Dateien (`.org` und `.pdf`) liegen nebeneinander im Fachordner, damit der Schüler das PDF direkt öffnen und bearbeiten kann.

---

## 4. Korrektur & Bewertung nach Abgabe

- Auswertung nach dem offiziellen bayerischen Oberstufenschlüssel (0–15 Notenpunkte):
  - 85–89 % = 13 Notenpunkte (Zielniveau)
  - 50–54 % = 6 Notenpunkte (ausreichend)
  - < 20 % = 0 Notenpunkte (ungenügend)
- Feedback mit transparenter BE-Tabelle, Punktabzügen und konkreten Verbesserungsvorschlägen auf 13-Punkte-Niveau.
