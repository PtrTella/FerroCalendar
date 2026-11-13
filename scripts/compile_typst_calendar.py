#!/usr/bin/env python3
import re
import json
import os
import datetime
import subprocess

# Days of week in Italian (0 = Sunday)
DAYS_OF_WEEK = ['domenica', 'lunedì', 'martedì', 'mercoledì', 'giovedì', 'venerdì', 'sabato']

def get_day_of_week(day, month, year=2027):
    d = datetime.date(year, month, day)
    return DAYS_OF_WEEK[d.isoweekday() % 7]

def escape_typst_str(s):
    if not s:
        return ""
    return s.replace('\\', '\\\\').replace('"', '\\"')

def load_calendar_data():
    with open('src/data/calendarData.ts', 'r', encoding='utf-8') as f:
        content = f.read()
    match = re.search(r'export const CALENDAR_DATA: CalendarDay\[\] = (\[[\s\S]*?\]);\n\nexport const MONTH_NAMES', content)
    if not match:
        raise ValueError("Could not extract CALENDAR_DATA from src/data/calendarData.ts")
    return json.loads(match.group(1))

def generate_eco_typ(days, output_path):
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('''// FerroCalendar 2027 - Formato Eco (4 giorni per foglio A4)
#set page(paper: "a4", margin: 0mm)

#let render_leaf(
  day_num: "",
  day_of_week: "",
  month_name: "",
  saint: "",
  is_ferie: false,
  is_birthday: false,
  birthday_person: "",
  quote_lines: (),
  closing: "",
  day_of_year: ""
) = {
  box(width: 86mm, height: 125mm)[
    #place(top + left, image("calendar_border.svg", width: 86mm, height: 125mm))
    #set align(center)
    #pad(top: 10mm, bottom: 8.5mm, left: 6.5mm, right: 6.5mm)[
      #stack(
        spacing: 1fr,
        [
          #text(font: "Georgia", size: 11.5pt, weight: "bold")[#day_of_week]
          #v(-1.5mm)
          #text(font: "Didot", size: 45pt, weight: "black")[#day_num]
          #v(-3.5mm)
          #text(font: "Georgia", size: 11.5pt, weight: "bold")[#month_name]
          #v(0.4mm)
          #if saint != "" [
            #text(font: "Georgia", size: 7.2pt, style: "italic", fill: rgb("#555555"))[#saint]
          ]
          #if is_ferie [
            #v(0.8mm)
            #box(stroke: (paint: rgb("#dc2626"), dash: "dashed", thickness: 0.5pt), fill: rgb("#fef2f2"), radius: 2pt, inset: (x: 4pt, y: 1.5pt))[
              #text(font: "Georgia", size: 5.5pt, weight: "bold", fill: rgb("#991b1b"))[CHIUSO PER FERIE]
            ]
          ] else if is_birthday and birthday_person != "" [
            #v(0.8mm)
            #let bday_title = if birthday_person == "a me" { "★ IL MIO COMPLEANNO ★" } else { "★ COMPLEANNO " + upper(birthday_person) + " ★" }
            #box(stroke: 0.5pt + rgb("#b45309"), fill: rgb("#fef3c7"), radius: 100pt, inset: (x: 4pt, y: 1.5pt))[
              #text(font: "Georgia", size: 5.5pt, weight: "bold", fill: rgb("#92400e"))[#bday_title]
            ]
          ]
        ],
        [
          #let q_size = if quote_lines.len() >= 4 { 7.8pt } else if quote_lines.len() == 3 { 8.4pt } else { 9.1pt }
          #set text(font: "Georgia", size: q_size, style: "italic", weight: "bold", fill: rgb("#1a1a1a"))
          #for l in quote_lines [
            #l #linebreak()
          ]
          #if closing != "" [
            #v(1.2mm)
            #line(length: 35%, stroke: 0.3pt + rgb("#cccccc"))
            #v(0.4mm)
            #text(size: 7.2pt, style: "italic", weight: "regular", fill: rgb("#444444"))[#closing]
          ]
        ],
        [
          #text(font: "Georgia", size: 5.5pt, fill: rgb("#555555"))[
            www.andalogianni.com #text(fill: rgb("#aaaaaa"))[•] Andalò Gianni - Imola #text(fill: rgb("#aaaaaa"))[•] #day_of_year/365
          ]
        ]
      )
    ]
  ]
}

''')
        # Group into chunks of 4
        chunks = [days[i:i+4] for i in range(0, len(days), 4)]
        for chunk_idx, chunk in enumerate(chunks):
            f.write(f"// Page {chunk_idx + 1}\n")
            f.write('#grid(\n  columns: (105mm, 105mm),\n  rows: (148.5mm, 148.5mm),\n')
            for i in range(4):
                if i < len(chunk):
                    d = chunk[i]
                    dow = get_day_of_week(d['day'], d['monthNumber'])
                    q_lines = [l.strip() for l in d['quote'].split('\n') if l.strip()]
                    q_lines_typ = "(" + ", ".join([f'"{escape_typst_str(l)}"' for l in q_lines]) + ("," if len(q_lines) == 1 else "") + ")"
                    saint_esc = escape_typst_str(d.get('saint', ''))
                    closing_esc = escape_typst_str(d.get('closing', '') or '')
                    bday_esc = escape_typst_str(d.get('birthdayPerson', '') or '')
                    is_ferie = "true" if d.get('isFerie') else "false"
                    is_bday = "true" if d.get('isBirthday') else "false"

                    f.write(f'  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(\n')
                    f.write(f'    day_num: "{d["day"]}",\n')
                    f.write(f'    day_of_week: "{dow}",\n')
                    f.write(f'    month_name: "{d["month"]}",\n')
                    f.write(f'    saint: "{saint_esc}",\n')
                    f.write(f'    is_ferie: {is_ferie},\n')
                    f.write(f'    is_birthday: {is_bday},\n')
                    f.write(f'    birthday_person: "{bday_esc}",\n')
                    f.write(f'    quote_lines: {q_lines_typ},\n')
                    f.write(f'    closing: "{closing_esc}",\n')
                    f.write(f'    day_of_year: "{d["dayOfYear"]}"\n')
                    f.write(f'  )]],\n')
                else:
                    f.write('  box(width: 105mm, height: 148.5mm)[],\n')
            f.write(')\n')
            # Cutting guide lines on every sheet
            f.write('#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))\n')
            f.write('#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))\n')
            f.write('#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]\n')
            if chunk_idx < len(chunks) - 1:
                f.write('#pagebreak()\n\n')

def generate_single_typ(days, output_path):
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('''// FerroCalendar 2027 - Formato Singolo (1 giorno per pagina A4)
#set page(paper: "a4", margin: 0mm)

#let render_leaf_single(
  day_num: "",
  day_of_week: "",
  month_name: "",
  saint: "",
  is_ferie: false,
  is_birthday: false,
  birthday_person: "",
  quote_lines: (),
  closing: "",
  day_of_year: ""
) = {
  place(center + horizon)[
    #box(width: 172mm, height: 250mm)[
      #place(top + left, image("calendar_border.svg", width: 172mm, height: 250mm))
      #set align(center)
      #pad(top: 20mm, bottom: 17mm, left: 16mm, right: 16mm)[
        #stack(
          spacing: 1fr,
          [
            #text(font: "Georgia", size: 22pt, weight: "bold")[#day_of_week]
            #v(-3mm)
            #text(font: "Didot", size: 90pt, weight: "black")[#day_num]
            #v(-6mm)
            #text(font: "Georgia", size: 22pt, weight: "bold")[#month_name]
            #v(1mm)
            #if saint != "" [
              #text(font: "Georgia", size: 13pt, style: "italic", fill: rgb("#555555"))[#saint]
            ]
            #if is_ferie [
              #v(2mm)
              #box(stroke: (paint: rgb("#dc2626"), dash: "dashed", thickness: 1pt), fill: rgb("#fef2f2"), radius: 3pt, inset: (x: 8pt, y: 3pt))[
                #text(font: "Georgia", size: 11pt, weight: "bold", fill: rgb("#991b1b"))[CHIUSO PER FERIE]
              ]
            ] else if is_birthday and birthday_person != "" [
              #v(2mm)
              #let bday_title = if birthday_person == "a me" { "★ IL MIO COMPLEANNO ★" } else { "★ COMPLEANNO " + upper(birthday_person) + " ★" }
              #box(stroke: 1pt + rgb("#b45309"), fill: rgb("#fef3c7"), radius: 100pt, inset: (x: 8pt, y: 3pt))[
                #text(font: "Georgia", size: 10pt, weight: "bold", fill: rgb("#92400e"))[#bday_title]
              ]
            ]
          ],
          [
            #let q_size = if quote_lines.len() >= 4 { 15pt } else if quote_lines.len() == 3 { 16.5pt } else { 18pt }
            #set text(font: "Georgia", size: q_size, style: "italic", weight: "bold", fill: rgb("#1a1a1a"))
            #for l in quote_lines [
              #l #linebreak()
            ]
            #if closing != "" [
              #v(2.5mm)
              #line(length: 35%, stroke: 0.5pt + rgb("#cccccc"))
              #v(1mm)
              #text(size: 13pt, style: "italic", weight: "regular", fill: rgb("#444444"))[#closing]
            ]
          ],
          [
            #text(font: "Georgia", size: 10pt, fill: rgb("#555555"))[
              www.andalogianni.com #text(fill: rgb("#aaaaaa"))[•] Andalò Gianni - Imola #text(fill: rgb("#aaaaaa"))[•] #day_of_year/365
            ]
          ]
        )
      ]
    ]
  ]
}

''')
        for idx, d in enumerate(days):
            dow = get_day_of_week(d['day'], d['monthNumber'])
            q_lines = [l.strip() for l in d['quote'].split('\n') if l.strip()]
            q_lines_typ = "(" + ", ".join([f'"{escape_typst_str(l)}"' for l in q_lines]) + ("," if len(q_lines) == 1 else "") + ")"
            saint_esc = escape_typst_str(d.get('saint', ''))
            closing_esc = escape_typst_str(d.get('closing', '') or '')
            bday_esc = escape_typst_str(d.get('birthdayPerson', '') or '')
            is_ferie = "true" if d.get('isFerie') else "false"
            is_bday = "true" if d.get('isBirthday') else "false"

            f.write(f'// Day {d["dayOfYear"]}\n')
            f.write(f'#render_leaf_single(\n')
            f.write(f'  day_num: "{d["day"]}",\n')
            f.write(f'  day_of_week: "{dow}",\n')
            f.write(f'  month_name: "{d["month"]}",\n')
            f.write(f'  saint: "{saint_esc}",\n')
            f.write(f'  is_ferie: {is_ferie},\n')
            f.write(f'  is_birthday: {is_bday},\n')
            f.write(f'  birthday_person: "{bday_esc}",\n')
            f.write(f'  quote_lines: {q_lines_typ},\n')
            f.write(f'  closing: "{closing_esc}",\n')
            f.write(f'  day_of_year: "{d["dayOfYear"]}"\n')
            f.write(')\n')
            if idx < len(days) - 1:
                f.write('#pagebreak()\n\n')

if __name__ == '__main__':
    days = load_calendar_data()
    print(f"Loaded {len(days)} calendar days.")
    
    os.makedirs('typst_source', exist_ok=True)
    eco_typ = 'typst_source/ferrocalendar_eco_4up.typ'
    single_typ = 'typst_source/ferrocalendar_single.typ'
    
    # Copy border SVG next to typst sources so image() finds it
    with open('public/calendar_border.svg', 'r') as src, open('typst_source/calendar_border.svg', 'w') as dst:
        dst.write(src.read())

    print("Generating Eco 4-up Typst source...")
    generate_eco_typ(days, eco_typ)
    print("Generating Single page Typst source...")
    generate_single_typ(days, single_typ)
    
    # Compile with Typst
    os.makedirs('public', exist_ok=True)
    eco_pdf = 'public/FerroCalendar_2027_Eco_4_per_foglio.pdf'
    single_pdf = 'public/FerroCalendar_2027_A4_Intera_Pagina.pdf'
    
    print("Compiling Eco 4-up PDF with Typst...")
    subprocess.run(['typst', 'compile', eco_typ, eco_pdf], check=True)
    print(f"Compiled: {eco_pdf} ({os.path.getsize(eco_pdf) / 1024:.1f} KB)")
    
    print("Compiling Single page PDF with Typst...")
    subprocess.run(['typst', 'compile', single_typ, single_pdf], check=True)
    print(f"Compiled: {single_pdf} ({os.path.getsize(single_pdf) / 1024:.1f} KB)")
    print("Done!")
