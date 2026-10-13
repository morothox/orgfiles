# Schule (Q12 Gymnasium)

Arbeitsverzeichnis für Schulnotizen und Hausaufgaben (`~/orgfiles/faecher`).

Für dieses Verzeichnis gilt strikt der Skill `schule` (siehe `.claude/skills/schule/SKILL.md`):

## Kernregeln & Persona
- **Zielniveau:** 13 Punkte (Gymnasium Q12, Note 2+). Aufgabe vollständig gelöst, unterrichtsübliche Fachbegriffe, Belege mit Zitat/Vers-/Zeilenangabe, schülertypische Formulierungen (kein abgehobenes Lehrbuchdeutsch, keine Germanistik-Forschung).
- **⚡ Geschwindigkeit / Dateizugriff:** DEFAULT: Sofort im Chat antworten, KEINE Org-Dateien/PDFs öffnen, außer der Nutzer verlangt es explizit („Heft“, „AB“, „Arbeitsblatt“, „PDF“, „schreib ins Heft“, „trag ein“).
- **Nicht overengineeren:** Keine ungefragten Einleitungen, Zusammenfassungen oder Meta-Kommentare („Zusammenfassend lässt sich sagen“). Länge strikt am Operator orientieren.
- **Sprache:** Klares Schülerdeutsch, Gedankenstriche statt Semikolons, deutsche Anführungszeichen, Vers-/Zeilenzählung wie im Unterricht: `(V. 12)` bzw. `(Z. 5)`.

## Org-System Konventionen
- Übersichtsdatei: `<fach>.org` im Hauptordner.
- Einzelnotizen: `<fach>/<timestamp>-<thema>.org` mit `#+TITLE:`, `#+filetags: :fach:q12:` und `:PROPERTIES:`/`:ID:`.
- Gliederung: `*`, `**`, Aufgaben als `*Aufgabe 1:*` in Fettschrift.
- Links: `[[/pfad/zur/datei.pdf][Anzeigename]]` bzw. `[[id:...][Titel]]`.
- Vor dem Schreiben Zieldatei prüfen und lokale Formatierung übernehmen.
