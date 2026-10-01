#!/usr/bin/env python3
"""
Erstellt eine Typologie im Stil von Bernd und Hilla Becher
- Symmetrisches Raster-Layout (2x5 für 10 Bilder)
- Einheitliche Bildgrößen
- Neutraler grauer Hintergrund
- Klare, objektive Präsentation
"""

from reportlab.lib.pagesizes import A4, landscape
from reportlab.pdfgen import canvas
from reportlab.lib.units import cm
from PIL import Image
import os

# PDF-Einstellungen
pdf_filename = "Becher_Typologie.pdf"
page_size = landscape(A4)  # Querformat für bessere Raster-Darstellung
page_width, page_height = page_size

# Becher-Stil: neutraler, leicht grauer Hintergrund
bg_color = (0.95, 0.95, 0.95)

# Raster-Konfiguration für 10 Bilder: 2 Reihen × 5 Spalten
cols = 5
rows = 2
total_images = 10

# Ränder und Abstände (im Becher-Stil: großzügig und symmetrisch)
margin_top = 2.5 * cm
margin_bottom = 2.5 * cm
margin_left = 2 * cm
margin_right = 2 * cm
gap_horizontal = 0.8 * cm  # Abstand zwischen Bildern horizontal
gap_vertical = 0.8 * cm    # Abstand zwischen Bildern vertikal

# Verfügbarer Platz für Bilder
available_width = page_width - margin_left - margin_right - (cols - 1) * gap_horizontal
available_height = page_height - margin_top - margin_bottom - (rows - 1) * gap_vertical

# Bildgröße berechnen
img_width = available_width / cols
img_height = available_height / rows

# Alle JPG-Dateien sammeln und sortieren
jpg_files = sorted([f for f in os.listdir('.') if f.endswith('.jpg')])[:total_images]

print(f"Erstelle Becher-Typologie mit {len(jpg_files)} Bildern...")
print(f"Seitengröße: {page_width/cm:.1f}cm × {page_height/cm:.1f}cm")
print(f"Bildgröße im Raster: {img_width/cm:.1f}cm × {img_height/cm:.1f}cm")

# PDF erstellen
c = canvas.Canvas(pdf_filename, pagesize=page_size)

# Hintergrund (Becher-Stil: neutrales Grau)
c.setFillColorRGB(*bg_color)
c.rect(0, 0, page_width, page_height, fill=1, stroke=0)

# Bilder im Raster platzieren
for idx, img_file in enumerate(jpg_files):
    if idx >= total_images:
        break

    # Position im Raster berechnen
    col = idx % cols
    row = idx // cols

    # X- und Y-Position (von links oben)
    x = margin_left + col * (img_width + gap_horizontal)
    y = page_height - margin_top - (row + 1) * img_height - row * gap_vertical

    # Bild öffnen und Aspektverhältnis prüfen
    img = Image.open(img_file)
    img_aspect = img.width / img.height
    cell_aspect = img_width / img_height

    # Bild skalieren (aspect-ratio erhalten, in Zelle einpassen)
    if img_aspect > cell_aspect:
        # Bild ist breiter als Zelle -> an Breite anpassen
        draw_width = img_width
        draw_height = img_width / img_aspect
        draw_x = x
        draw_y = y + (img_height - draw_height) / 2
    else:
        # Bild ist höher als Zelle -> an Höhe anpassen
        draw_height = img_height
        draw_width = img_height * img_aspect
        draw_x = x + (img_width - draw_width) / 2
        draw_y = y

    # Bild einfügen
    c.drawImage(img_file, draw_x, draw_y, width=draw_width, height=draw_height,
                preserveAspectRatio=True)

    print(f"  [{idx+1}/{len(jpg_files)}] {img_file} → Position ({col}, {row})")

# PDF speichern
c.save()
print(f"\n✓ PDF erstellt: {pdf_filename}")
print(f"  15 Punkte Typologie im Becher-Stil!")
