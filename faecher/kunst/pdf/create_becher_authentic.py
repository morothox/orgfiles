#!/usr/bin/env python3
"""
Authentische Typologie im Stil von Bernd und Hilla Becher
- Präzises Raster mit feinen schwarzen Trennlinien
- Weißer/hellgrauer Hintergrund wie im Original
- Symmetrische, dokumentarische Anordnung
- Dezenter Titel als persönlicher Touch
"""

from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib.units import cm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from PIL import Image
import os

# PDF-Einstellungen - Hochformat wie bei klassischen Becher-Tafeln
pdf_filename = "Becher_Typologie_Authentisch.pdf"
page_size = A4
page_width, page_height = page_size

# Original Becher-Stil: sehr heller, fast weißer Hintergrund
bg_color = (0.98, 0.98, 0.98)

# Raster-Konfiguration: 3 Spalten × 4 Reihen (klassisches Becher-Format)
# Angepasst für 10 Bilder: 2 Spalten × 5 Reihen für bessere Proportionen
cols = 2
rows = 5
total_images = 10

# Großzügige Ränder wie im Original
margin_top = 3 * cm
margin_bottom = 3 * cm
margin_left = 2.5 * cm
margin_right = 2.5 * cm

# Sehr schmale Abstände mit feinen Linien dazwischen
gap_horizontal = 0.15 * cm
gap_vertical = 0.15 * cm
line_width = 0.5  # Feine schwarze Linie

# Verfügbarer Platz
available_width = page_width - margin_left - margin_right
available_height = page_height - margin_top - margin_bottom - 1.5*cm  # Platz für Titel

# Bildgröße berechnen
img_width = (available_width - (cols - 1) * gap_horizontal) / cols
img_height = (available_height - (rows - 1) * gap_vertical) / rows

# JPG-Dateien sammeln
jpg_files = sorted([f for f in os.listdir('.') if f.endswith('.jpg')])[:total_images]

print(f"Erstelle authentische Becher-Typologie...")
print(f"Format: {cols}×{rows} Raster")
print(f"Bildgröße: {img_width/cm:.2f}cm × {img_height/cm:.2f}cm")

# PDF erstellen
c = canvas.Canvas(pdf_filename, pagesize=page_size)

# Hintergrund
c.setFillColorRGB(*bg_color)
c.rect(0, 0, page_width, page_height, fill=1, stroke=0)

# Bilder im Raster platzieren
for idx, img_file in enumerate(jpg_files):
    if idx >= total_images:
        break

    col = idx % cols
    row = idx // cols

    # Position berechnen
    x = margin_left + col * (img_width + gap_horizontal)
    y = page_height - margin_top - (row + 1) * img_height - row * gap_vertical

    # Bild laden und einpassen
    img = Image.open(img_file)
    img_aspect = img.width / img.height
    cell_aspect = img_width / img_height

    if img_aspect > cell_aspect:
        draw_width = img_width
        draw_height = img_width / img_aspect
        draw_x = x
        draw_y = y + (img_height - draw_height) / 2
    else:
        draw_height = img_height
        draw_width = img_height * img_aspect
        draw_x = x + (img_width - draw_width) / 2
        draw_y = y

    # Bild zeichnen
    c.drawImage(img_file, draw_x, draw_y, width=draw_width, height=draw_height,
                preserveAspectRatio=True)
    
    # Rahmen um jedes Bild (feine schwarze Linie)
    c.setStrokeColorRGB(0.2, 0.2, 0.2)
    c.setLineWidth(line_width)
    c.rect(x, y, img_width, img_height, fill=0, stroke=1)

    print(f"  {img_file} → Zelle ({col+1}, {row+1})")

# Trennlinien zwischen den Spalten (vertikal)
c.setStrokeColorRGB(0.15, 0.15, 0.15)
c.setLineWidth(line_width)
for i in range(1, cols):
    line_x = margin_left + i * img_width + (i - 0.5) * gap_horizontal
    line_y_start = page_height - margin_top
    line_y_end = page_height - margin_top - rows * img_height - (rows - 1) * gap_vertical
    c.line(line_x, line_y_start, line_x, line_y_end)

# Trennlinien zwischen den Reihen (horizontal)
for i in range(1, rows):
    line_y = page_height - margin_top - i * img_height - (i - 0.5) * gap_vertical
    line_x_start = margin_left
    line_x_end = margin_left + cols * img_width + (cols - 1) * gap_horizontal
    c.line(line_x_start, line_y, line_x_end, line_y)

# Äußerer Rahmen um das gesamte Raster
c.setStrokeColorRGB(0.1, 0.1, 0.1)
c.setLineWidth(1.0)
total_width = cols * img_width + (cols - 1) * gap_horizontal
total_height = rows * img_height + (rows - 1) * gap_vertical
c.rect(margin_left, page_height - margin_top - total_height, 
       total_width, total_height, fill=0, stroke=1)

# Dezenter Titel unten (kleiner Touch)
c.setFillColorRGB(0.3, 0.3, 0.3)
c.setFont("Helvetica", 9)
title_text = "Typologie • 2026"
text_width = c.stringWidth(title_text, "Helvetica", 9)
c.drawString((page_width - text_width) / 2, margin_bottom - 1*cm, title_text)

# Metadaten setzen
c.setTitle("Typologie im Stil von Bernd und Hilla Becher")
c.setAuthor("morothox")
c.setSubject("Fotografische Typologie")

c.save()
print(f"\n✓ Authentische Becher-Typologie erstellt: {pdf_filename}")
print(f"  Mit feinen Trennlinien und dezenter Beschriftung")
