---
name: ex-schulaufgabe
description: Erstellt realistische, anspruchsvolle Stegreifaufgaben (Exen, 15-20 Min) und Schulaufgaben (45-90 Min) für das bayerische Gymnasium (Q12) nach LehrplanPLUS mit Operatoren, BE und Fallmaterial. Erzeugt separate Org-Dateien zur Bearbeitung und korrigiert nach dem offiziellen 15-Punkte-System.
---

# Ex- & Schulaufgaben-Simulator (Bayern Gymnasium Q12)

Erstellt authentische, prüfungsgerechte Stegreifaufgaben (Exen) und Schulaufgaben (Klausuren) auf dem Niveau des bayerischen Gymnasiums (LehrplanPLUS, Leistungsfach/Grundfach Q12), legt sie als separate Org-Datei im Fachordner an und korrigiert sie nach der Bearbeitung streng nach dem bayerischen Oberstufenschlüssel (0–15 Notenpunkte).

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
   - Reine Reproduktion ohne Materialbezug gibt es kaum. Aufgaben fordern stets: *„Analysieren Sie anhand von M1...“*, *„Begründen Sie unter Bezugnahme auf das Fallbeispiel...“*.

2. **Anforderungsbereiche (AFB):**
   - **AFB I (Reproduktion):** ca. 20–30 % der BE (z. B. *Nennen*, *Definieren*, *Zuordnen*).
   - **AFB II (Reorganisation & Transfer):** ca. 45–55 % der BE (z. B. *Erläutern*, *Analysieren*, *Vergleichen*, *Darstellen*).
   - **AFB III (Urteil & Problemlösung):** mind. 25–30 % der BE (z. B. *Beurteilen*, *Erörtern*, *Stellung nehmen*, *Gestaltungsvorschlag entwickeln*).

3. **Präzise BE-Ausweisung:**
   - Jede Teilaufgabe weist transparent ihre BE aus, z. B. `*Aufgabe 2:* [6 BE]`.
   - Die Summe muss exakt der Ziel-BE (z. B. 20 BE für Exen) entsprechen.

4. **Anspruchsniveau („schwere Aufgaben“):**
   - Keine Fangfragen, aber Zielkonflikte, Dilemmata und Vernetzungen (z. B. Wechselwirkung zwischen Prozess- und Aufbauorganisation, Kennzahlen im Kontext strategischer Entscheidungen).
   - Halbwissen führt zu spürbarem Punktabzug: Wer nur Schlagworte nennt, ohne sie mit dem Fall zu verknüpfen oder Wirkungszusammenhänge zu erklären, erhält maximal 50 % der BE.

---

## 3. Dateikonvention & Workflow

### Schritt 1: Prüfungsdatei erstellen
- Datei anlegen unter: `<fach>/<timestamp>-ex-<thema>.org` (z. B. `wr/20261019120000-ex-organisationsstrukturen.org`).
- Denote-konformer Header:
  ```org
  :PROPERTIES:
  :ID:       <UUID>
  :END:
  #+TITLE: Stegreifaufgabe: <Thema>
  #+FILETAGS: :<fach>:ex:q12:
  #+DATE:    <Datum>
  ```
- Übersichtlicher Aufbau:
  - Rahmendaten (Fach, Kursstufe, Zeit, Gesamt-BE, Hilfsmittel).
  - Materialien (`* Material M1: ...*`, `* Material M2: ...*`).
  - Aufgabenstellung mit Operator und BE.
  - Vorgefertigte Schülereingabebereiche (z. B. `*Ihre Lösung:*`).

### Schritt 2: Bearbeitung durch den Schüler
- Der Schüler editiert die Datei selbstständig oder beantwortet die Aufgaben im Chat.
- Keine Lösungshinweise während der Prüfungsphase, es sei denn, der Schüler bricht ab und bittet um Hilfestellung.

### Schritt 3: Strenge Korrektur & Bewertung
- Auswertung nach dem offiziellen bayerischen Oberstufenschlüssel (KMS-Tabelle für Notenpunkte 0–15):

| Prozentbereich | Notenpunkte | Note verbal |
|---|---|---|
| 95 – 100 % | **15** | 1+ |
| 90 – 94 % | **14** | 1 |
| 85 – 89 % | **13** | 1- (Zielniveau) |
| 80 – 84 % | **12** | 2+ |
| 75 – 79 % | **11** | 2 |
| 70 – 74 % | **10** | 2- |
| 65 – 69 % | **09** | 3+ |
| 60 – 64 % | **08** | 3 |
| 55 – 59 % | **07** | 3- |
| 50 – 54 % | **06** | 4+ |
| 45 – 49 % | **05** | 4 |
| 40 – 44 % | **04** | 4- (unterpunktet) |
| 33 – 39 % | **03** | 5+ |
| 27 – 32 % | **02** | 5 |
| 20 – 26 % | **01** | 5- |
| 0 – 19 % | **00** | 6 |

- **Feedback-Format:**
  1. **Punkteübersicht:** Tabelle mit erreichter BE / max. BE pro Aufgabe.
  2. **Notenurteil:** Gesamt-BE, Prozentsatz und Notenpunkte (0–15).
  3. **Konstruktive Fehleranalyse:**
     - Exakt benennen, welcher Fachbegriff oder welcher Kausalzusammenhang gefehlt hat.
     - Musterantwort auf 13-Punkte-Niveau zum direkten Vergleich.
