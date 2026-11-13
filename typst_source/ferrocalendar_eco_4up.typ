// FerroCalendar 2027 - Formato Eco (4 giorni per foglio A4)
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

// Page 1
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "venerdì",
    month_name: "gennaio",
    saint: "Maria Madre di Dio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Oggi non si lavora.", "È già tanto se si mette in moto il fegato."),
    closing: "",
    day_of_year: "1"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "sabato",
    month_name: "gennaio",
    saint: "S. Basilio Magno",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Siamo ancora in ferie.", "Anche la voglia di fare."),
    closing: "",
    day_of_year: "2"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "domenica",
    month_name: "gennaio",
    saint: "S. Genoveffa",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il calendario dice gennaio.", "Noi leggiamo ancora vacanza."),
    closing: "",
    day_of_year: "3"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "lunedì",
    month_name: "gennaio",
    saint: "S. Ermete",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La ripresa è vicina.", "Purtroppo."),
    closing: "",
    day_of_year: "4"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 2
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "martedì",
    month_name: "gennaio",
    saint: "S. Amelia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ultimi giorni di libertà.", "Usiamoli male."),
    closing: "",
    day_of_year: "5"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "mercoledì",
    month_name: "gennaio",
    saint: "Epifania del Signore",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La Befana porta via le feste.", "E pure le scuse."),
    closing: "",
    day_of_year: "6"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "giovedì",
    month_name: "gennaio",
    saint: "S. Raimondo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che migliorano l’ambiente", "appena se ne vanno."),
    closing: "",
    day_of_year: "7"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "venerdì",
    month_name: "gennaio",
    saint: "S. Massimo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi spiegare il rispetto,", "sei già in ritardo."),
    closing: "",
    day_of_year: "8"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 3
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "sabato",
    month_name: "gennaio",
    saint: "S. Giuliano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non porto rancore.", "Porto memoria."),
    closing: "",
    day_of_year: "9"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "domenica",
    month_name: "gennaio",
    saint: "S. Aldo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La gente confonde spesso la gentilezza", "con la disponibilità infinita."),
    closing: "",
    day_of_year: "10"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "lunedì",
    month_name: "gennaio",
    saint: "S. Igino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("2027:", "Ci piace la figa.", "Mangiamo la carne.", "Gli unici binari che conosciamo", "sono quelli del treno.", "Non abbiamo i capelli blu."),
    closing: "LA VITA È FANTASTICA.",
    day_of_year: "11"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "martedì",
    month_name: "gennaio",
    saint: "S. Modesto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’esperienza insegna.", "La gente insiste."),
    closing: "",
    day_of_year: "12"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 4
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "mercoledì",
    month_name: "gennaio",
    saint: "S. Ilario",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema non è sbagliare.", "È farlo con troppa sicurezza."),
    closing: "",
    day_of_year: "13"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "giovedì",
    month_name: "gennaio",
    saint: "S. Felice",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("A volte tacere è educazione.", "Altre volte è autocontrollo."),
    closing: "",
    day_of_year: "14"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "venerdì",
    month_name: "gennaio",
    saint: "S. Mauro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non sono difficile.", "Ho semplicemente smesso di tollerare il superfluo."),
    closing: "",
    day_of_year: "15"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "sabato",
    month_name: "gennaio",
    saint: "S. Marcello",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi sempre dimostrare di avere ragione,", "probabilmente hai già perso qualcosa."),
    closing: "",
    day_of_year: "16"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 5
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "domenica",
    month_name: "gennaio",
    saint: "S. Antonio Abate",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Alcuni hanno talmente paura di sbagliare", "che preferiscono non fare niente."),
    closing: "",
    day_of_year: "17"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "lunedì",
    month_name: "gennaio",
    saint: "S. Liberata",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti quelli che ti consigliano", "vogliono vederti migliorare."),
    closing: "",
    day_of_year: "18"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "martedì",
    month_name: "gennaio",
    saint: "S. Mario",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se una persona cambia atteggiamento appena dici no,", "non voleva te. Voleva la tua disponibilità."),
    closing: "",
    day_of_year: "19"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "mercoledì",
    month_name: "gennaio",
    saint: "S. Sebastiano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il silenzio è spesso la risposta migliore.", "Soprattutto quando l’alternativa è spiegare l’ovvio."),
    closing: "",
    day_of_year: "20"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 6
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "giovedì",
    month_name: "gennaio",
    saint: "S. Agnese",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi parla male di tutti,", "prima o poi parlerà male anche di te."),
    closing: "",
    day_of_year: "21"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "venerdì",
    month_name: "gennaio",
    saint: "S. Vincenzo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è cattiveria.", "È memoria."),
    closing: "",
    day_of_year: "22"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "sabato",
    month_name: "gennaio",
    saint: "S. Emerenziana",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La maturità è capire che non tutte le battaglie", "meritano il tuo tempo."),
    closing: "",
    day_of_year: "23"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "domenica",
    month_name: "gennaio",
    saint: "S. Francesco di Sales",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("A volte bisogna lasciar correre.", "Altre volte bisogna segnarsi il nome."),
    closing: "",
    day_of_year: "24"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 7
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "lunedì",
    month_name: "gennaio",
    saint: "Conversione di S. Paolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Due cose vengono sempre a galla:", "la verità e gli stronzi."),
    closing: "",
    day_of_year: "25"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "martedì",
    month_name: "gennaio",
    saint: "S. Tito e Timoteo",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Ale",
    quote_lines: ("È nato lo stesso giorno di Mourinho.", "Uno è lo Special One.", "L’altro almeno sa usare un tornio-fresa."),
    closing: "Auguri, Ale.",
    day_of_year: "26"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "mercoledì",
    month_name: "gennaio",
    saint: "S. Angela Merici",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Oggi si ricorda.", "E si sta in silenzio."),
    closing: "",
    day_of_year: "27"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "giovedì",
    month_name: "gennaio",
    saint: "S. Tommaso d'Aquino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Alla fine della partita, il re e il pedone", "tornano nella stessa scatola."),
    closing: "",
    day_of_year: "28"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 8
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "venerdì",
    month_name: "gennaio",
    saint: "S. Costanzo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le cose più belle della vita", "o sono immorali, o sono illegali,", "oppure fanno ingrassare."),
    closing: "",
    day_of_year: "29"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "sabato",
    month_name: "gennaio",
    saint: "S. Martina",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Undicesimo comandamento:", "lascia perdere."),
    closing: "",
    day_of_year: "30"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "31",
    day_of_week: "domenica",
    month_name: "gennaio",
    saint: "S. Giovanni Bosco",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Più è bello il posto,", "meno comunisti ci sono."),
    closing: "",
    day_of_year: "31"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "lunedì",
    month_name: "febbraio",
    saint: "S. Verdiana",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Essere disponibili non significa", "essere a disposizione."),
    closing: "",
    day_of_year: "32"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 9
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "martedì",
    month_name: "febbraio",
    saint: "Presentazione del Signore",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema non è sbagliare.", "È farlo con troppa sicurezza."),
    closing: "",
    day_of_year: "33"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "mercoledì",
    month_name: "febbraio",
    saint: "S. Biagio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La pazienza è una virtù.", "Io preferisco evitare le persone", "che la mettono alla prova."),
    closing: "",
    day_of_year: "34"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "giovedì",
    month_name: "febbraio",
    saint: "S. Gilberto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi sa fare, fa.", "Chi non sa fare, spesso coordina."),
    closing: "",
    day_of_year: "35"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "venerdì",
    month_name: "febbraio",
    saint: "S. Agata",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti meritano una seconda possibilità.", "Alcuni hanno già sprecato", "la prima abbastanza bene."),
    closing: "",
    day_of_year: "36"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 10
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "sabato",
    month_name: "febbraio",
    saint: "S. Paolo Miki",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il silenzio è spesso la risposta migliore.", "Soprattutto quando l’alternativa", "è spiegare l’ovvio."),
    closing: "",
    day_of_year: "37"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "domenica",
    month_name: "febbraio",
    saint: "S. Teodoro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non porto rancore.", "Porto memoria."),
    closing: "",
    day_of_year: "38"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "lunedì",
    month_name: "febbraio",
    saint: "S. Girolamo Emiliani",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’esperienza insegna.", "La gente insiste."),
    closing: "",
    day_of_year: "39"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "martedì",
    month_name: "febbraio",
    saint: "S. Apollonia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Alcuni hanno talmente paura di sbagliare", "che preferiscono non fare niente."),
    closing: "",
    day_of_year: "40"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 11
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "mercoledì",
    month_name: "febbraio",
    saint: "S. Scolastica",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi spiegare il rispetto,", "sei già in ritardo."),
    closing: "",
    day_of_year: "41"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "giovedì",
    month_name: "febbraio",
    saint: "N.S. di Lourdes",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti quelli che ti consigliano", "vogliono vederti migliorare."),
    closing: "",
    day_of_year: "42"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "venerdì",
    month_name: "febbraio",
    saint: "S. Eulalia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("A volte tacere è educazione.", "Altre volte è autocontrollo."),
    closing: "",
    day_of_year: "43"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "sabato",
    month_name: "febbraio",
    saint: "S. Maura",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’amore è cieco.", "La convivenza gli ridà la vista."),
    closing: "",
    day_of_year: "44"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 12
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "domenica",
    month_name: "febbraio",
    saint: "S. Valentino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("San Valentino:", "oggi fingete almeno di sopportarvi."),
    closing: "",
    day_of_year: "45"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "lunedì",
    month_name: "febbraio",
    saint: "S. Faustino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La gente confonde spesso la gentilezza", "con la disponibilità infinita."),
    closing: "",
    day_of_year: "46"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "martedì",
    month_name: "febbraio",
    saint: "S. Giuliana",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi sa stare zitto", "ha già capito più di molti."),
    closing: "",
    day_of_year: "47"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "mercoledì",
    month_name: "febbraio",
    saint: "S. Donato",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non sono difficile.", "Ho semplicemente smesso", "di tollerare il superfluo."),
    closing: "",
    day_of_year: "48"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 13
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "giovedì",
    month_name: "febbraio",
    saint: "S. Simeone",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi sempre dimostrare di avere ragione,", "probabilmente hai già perso qualcosa."),
    closing: "",
    day_of_year: "49"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "venerdì",
    month_name: "febbraio",
    saint: "S. Mansueto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La maturità è capire che", "non tutte le battaglie", "meritano il tuo tempo."),
    closing: "",
    day_of_year: "50"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "sabato",
    month_name: "febbraio",
    saint: "S. Silvano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che migliorano l’ambiente", "appena se ne vanno."),
    closing: "",
    day_of_year: "51"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "domenica",
    month_name: "febbraio",
    saint: "S. Pier Damiani",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il rispetto si offre.", "La fiducia si conquista."),
    closing: "",
    day_of_year: "52"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 14
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "lunedì",
    month_name: "febbraio",
    saint: "Cattedra di S. Pietro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ho pochi pregi.", "Ma almeno non sono comunista."),
    closing: "",
    day_of_year: "53"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "martedì",
    month_name: "febbraio",
    saint: "S. Policarpo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è cattiveria.", "È memoria."),
    closing: "",
    day_of_year: "54"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "mercoledì",
    month_name: "febbraio",
    saint: "S. Edilberto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("A volte bisogna lasciar correre.", "Altre volte bisogna segnarsi il nome."),
    closing: "",
    day_of_year: "55"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "giovedì",
    month_name: "febbraio",
    saint: "S. Cesario",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Ferro",
    quote_lines: ("Mettere alla prova la pazienza degli altri", "è praticamente il suo secondo lavoro.", "Il primo è rompere il cazzo."),
    closing: "Auguri, Ferro.",
    day_of_year: "56"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 15
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "venerdì",
    month_name: "febbraio",
    saint: "S. Romeo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve essere antipatici con tutti.", "Basta selezionare bene."),
    closing: "",
    day_of_year: "57"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "sabato",
    month_name: "febbraio",
    saint: "S. Leandro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono giorni in cui", "la migliore risposta", "è non rispondere."),
    closing: "",
    day_of_year: "58"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "domenica",
    month_name: "febbraio",
    saint: "S. Romano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Febbraio è corto.", "La pazienza anche."),
    closing: "",
    day_of_year: "59"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "lunedì",
    month_name: "marzo",
    saint: "S. Albino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Marzo promette primavera.", "La gente resta quella."),
    closing: "",
    day_of_year: "60"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 16
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "martedì",
    month_name: "marzo",
    saint: "S. Simplicio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutto quello che perdi", "merita di essere ritrovato."),
    closing: "",
    day_of_year: "61"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "mercoledì",
    month_name: "marzo",
    saint: "S. Cunegonda",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("C’è chi impara dagli errori.", "E chi prende appunti per rifarli meglio."),
    closing: "",
    day_of_year: "62"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "giovedì",
    month_name: "marzo",
    saint: "S. Casimiro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve avere sempre l’ultima parola.", "Basta avere ragione abbastanza spesso."),
    closing: "",
    day_of_year: "63"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "venerdì",
    month_name: "marzo",
    saint: "S. Adriano",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Massi",
    quote_lines: ("Prima la figa e il pallone.", "Ora la bici e Strava.", "L’età fa strani scherzi."),
    closing: "Auguri, Massi.",
    day_of_year: "64"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 17
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "sabato",
    month_name: "marzo",
    saint: "S. Coletta",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le persone semplici sono rare.", "Quelle complicate, purtroppo, no."),
    closing: "",
    day_of_year: "65"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "domenica",
    month_name: "marzo",
    saint: "S. Perpetua e Felicita",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è freddezza.", "È selezione naturale."),
    closing: "",
    day_of_year: "66"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "lunedì",
    month_name: "marzo",
    saint: "S. Giovanni di Dio",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "donne",
    quote_lines: ("Siamo tutti uguali.", "Ma oggi fate finta di crederci."),
    closing: "Auguri, donne.",
    day_of_year: "67"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "martedì",
    month_name: "marzo",
    saint: "S. Francesca Romana",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi ti cerca solo quando gli servi", "ha già spiegato abbastanza."),
    closing: "",
    day_of_year: "68"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 18
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "mercoledì",
    month_name: "marzo",
    saint: "S. Simplicio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il tempo chiarisce molte cose.", "Le persone aiutano."),
    closing: "",
    day_of_year: "69"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "giovedì",
    month_name: "marzo",
    saint: "S. Costantino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non sempre vale la pena discutere.", "A volte basta osservare."),
    closing: "",
    day_of_year: "70"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "venerdì",
    month_name: "marzo",
    saint: "S. Massimiliano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi pretende rispetto", "dovrebbe provare a meritarlo."),
    closing: "",
    day_of_year: "71"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "sabato",
    month_name: "marzo",
    saint: "S. Patrizia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le promesse costano poco.", "Per questo ne fanno tutti."),
    closing: "",
    day_of_year: "72"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 19
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "domenica",
    month_name: "marzo",
    saint: "S. Matilde",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Più conosco le persone,", "più apprezzo i momenti da solo."),
    closing: "",
    day_of_year: "73"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "lunedì",
    month_name: "marzo",
    saint: "S. Luisa",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti i problemi hanno una soluzione.", "Alcuni hanno un nome."),
    closing: "",
    day_of_year: "74"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "martedì",
    month_name: "marzo",
    saint: "S. Eriberto",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Fox",
    quote_lines: ("Ha già scavallato la montagna.", "Ora è in discesa.", "E i freni non sembrano nuovissimi.", "Oci!"),
    closing: "Auguri, Fox.",
    day_of_year: "75"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "mercoledì",
    month_name: "marzo",
    saint: "S. Patrizio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non devi piacere a tutti.", "Non sei una birra gratis."),
    closing: "",
    day_of_year: "76"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 20
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "giovedì",
    month_name: "marzo",
    saint: "S. Cirillo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’educazione trattiene", "molte risposte meritate."),
    closing: "",
    day_of_year: "77"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "venerdì",
    month_name: "marzo",
    saint: "S. Giuseppe",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Fare il padre non significa sapere tutto.", "Significa esserci sempre."),
    closing: "",
    day_of_year: "78"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "sabato",
    month_name: "marzo",
    saint: "S. Claudia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("È arrivata la primavera.", "La voglia di lavorare no."),
    closing: "",
    day_of_year: "79"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "domenica",
    month_name: "marzo",
    saint: "S. Benedetto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che parlano tanto", "per evitare di dire qualcosa."),
    closing: "",
    day_of_year: "80"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 21
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "lunedì",
    month_name: "marzo",
    saint: "S. Lea",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi fa troppo rumore", "di solito ha poco da dire."),
    closing: "",
    day_of_year: "81"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "martedì",
    month_name: "marzo",
    saint: "S. Turibio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non giudico nessuno.", "Prendo nota."),
    closing: "",
    day_of_year: "82"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "mercoledì",
    month_name: "marzo",
    saint: "S. Romolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il vantaggio di dire la verità", "è che non devi ricordarti le bugie."),
    closing: "",
    day_of_year: "83"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "giovedì",
    month_name: "marzo",
    saint: "Annunciazione del Signore",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Alcuni rapporti non finiscono male.", "Finiscono giusto."),
    closing: "",
    day_of_year: "84"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 22
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "venerdì",
    month_name: "marzo",
    saint: "S. Emanuele",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se vuoi la pace,", "smetti di frequentare gli idioti."),
    closing: "",
    day_of_year: "85"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "sabato",
    month_name: "marzo",
    saint: "S. Augusto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le idee sono libere.", "Peccato che certe siano comuniste."),
    closing: "",
    day_of_year: "86"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "domenica",
    month_name: "marzo",
    saint: "S. Sisto III",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il carattere si vede", "quando non hai nulla da guadagnare."),
    closing: "",
    day_of_year: "87"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "lunedì",
    month_name: "marzo",
    saint: "S. Secondo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Essere buoni va bene.", "Essere fessi è un’altra cosa."),
    closing: "",
    day_of_year: "88"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 23
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "martedì",
    month_name: "marzo",
    saint: "S. Amedeo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutto merita una risposta.", "Soprattutto certe persone."),
    closing: "",
    day_of_year: "89"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "31",
    day_of_week: "mercoledì",
    month_name: "marzo",
    saint: "S. Beniamino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Marzo è finito.", "Noi siamo ancora qui."),
    closing: "",
    day_of_year: "90"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "giovedì",
    month_name: "aprile",
    saint: "S. Ugo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Pezzi perfetti.", "Tolleranze spaccate.", "Nessun difetto.", "Tranquilli: è il 1° aprile."),
    closing: "",
    day_of_year: "91"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "venerdì",
    month_name: "aprile",
    saint: "S. Francesco da Paola",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi promette troppo", "di solito mantiene poco."),
    closing: "",
    day_of_year: "92"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 24
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "sabato",
    month_name: "aprile",
    saint: "S. Riccardo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve complicare tutto.", "La gente ci riesce già da sola."),
    closing: "",
    day_of_year: "93"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "domenica",
    month_name: "aprile",
    saint: "S. Isidoro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema del lavoro di precisione?", "Lo notano solo quando sbagli."),
    closing: "",
    day_of_year: "94"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "lunedì",
    month_name: "aprile",
    saint: "S. Vincenzo Ferrer",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono discussioni che non si vincono.", "Si abbandonano."),
    closing: "",
    day_of_year: "95"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "martedì",
    month_name: "aprile",
    saint: "S. Guglielmo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Misura due volte.", "Taglia una volta."),
    closing: "",
    day_of_year: "96"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 25
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "mercoledì",
    month_name: "aprile",
    saint: "S. Giovanni Battista de la Salle",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti hanno qualcosa da dire.", "Molti parlano lo stesso."),
    closing: "",
    day_of_year: "97"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "giovedì",
    month_name: "aprile",
    saint: "S. Alberto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il cinismo è avere", "la giusta misura", "tra esperienza e aspettative."),
    closing: "",
    day_of_year: "98"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "venerdì",
    month_name: "aprile",
    saint: "S. Maria Cleofe",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le buone intenzioni sono gratis.", "I risultati no."),
    closing: "",
    day_of_year: "99"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "sabato",
    month_name: "aprile",
    saint: "S. Terenzio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve avere sempre ragione.", "Basta evitare di avere torto troppo spesso."),
    closing: "",
    day_of_year: "100"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 26
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "domenica",
    month_name: "aprile",
    saint: "S. Gemma Galgani",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Quando smetti di essere utile", "scopri subito chi ti cercava", "e chi aveva bisogno di te."),
    closing: "",
    day_of_year: "101"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "lunedì",
    month_name: "aprile",
    saint: "S. Giulio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema dei comunisti", "è che finiscono sempre", "i soldi degli altri."),
    closing: "",
    day_of_year: "102"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "martedì",
    month_name: "aprile",
    saint: "S. Martino I",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Essere gentili è una scelta.", "Farsi prendere per il culo no."),
    closing: "",
    day_of_year: "103"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "mercoledì",
    month_name: "aprile",
    saint: "S. Lamberto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il tempo passa.", "Le cazzate restano."),
    closing: "",
    day_of_year: "104"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 27
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "giovedì",
    month_name: "aprile",
    saint: "S. Annibale",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Lavorare in gruppo è semplice:", "uno lavora, gli altri aggiornano."),
    closing: "",
    day_of_year: "105"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "venerdì",
    month_name: "aprile",
    saint: "S. Bernadette",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è arroganza.", "È stanchezza selettiva."),
    closing: "",
    day_of_year: "106"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "sabato",
    month_name: "aprile",
    saint: "S. Aniceto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se tutti ti danno ragione,", "forse hai scelto male la stanza."),
    closing: "",
    day_of_year: "107"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "domenica",
    month_name: "aprile",
    saint: "S. Galdino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’ottimismo è solo", "mancanza di dati."),
    closing: "",
    day_of_year: "108"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 28
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "lunedì",
    month_name: "aprile",
    saint: "S. Emma",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che hanno sempre", "una soluzione per problemi", "che non devono risolvere loro."),
    closing: "",
    day_of_year: "109"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "martedì",
    month_name: "aprile",
    saint: "S. Adalgisa",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il talento aiuta.", "La disciplina decide."),
    closing: "",
    day_of_year: "110"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "mercoledì",
    month_name: "aprile",
    saint: "S. Anselmo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le idee sono libere.", "Peccato per alcune."),
    closing: "",
    day_of_year: "111"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "giovedì",
    month_name: "aprile",
    saint: "S. Sotero",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Giornata della Terra.", "Un pianeta intero", "e certa gente doveva capitare", "proprio qui dentro!"),
    closing: "",
    day_of_year: "112"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 29
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "venerdì",
    month_name: "aprile",
    saint: "S. Giorgio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il lavoro nobilita l’uomo.", "Ma qualcuno sta esagerando con la nobiltà."),
    closing: "",
    day_of_year: "113"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "sabato",
    month_name: "aprile",
    saint: "S. Fedele",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti gli errori insegnano.", "Alcuni tornano il giorno dopo."),
    closing: "",
    day_of_year: "114"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "domenica",
    month_name: "aprile",
    saint: "S. Marco Evangelista",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Liberazione.", "Oggi memoria lunga", "e polemiche ancora più lunghe."),
    closing: "",
    day_of_year: "115"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "lunedì",
    month_name: "aprile",
    saint: "S. Marcellino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi sa fare non ha bisogno", "di raccontarlo troppo."),
    closing: "",
    day_of_year: "116"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 30
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "martedì",
    month_name: "aprile",
    saint: "S. Zita",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Gigi",
    quote_lines: ("La fresa perdona poco.", "Gigi ancora meno."),
    closing: "Auguri, Gigi.",
    day_of_year: "117"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "mercoledì",
    month_name: "aprile",
    saint: "S. Valeria",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema non è avere un’opinione.", "È pensare che valga per forza."),
    closing: "",
    day_of_year: "118"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "giovedì",
    month_name: "aprile",
    saint: "S. Caterina da Siena",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Quando dividono tutto", "sono sempre generosi", "con quello degli altri."),
    closing: "",
    day_of_year: "119"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "venerdì",
    month_name: "aprile",
    saint: "S. Pio V",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Aprile finisce.", "Le rotture di coglioni no."),
    closing: "",
    day_of_year: "120"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 31
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "sabato",
    month_name: "maggio",
    saint: "S. Giuseppe Artigiano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Vito e Federico,", "oggi riposatevi.", "Ve lo siete meritato."),
    closing: "Buona Festa dei Lavoratori.",
    day_of_year: "121"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "domenica",
    month_name: "maggio",
    saint: "S. Atanasio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le ferie finiscono.", "La dignità pure,", "ma più lentamente."),
    closing: "",
    day_of_year: "122"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "lunedì",
    month_name: "maggio",
    saint: "Ss. Filippo e Giacomo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il lunedì è una punizione", "per colpe che non ricordo."),
    closing: "",
    day_of_year: "123"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "martedì",
    month_name: "maggio",
    saint: "S. Silvano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("C’è chi porta soluzioni.", "E chi porta solo sé stesso."),
    closing: "",
    day_of_year: "124"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 32
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "mercoledì",
    month_name: "maggio",
    saint: "S. Pellegrino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Fare bene una cosa", "richiede tempo.", "Rifarla per colpa di altri, di più."),
    closing: "",
    day_of_year: "125"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "giovedì",
    month_name: "maggio",
    saint: "S. Domenico Savio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono silenzi preziosi.", "Di solito iniziano", "quando qualcuno se ne va."),
    closing: "",
    day_of_year: "126"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "venerdì",
    month_name: "maggio",
    saint: "S. Flavia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema non è faticare.", "È farlo anche per chi", "non sa dove mettere le mani."),
    closing: "",
    day_of_year: "127"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "sabato",
    month_name: "maggio",
    saint: "B.V. Maria del Rosario",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Alcuni vogliono rispetto", "con la stessa convinzione", "con cui evitano di meritarselo."),
    closing: "",
    day_of_year: "128"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 33
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "domenica",
    month_name: "maggio",
    saint: "S. Gregorio",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "mamme",
    quote_lines: ("Alle mamme si deve tutto.", "Almeno oggi,", "evitate di rompere."),
    closing: "Auguri, mamme.",
    day_of_year: "129"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "lunedì",
    month_name: "maggio",
    saint: "S. Antonino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’esperienza non ti cambia la vita.", "Ti fa solo perdere pazienza prima."),
    closing: "",
    day_of_year: "130"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "martedì",
    month_name: "maggio",
    saint: "S. Fabio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le persone utili si riconoscono.", "Quelle inutili, purtroppo, pure."),
    closing: "",
    day_of_year: "131"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "mercoledì",
    month_name: "maggio",
    saint: "S. Pancrazio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il comunismo piace sempre", "a chi sogna di dividere", "quello che non ha guadagnato."),
    closing: "",
    day_of_year: "132"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 34
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "giovedì",
    month_name: "maggio",
    saint: "B.V. di Fatima",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi si offende per tutto", "di solito ha già capito", "che si parlava di lui."),
    closing: "",
    day_of_year: "133"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "venerdì",
    month_name: "maggio",
    saint: "S. Mattia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Un lavoro fatto bene", "non fa rumore.", "Gli errori invece sì."),
    closing: "",
    day_of_year: "134"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "sabato",
    month_name: "maggio",
    saint: "S. Torquato",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi spiegare tre volte", "la stessa cosa,", "non stai insegnando: stai soffrendo."),
    closing: "",
    day_of_year: "135"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "domenica",
    month_name: "maggio",
    saint: "S. Ubaldo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono giornate storte.", "E poi ci sono quelle", "frequentate male."),
    closing: "",
    day_of_year: "136"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 35
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "lunedì",
    month_name: "maggio",
    saint: "S. Pasquale Baylon",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La sicurezza è una gran cosa.", "L’eccesso di sicurezza", "fa solo danni."),
    closing: "",
    day_of_year: "137"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "martedì",
    month_name: "maggio",
    saint: "S. Giovanni I",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Fidarsi è bene.", "Controllare è precisione."),
    closing: "",
    day_of_year: "138"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "mercoledì",
    month_name: "maggio",
    saint: "S. Pietro di Morrone",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Certe persone non sbagliano mai.", "Riescono direttamente", "a fare peggio."),
    closing: "",
    day_of_year: "139"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "giovedì",
    month_name: "maggio",
    saint: "S. Bernardino da Siena",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve correre forte.", "Basta non andare in giro", "a cazzo di cane."),
    closing: "",
    day_of_year: "140"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 36
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "venerdì",
    month_name: "maggio",
    saint: "S. Vittorio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La pazienza non è infinita.", "Ha solo imparato", "a parlare meno."),
    closing: "",
    day_of_year: "141"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "sabato",
    month_name: "maggio",
    saint: "S. Rita da Cascia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Milito, una finta, in areaaa…", "Ancoraaaa!!! El Principe!!!", "Diego Milito!", "El Principe diventa Re", "nella notte di Madrid.", "22 maggio 2010."),
    closing: "",
    day_of_year: "142"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "domenica",
    month_name: "maggio",
    saint: "S. Desiderio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Oggi si ricorda chi ha avuto coraggio", "quando tanti avevano solo paura.", "23 maggio 1992."),
    closing: "",
    day_of_year: "143"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "lunedì",
    month_name: "maggio",
    saint: "B.V. Maria Ausiliatrice",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se una cosa funziona,", "non toccarla.", "Soprattutto se sei quello", "che la rompe sempre."),
    closing: "",
    day_of_year: "144"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 37
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "martedì",
    month_name: "maggio",
    saint: "S. Beda",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("C’è chi lavora bene.", "C’è chi parla bene.", "Di solito non sono gli stessi."),
    closing: "",
    day_of_year: "145"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "mercoledì",
    month_name: "maggio",
    saint: "S. Filippo Neri",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il rispetto non si chiede.", "Si tiene,", "se si è capaci."),
    closing: "",
    day_of_year: "146"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "giovedì",
    month_name: "maggio",
    saint: "S. Agostino di Canterbury",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ogni gruppo ha il suo equilibrio.", "Poi arriva uno", "e lo rovina."),
    closing: "",
    day_of_year: "147"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "venerdì",
    month_name: "maggio",
    saint: "S. Emilio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Capire al volo è un pregio.", "Farsi capire al volo,", "con certa gente, è fantascienza."),
    closing: "",
    day_of_year: "148"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 38
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "sabato",
    month_name: "maggio",
    saint: "S. Massimo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Più passa il tempo,", "più certa gente", "sembra un difetto di fabbrica."),
    closing: "",
    day_of_year: "149"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "domenica",
    month_name: "maggio",
    saint: "S. Ferdinando",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non puoi scegliere i colleghi.", "Ed è qui", "che la vita diventa cattiva."),
    closing: "",
    day_of_year: "150"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "31",
    day_of_week: "lunedì",
    month_name: "maggio",
    saint: "Visitazione B.V.M.",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Maggio è finito.", "La voglia di ferie", "adesso è ufficiale."),
    closing: "",
    day_of_year: "151"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "martedì",
    month_name: "giugno",
    saint: "S. Giustino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Giugno.", "Il mese in cui lavorare", "comincia a sembrare un errore."),
    closing: "",
    day_of_year: "152"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 39
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "mercoledì",
    month_name: "giugno",
    saint: "Ss. Marcellino e Pietro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("È meglio la peggiore delle democrazie", "della migliore di tutte le dittature.”", "— Sandro Pertini"),
    closing: "",
    day_of_year: "153"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "giovedì",
    month_name: "giugno",
    saint: "S. Carlo Lwanga",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il difficile non è fare bene il lavoro.", "È farlo mentre tutti ti spiegano come."),
    closing: "",
    day_of_year: "154"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "venerdì",
    month_name: "giugno",
    saint: "S. Quirino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che entrano in officina", "e fanno subito aumentare", "il rischio di errore."),
    closing: "",
    day_of_year: "155"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "sabato",
    month_name: "giugno",
    saint: "S. Bonifacio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Venerdì.", "La produttività saluta", "e ci vediamo lunedì."),
    closing: "",
    day_of_year: "156"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 40
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "domenica",
    month_name: "giugno",
    saint: "S. Norberto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutto va aggiustato.", "Certa gente nasce già fuori tolleranza."),
    closing: "",
    day_of_year: "157"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "lunedì",
    month_name: "giugno",
    saint: "S. Roberto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi ha sempre una scusa", "di solito ha poco altro."),
    closing: "",
    day_of_year: "158"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "martedì",
    month_name: "giugno",
    saint: "S. Medardo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le persone migliori", "non hanno bisogno di ricordartelo."),
    closing: "",
    day_of_year: "159"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "mercoledì",
    month_name: "giugno",
    saint: "S. Primo e Feliciano",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Giorgia",
    quote_lines: ("Ci sono giorni che passano.", "E giorni che cambiano tutto.", "Il 9 giugno 2025 è stato il mio."),
    closing: "Buon compleanno, Giorgia.",
    day_of_year: "160"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 41
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "giovedì",
    month_name: "giugno",
    saint: "S. Diana",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve sapere tutto.", "Basta sapere quando", "è meglio stare zitti."),
    closing: "",
    day_of_year: "161"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "venerdì",
    month_name: "giugno",
    saint: "S. Barnaba",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("C’è chi risolve i problemi.", "E chi arriva giusto in tempo", "per chiedere com’è successo."),
    closing: "",
    day_of_year: "162"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "sabato",
    month_name: "giugno",
    saint: "S. Onofrio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema non è avere pazienza.", "È che la gente continua a provarla."),
    closing: "",
    day_of_year: "163"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "domenica",
    month_name: "giugno",
    saint: "S. Antonio di Padova",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Alcuni colleghi sono come le quote:", "sulla carta tornano,", "poi misuri e cambia tutto."),
    closing: "",
    day_of_year: "164"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 42
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "lunedì",
    month_name: "giugno",
    saint: "S. Eliseo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve fare tanto rumore.", "I pezzi buoni", "parlano da soli."),
    closing: "",
    day_of_year: "165"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "martedì",
    month_name: "giugno",
    saint: "S. Vito",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non devi essere indispensabile.", "Fai già un favore", "se non sei d’intralcio."),
    closing: "",
    day_of_year: "166"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "mercoledì",
    month_name: "giugno",
    saint: "S. Aureliano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il comunismo era un’ideologia", "che prometteva giustizia e uguaglianza,", "ma che ha prodotto solo miseria e terrore.”", "— Oriana Fallaci"),
    closing: "",
    day_of_year: "167"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "giovedì",
    month_name: "giugno",
    saint: "S. Ranieri",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è sfiducia.", "È che ti ho già visto all’opera."),
    closing: "",
    day_of_year: "168"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 43
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "venerdì",
    month_name: "giugno",
    saint: "S. Gregorio Barbarigo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il venerdì non risolve i problemi.", "Ma almeno li rimanda a lunedì."),
    closing: "",
    day_of_year: "169"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "sabato",
    month_name: "giugno",
    saint: "S. Romualdo",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Super Ciccio",
    quote_lines: ("Figa, motori e cazzi degli altri.", "Le sue tre grandi passioni.", "Tanti auguri, Super Ciccio."),
    closing: "",
    day_of_year: "170"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "domenica",
    month_name: "giugno",
    saint: "S. Silverio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone", "che migliorano col tempo.", "Altre semplicemente invecchiano."),
    closing: "",
    day_of_year: "171"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "lunedì",
    month_name: "giugno",
    saint: "S. Luigi Gonzaga",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Igli",
    quote_lines: ("Albanese di nascita,", "fresatore per necessità.", "Distratto dalle ragazze per vocazione."),
    closing: "Auguri, Igli.",
    day_of_year: "172"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 44
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "martedì",
    month_name: "giugno",
    saint: "S. Paolino da Nola",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("È estate.", "Fuori trenta gradi.", "Dentro sempre le stesse rotture di coglioni."),
    closing: "",
    day_of_year: "173"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "mercoledì",
    month_name: "giugno",
    saint: "S. Lanfranco",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il talento si vede.", "La costanza si misura."),
    closing: "",
    day_of_year: "174"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "giovedì",
    month_name: "giugno",
    saint: "Natività S. Giovanni Battista",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il calibro non ha simpatie.", "O sei in tolleranza", "o hai fatto una cazzata."),
    closing: "",
    day_of_year: "175"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "venerdì",
    month_name: "giugno",
    saint: "S. Guglielmo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti quelli che sembrano impegnati", "stanno facendo qualcosa."),
    closing: "",
    day_of_year: "176"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 45
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "sabato",
    month_name: "giugno",
    saint: "S. Vigilio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se vuoi sapere chi è davvero capace,", "guarda chi risolve", "senza fare casino."),
    closing: "",
    day_of_year: "177"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "domenica",
    month_name: "giugno",
    saint: "S. Cirillo d'Alessandria",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("C’è chi porta esperienza.", "E chi porta solo anzianità."),
    closing: "",
    day_of_year: "178"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "lunedì",
    month_name: "giugno",
    saint: "S. Ireneo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Certi colleghi non rallentano il lavoro.", "Gli danno solo", "un’altra velocità."),
    closing: "",
    day_of_year: "179"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "martedì",
    month_name: "giugno",
    saint: "Ss. Pietro e Paolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il rispetto si vede soprattutto", "quando non c’è niente", "da guadagnare."),
    closing: "",
    day_of_year: "180"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 46
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "mercoledì",
    month_name: "giugno",
    saint: "Primi Santi Martiri",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Metà anno è andata.", "La pazienza pure."),
    closing: "",
    day_of_year: "181"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "giovedì",
    month_name: "luglio",
    saint: "S. Pier Giorgio Frassati",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Luglio.", "Il caldo aumenta.", "La voglia di lavorare no."),
    closing: "",
    day_of_year: "182"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "venerdì",
    month_name: "luglio",
    saint: "S. Ottone",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che non cambiano idea.", "Non perché abbiano ragione,", "ma perché non ne hanno altre."),
    closing: "",
    day_of_year: "183"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "sabato",
    month_name: "luglio",
    saint: "S. Tommaso Apostolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se una cosa può andare storta,", "qualcuno troverà il modo", "di darle una mano."),
    closing: "",
    day_of_year: "184"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 47
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "domenica",
    month_name: "luglio",
    saint: "S. Elisabetta del Portogallo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono giorni in cui", "la pausa caffè", "è il risultato migliore."),
    closing: "",
    day_of_year: "185"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "lunedì",
    month_name: "luglio",
    saint: "S. Antonio Maria Zaccaria",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il bello dell’esperienza", "è riconoscere subito", "quando sta per arrivare una cazzata."),
    closing: "",
    day_of_year: "186"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "martedì",
    month_name: "luglio",
    saint: "S. Maria Goretti",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se una cosa funziona,", "lascia stare.", "Qualcuno la rovinerà comunque."),
    closing: "",
    day_of_year: "187"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "mercoledì",
    month_name: "luglio",
    saint: "S. Claudio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve essere perfetti.", "Basta non essere il motivo", "per cui rifanno il pezzo."),
    closing: "",
    day_of_year: "188"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 48
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "giovedì",
    month_name: "luglio",
    saint: "S. Adriano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Essere capaci aiuta.", "Essere circondati da gente capace", "aiuta molto di più."),
    closing: "",
    day_of_year: "189"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "venerdì",
    month_name: "luglio",
    saint: "S. Veronica Giuliani",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è il peso del lavoro.", "È certa gente", "che lo rende pesante."),
    closing: "",
    day_of_year: "190"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "sabato",
    month_name: "luglio",
    saint: "S. Felicita",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il lavoro di precisione", "è semplice:", "o torna, o non torna."),
    closing: "",
    day_of_year: "191"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "domenica",
    month_name: "luglio",
    saint: "S. Benedetto da Norcia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non sempre serve una spiegazione.", "A volte basta guardare", "chi ha fatto il lavoro."),
    closing: "",
    day_of_year: "192"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 49
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "lunedì",
    month_name: "luglio",
    saint: "S. Fortunato",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Certe giornate iniziano male.", "Poi arrivano anche i colleghi."),
    closing: "",
    day_of_year: "193"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "martedì",
    month_name: "luglio",
    saint: "S. Enrico",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il comunismo è la teoria", "secondo cui nessuno deve avere troppo.", "Peccato che alla fine non abbia niente nessuno."),
    closing: "",
    day_of_year: "194"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "mercoledì",
    month_name: "luglio",
    saint: "S. Camillo de Lellis",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve sapere tutto.", "Basta non parlare", "come se lo sapessi."),
    closing: "",
    day_of_year: "195"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "giovedì",
    month_name: "luglio",
    saint: "S. Bonaventura",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è che non sopporto la gente.", "È che alcuni si impegnano."),
    closing: "",
    day_of_year: "196"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 50
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "venerdì",
    month_name: "luglio",
    saint: "B.V. Maria del Carmelo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il caldo passa.", "Le rotture di coglioni", "tendono a restare."),
    closing: "",
    day_of_year: "197"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "sabato",
    month_name: "luglio",
    saint: "S. Alessio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che portano valore.", "Altre portano solo presenza."),
    closing: "",
    day_of_year: "198"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "domenica",
    month_name: "luglio",
    saint: "S. Federico",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi controllare tutto due volte,", "probabilmente hai già capito", "con chi stai lavorando."),
    closing: "",
    day_of_year: "199"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "lunedì",
    month_name: "luglio",
    saint: "S. Arsenio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Oggi si ricordano", "Paolo Borsellino", "e gli uomini della sua scorta.", "19 luglio 1992."),
    closing: "",
    day_of_year: "200"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 51
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "martedì",
    month_name: "luglio",
    saint: "S. Elia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutte le persone inutili", "sono dannose.", "Alcune sono solo molto presenti."),
    closing: "",
    day_of_year: "201"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "mercoledì",
    month_name: "luglio",
    saint: "S. Lorenzo da Brindisi",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Fare bene il proprio lavoro", "è già difficile.", "Fare anche quello degli altri, di più."),
    closing: "",
    day_of_year: "202"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "giovedì",
    month_name: "luglio",
    saint: "S. Maria Maddalena",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’estate rende tutti più leggeri.", "Tranne certi colleghi."),
    closing: "",
    day_of_year: "203"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "venerdì",
    month_name: "luglio",
    saint: "S. Brigida",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è importante sapere tutto.", "È importante sapere", "quando smettere di parlare."),
    closing: "",
    day_of_year: "204"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 52
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "sabato",
    month_name: "luglio",
    saint: "S. Cristina",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi lavora bene", "non ha bisogno di sembrare occupato."),
    closing: "",
    day_of_year: "205"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "domenica",
    month_name: "luglio",
    saint: "S. Giacomo Apostolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che migliorano", "solo quando le vedi da lontano."),
    closing: "",
    day_of_year: "206"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "lunedì",
    month_name: "luglio",
    saint: "Ss. Anna e Gioacchino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono errori che insegnano.", "E altri che continuano", "a presentarsi al lavoro."),
    closing: "",
    day_of_year: "207"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "martedì",
    month_name: "luglio",
    saint: "S. Liliana",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il pezzo non mente.", "La misura nemmeno.", "Le scuse sì."),
    closing: "",
    day_of_year: "208"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 53
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "mercoledì",
    month_name: "luglio",
    saint: "S. Nazario",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il rispetto non fa rumore.", "La mancanza di rispetto sì."),
    closing: "",
    day_of_year: "209"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "giovedì",
    month_name: "luglio",
    saint: "S. Marta",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il comunismo è affascinante:", "finché a condividere", "sono sempre gli altri."),
    closing: "",
    day_of_year: "210"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "venerdì",
    month_name: "luglio",
    saint: "S. Pietro Crisologo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono giorni in cui", "il miglior risultato", "è arrivare a sera senza mandare affanculo nessuno."),
    closing: "",
    day_of_year: "211"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "31",
    day_of_week: "sabato",
    month_name: "luglio",
    saint: "S. Ignazio di Loyola",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Manca poco alle ferie.", "Prima che faccio una strage."),
    closing: "",
    day_of_year: "212"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 54
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "domenica",
    month_name: "agosto",
    saint: "S. Alfonso Maria de Liguori",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Agosto.", "Manca poco alle ferie.", "Non rovinate tutto adesso."),
    closing: "",
    day_of_year: "213"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "lunedì",
    month_name: "agosto",
    saint: "S. Eusebio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che ti fanno capire", "quanto sia importante", "avere delle ferie."),
    closing: "",
    day_of_year: "214"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "martedì",
    month_name: "agosto",
    saint: "S. Lidia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Più si avvicinano le ferie,", "più ogni richiesta", "sembra personale."),
    closing: "",
    day_of_year: "215"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "mercoledì",
    month_name: "agosto",
    saint: "S. Giovanni Maria Vianney",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ultimi giorni.", "Adesso serve solo", "non fare cazzate."),
    closing: "",
    day_of_year: "216"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 55
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "giovedì",
    month_name: "agosto",
    saint: "Dedicazione Basilica S. Maria Maggiore",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Giornata di pulizie.", "Tra una pausa e l’altra", "qualcuno riesce anche a pulire."),
    closing: "",
    day_of_year: "217"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "venerdì",
    month_name: "agosto",
    saint: "Trasfigurazione del Signore",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "218"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "sabato",
    month_name: "agosto",
    saint: "S. Gaetano da Thiene",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "219"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "domenica",
    month_name: "agosto",
    saint: "S. Domenico",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "220"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 56
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "lunedì",
    month_name: "agosto",
    saint: "S. Teresa Benedetta",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "221"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "martedì",
    month_name: "agosto",
    saint: "S. Lorenzo",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "222"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "mercoledì",
    month_name: "agosto",
    saint: "S. Chiara",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "223"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "giovedì",
    month_name: "agosto",
    saint: "S. Ercolano",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "224"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 57
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "venerdì",
    month_name: "agosto",
    saint: "S. Ponziano",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "225"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "sabato",
    month_name: "agosto",
    saint: "S. Massimiliano Kolbe",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "226"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "domenica",
    month_name: "agosto",
    saint: "Assunzione della B.V. Maria",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "227"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "lunedì",
    month_name: "agosto",
    saint: "S. Rocco",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "228"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 58
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "martedì",
    month_name: "agosto",
    saint: "S. Giacinto",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "229"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "mercoledì",
    month_name: "agosto",
    saint: "S. Elena",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "230"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "giovedì",
    month_name: "agosto",
    saint: "S. Giovanni Eudes",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "231"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "venerdì",
    month_name: "agosto",
    saint: "S. Bernardo",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "232"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 59
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "sabato",
    month_name: "agosto",
    saint: "S. Pio X",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "233"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "domenica",
    month_name: "agosto",
    saint: "B.V. Maria Regina",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "234"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "lunedì",
    month_name: "agosto",
    saint: "S. Rosa da Lima",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Qualunque problema può aspettare.",),
    closing: "",
    day_of_year: "235"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "martedì",
    month_name: "agosto",
    saint: "S. Bartolomeo Apostolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("RIAPERTO.", "PURTROPPO."),
    closing: "",
    day_of_year: "236"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 60
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "mercoledì",
    month_name: "agosto",
    saint: "S. Ludovico",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il rientro dalle ferie insegna", "che la felicità", "ha una data di scadenza."),
    closing: "",
    day_of_year: "237"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "giovedì",
    month_name: "agosto",
    saint: "S. Alessandro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Dopo le ferie", "non serve motivazione.", "Serve rassegnazione."),
    closing: "",
    day_of_year: "238"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "venerdì",
    month_name: "agosto",
    saint: "S. Monica",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("C’è chi torna dalle ferie riposato.", "E chi torna", "semplicemente tornato."),
    closing: "",
    day_of_year: "239"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "sabato",
    month_name: "agosto",
    saint: "S. Agostino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il lavoro non scappa.", "Infatti era ancora tutto qui."),
    closing: "",
    day_of_year: "240"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 61
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "domenica",
    month_name: "agosto",
    saint: "Martirio di S. Giovanni Battista",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Rientrare è facile.", "È ricominciare a sopportare tutti", "che richiede allenamento."),
    closing: "",
    day_of_year: "241"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "lunedì",
    month_name: "agosto",
    saint: "S. Faustina",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le ferie finiscono.", "Le rotture di coglioni", "sono a tempo indeterminato."),
    closing: "",
    day_of_year: "242"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "31",
    day_of_week: "martedì",
    month_name: "agosto",
    saint: "S. Aristide",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Agosto finisce.", "La voglia di tornare indietro no."),
    closing: "",
    day_of_year: "243"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "mercoledì",
    month_name: "settembre",
    saint: "S. Egidio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Settembre.", "Si ricomincia.", "Purtroppo sul serio."),
    closing: "",
    day_of_year: "244"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 62
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "giovedì",
    month_name: "settembre",
    saint: "S. Elpidio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che arrivano preparate.", "E altre che arrivano."),
    closing: "",
    day_of_year: "245"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "venerdì",
    month_name: "settembre",
    saint: "S. Gregorio Magno",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi rifare il lavoro due volte,", "almeno la seconda", "falla come si deve."),
    closing: "",
    day_of_year: "246"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "sabato",
    month_name: "settembre",
    saint: "S. Rosalia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Fare in fretta va bene.", "Rifare tutto dopo, un po’ meno."),
    closing: "",
    day_of_year: "247"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "domenica",
    month_name: "settembre",
    saint: "S. Teresa di Calcutta",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’esperienza non evita gli errori.", "Ti fa solo riconoscere prima", "chi sta per farli."),
    closing: "",
    day_of_year: "248"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 63
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "lunedì",
    month_name: "settembre",
    saint: "S. Umberto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("C’è chi migliora con i consigli.", "E chi li considera un attacco personale."),
    closing: "",
    day_of_year: "249"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "martedì",
    month_name: "settembre",
    saint: "S. Regina",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il lunedì è tornato.", "Noi non eravamo pronti."),
    closing: "",
    day_of_year: "250"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "mercoledì",
    month_name: "settembre",
    saint: "Natività B.V. Maria",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è importante sembrare occupati.", "È importante esserlo davvero."),
    closing: "",
    day_of_year: "251"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "giovedì",
    month_name: "settembre",
    saint: "S. Sergio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi lavora bene lascia risultati.", "Gli altri lasciano spiegazioni."),
    closing: "",
    day_of_year: "252"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 64
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "venerdì",
    month_name: "settembre",
    saint: "S. Nicola da Tolentino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che parlano tanto", "perché i risultati", "hanno poco da dire."),
    closing: "",
    day_of_year: "253"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "sabato",
    month_name: "settembre",
    saint: "S. Giacinto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il pezzo sbagliato", "almeno non cerca scuse."),
    closing: "",
    day_of_year: "254"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "domenica",
    month_name: "settembre",
    saint: "Santissimo Nome di Maria",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Mara",
    quote_lines: ("A una persona capace", "di sopravvivere a tutto.", "Tranne, a quanto pare,", "tonno e melanzane."),
    closing: "Auguri, Mara!",
    day_of_year: "255"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "lunedì",
    month_name: "settembre",
    saint: "S. Giovanni Crisostomo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il comunismo funziona benissimo:", "finché a pagare", "è sempre qualcun altro."),
    closing: "",
    day_of_year: "256"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 65
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "martedì",
    month_name: "settembre",
    saint: "Esaltazione Santa Croce",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutto quello che sembra urgente", "lo è davvero.", "Spesso è solo organizzato male."),
    closing: "",
    day_of_year: "257"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "mercoledì",
    month_name: "settembre",
    saint: "B.V. Maria Addolorata",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono colleghi che ti aiutano.", "E colleghi che ti fanno apprezzare", "quelli che ti aiutano."),
    closing: "",
    day_of_year: "258"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "giovedì",
    month_name: "settembre",
    saint: "Ss. Cornelio e Cipriano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Un buon lavoro non ha bisogno", "di troppe parole.", "Un brutto lavoro sì."),
    closing: "",
    day_of_year: "259"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "venerdì",
    month_name: "settembre",
    saint: "S. Roberto Bellarmino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è questione di carattere.", "È che certa gente", "ha finito il bonus pazienza."),
    closing: "",
    day_of_year: "260"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 66
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "sabato",
    month_name: "settembre",
    saint: "S. Sofia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Alcuni problemi si risolvono.", "Altri timbrano il cartellino."),
    closing: "",
    day_of_year: "261"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "domenica",
    month_name: "settembre",
    saint: "S. Gennaro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Tre anni senza fumare.", "Una dipendenza in meno.", "Le altre le scegliamo meglio."),
    closing: "",
    day_of_year: "262"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "lunedì",
    month_name: "settembre",
    saint: "Ss. Martiri Coreani",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non porto rancore.", "Mi basta ricordarmi bene."),
    closing: "",
    day_of_year: "263"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "martedì",
    month_name: "settembre",
    saint: "S. Matteo Apostolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’autunno sta arrivando.", "Le rotture di coglioni", "non hanno mai avuto stagione."),
    closing: "",
    day_of_year: "264"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 67
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "mercoledì",
    month_name: "settembre",
    saint: "S. Maurizio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi spiegare perché è venuto male,", "forse era meglio", "farlo bene."),
    closing: "",
    day_of_year: "265"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "giovedì",
    month_name: "settembre",
    saint: "S. Pio da Pietrelcina",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("C’è sempre qualcuno", "che complica una cosa semplice", "e poi si sente indispensabile."),
    closing: "",
    day_of_year: "266"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "venerdì",
    month_name: "settembre",
    saint: "S. Pacifico",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti quelli che hanno esperienza", "hanno imparato qualcosa."),
    closing: "",
    day_of_year: "267"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "sabato",
    month_name: "settembre",
    saint: "S. Aurelia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se il pezzo è giusto", "non serve una riunione", "per convincerlo."),
    closing: "",
    day_of_year: "268"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 68
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "domenica",
    month_name: "settembre",
    saint: "Ss. Cosma e Damiano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Più una persona parla di meritocrazia,", "più conviene guardare", "come è arrivata lì."),
    closing: "",
    day_of_year: "269"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "lunedì",
    month_name: "settembre",
    saint: "S. Vincenzo de' Paoli",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è pessimismo.", "È statistica applicata", "alle persone."),
    closing: "",
    day_of_year: "270"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "martedì",
    month_name: "settembre",
    saint: "S. Venceslao",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Fare il minimo indispensabile", "è comunque troppo", "per qualcuno."),
    closing: "",
    day_of_year: "271"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "mercoledì",
    month_name: "settembre",
    saint: "Ss. Michele, Gabriele e Raffaele",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone che migliorano", "quando imparano.", "Altre quando stanno zitte."),
    closing: "",
    day_of_year: "272"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 69
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "giovedì",
    month_name: "settembre",
    saint: "S. Girolamo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Settembre è finito.", "Tre mesi alla fine dell’anno.", "Resistete."),
    closing: "",
    day_of_year: "273"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "venerdì",
    month_name: "ottobre",
    saint: "S. Teresa di Gesù Bambino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ottobre.", "Le giornate si accorciano.", "La pazienza anche."),
    closing: "",
    day_of_year: "274"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "sabato",
    month_name: "ottobre",
    saint: "Ss. Angeli Custodi",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti i problemi", "hanno bisogno di una soluzione.", "Alcuni di ferie."),
    closing: "",
    day_of_year: "275"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "domenica",
    month_name: "ottobre",
    saint: "S. Gerardo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il bello del lavoro preciso", "è che le cazzate", "si vedono subito."),
    closing: "",
    day_of_year: "276"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 70
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "lunedì",
    month_name: "ottobre",
    saint: "S. Francesco d'Assisi",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone", "che riescono a complicare", "anche quello che funziona."),
    closing: "",
    day_of_year: "277"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "martedì",
    month_name: "ottobre",
    saint: "S. Placido",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se una cosa è semplice,", "qualcuno troverà il modo", "di farla diventare una procedura."),
    closing: "",
    day_of_year: "278"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "mercoledì",
    month_name: "ottobre",
    saint: "S. Bruno",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non è che manca il tempo.", "A volte manca proprio", "la voglia di sprecarlo."),
    closing: "",
    day_of_year: "279"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "giovedì",
    month_name: "ottobre",
    saint: "B.V. Maria del Rosario",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Chi sa fare davvero", "ha meno bisogno", "di farlo sapere."),
    closing: "",
    day_of_year: "280"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 71
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "venerdì",
    month_name: "ottobre",
    saint: "S. Pelagia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema non è sbagliare.", "È avere sempre una spiegazione", "e mai una soluzione."),
    closing: "",
    day_of_year: "281"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "sabato",
    month_name: "ottobre",
    saint: "S. Dionigi",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Lanz ed Enea",
    quote_lines: ("Uno a birra.", "L’altro a gin tonic.", "L’importante è non lasciarli a secco."),
    closing: "Auguri, Lanz ed Enea.",
    day_of_year: "282"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "domenica",
    month_name: "ottobre",
    saint: "S. Daniele",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono giornate", "in cui lavorare bene", "sembra quasi una provocazione."),
    closing: "",
    day_of_year: "283"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "lunedì",
    month_name: "ottobre",
    saint: "S. Giovanni XXIII",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutto quello che luccica è oro.", "A volte è solo", "una finitura fatta bene."),
    closing: "",
    day_of_year: "284"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 72
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "martedì",
    month_name: "ottobre",
    saint: "S. Serafino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’esperienza aiuta.", "La memoria evita", "di fidarsi due volte."),
    closing: "",
    day_of_year: "285"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "mercoledì",
    month_name: "ottobre",
    saint: "S. Edoardo",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Tigre",
    quote_lines: ("Mangiare bene.", "Trombare spesso.", "Brontolare sempre."),
    closing: "Auguri, Tigre.",
    day_of_year: "286"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "giovedì",
    month_name: "ottobre",
    saint: "S. Callisto",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Davide",
    quote_lines: ("Il lavoro lo stanca.", "I racchettoni lo distraggono.", "Il sushi lo motiva.", "Il conto lo preoccupa."),
    closing: "Auguri, Davide.",
    day_of_year: "287"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "venerdì",
    month_name: "ottobre",
    saint: "S. Teresa d'Avila",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono colleghi", "che ti fanno venire voglia", "di lavorare da solo."),
    closing: "",
    day_of_year: "288"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 73
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "sabato",
    month_name: "ottobre",
    saint: "S. Edvige",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve essere fenomeni.", "Basta non essere", "un problema aggiuntivo."),
    closing: "",
    day_of_year: "289"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "domenica",
    month_name: "ottobre",
    saint: "S. Ignazio d'Antiochia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Quando uno dice", "‘ci penso io’,", "controlla comunque."),
    closing: "",
    day_of_year: "290"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "lunedì",
    month_name: "ottobre",
    saint: "S. Luca Evangelista",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il comunismo è generosità.", "Soprattutto", "con la roba degli altri."),
    closing: "",
    day_of_year: "291"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "martedì",
    month_name: "ottobre",
    saint: "S. Paolo della Croce",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutti quelli che sembrano tranquilli", "lo sono davvero.", "Alcuni hanno solo rinunciato a spiegare."),
    closing: "",
    day_of_year: "292"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 74
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "mercoledì",
    month_name: "ottobre",
    saint: "S. Irene",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi chiedere", "se il pezzo va bene,", "probabilmente lo sai già."),
    closing: "",
    day_of_year: "293"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "giovedì",
    month_name: "ottobre",
    saint: "S. Orsola",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone", "che aggiungono valore.", "Altre aggiungono lavoro."),
    closing: "",
    day_of_year: "294"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "venerdì",
    month_name: "ottobre",
    saint: "S. Giovanni Paolo II",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Essere pazienti è importante.", "Scegliere con chi esserlo, di più."),
    closing: "",
    day_of_year: "295"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "sabato",
    month_name: "ottobre",
    saint: "S. Giovanni da Capestrano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema delle cattive idee", "è che spesso", "arrivano dette con sicurezza."),
    closing: "",
    day_of_year: "296"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 75
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "domenica",
    month_name: "ottobre",
    saint: "S. Antonio Maria Claret",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve parlare forte.", "Se hai ragione", "basta molto meno."),
    closing: "",
    day_of_year: "297"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "lunedì",
    month_name: "ottobre",
    saint: "S. Crispino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il silenzio è gratis.", "Peccato che pochi lo usino."),
    closing: "",
    day_of_year: "298"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "martedì",
    month_name: "ottobre",
    saint: "S. Evaristo",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "a me",
    quote_lines: ("L’età porta esperienza.", "L’esperienza toglie pazienza."),
    closing: "Auguri a me.",
    day_of_year: "299"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "mercoledì",
    month_name: "ottobre",
    saint: "S. Fiorenzo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Un anno in più.", "Stessa faccia.", "Meno tolleranza."),
    closing: "",
    day_of_year: "300"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 76
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "giovedì",
    month_name: "ottobre",
    saint: "Ss. Simone e Giuda",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Quando hai poca pazienza", "il vantaggio è che", "la gente lo capisce prima."),
    closing: "",
    day_of_year: "301"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "venerdì",
    month_name: "ottobre",
    saint: "S. Ermelinda",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono giornate produttive.", "E giornate in cui", "è già tanto non peggiorare le cose."),
    closing: "",
    day_of_year: "302"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "sabato",
    month_name: "ottobre",
    saint: "S. Germano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Domani Halloween.", "Finalmente certa gente", "può uscire senza travestirsi."),
    closing: "",
    day_of_year: "303"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "31",
    day_of_week: "domenica",
    month_name: "ottobre",
    saint: "S. Quintino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Halloween.", "Mostri, fantasmi e facce inquietanti.", "Praticamente un giorno normale in reparto."),
    closing: "",
    day_of_year: "304"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 77
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "lunedì",
    month_name: "novembre",
    saint: "Tutti i Santi",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ognissanti.", "Per qualcuno", "serve davvero un miracolo."),
    closing: "",
    day_of_year: "305"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "martedì",
    month_name: "novembre",
    saint: "Commemorazione dei Defunti",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Certe assenze", "fanno ancora rumore."),
    closing: "",
    day_of_year: "306"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "mercoledì",
    month_name: "novembre",
    saint: "S. Martino de Porres",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono persone affidabili.", "E persone che ti insegnano", "a controllare due volte."),
    closing: "",
    day_of_year: "307"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "giovedì",
    month_name: "novembre",
    saint: "S. Carlo Borromeo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Un Paese si difende", "anche ricordando chi l’ha fatto", "prima di noi.", "4 novembre."),
    closing: "",
    day_of_year: "308"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 78
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "venerdì",
    month_name: "novembre",
    saint: "S. Zaccaria",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il problema non è la fretta.", "È la fretta", "nelle mani sbagliate."),
    closing: "",
    day_of_year: "309"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "sabato",
    month_name: "novembre",
    saint: "S. Leonardo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Certe persone non lavorano male.", "Riescono proprio", "a complicare il concetto."),
    closing: "",
    day_of_year: "310"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "domenica",
    month_name: "novembre",
    saint: "S. Ernesto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Essere precisi", "non significa essere lenti.", "Significa evitare di rifare tutto."),
    closing: "",
    day_of_year: "311"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "lunedì",
    month_name: "novembre",
    saint: "S. Goffredo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono colleghi", "che non risolvono problemi.", "Li tengono semplicemente in vita."),
    closing: "",
    day_of_year: "312"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 79
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "martedì",
    month_name: "novembre",
    saint: "Dedicazione Basilica Lateranense",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Quando tutti hanno un’opinione,", "di solito manca qualcuno", "che sappia davvero cosa fare."),
    closing: "",
    day_of_year: "313"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "mercoledì",
    month_name: "novembre",
    saint: "S. Leone Magno",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le tolleranze hanno un pregio:", "non ascoltano opinioni."),
    closing: "",
    day_of_year: "314"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "giovedì",
    month_name: "novembre",
    saint: "S. Martino di Tours",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’errore è umano.", "Insistere richiede talento."),
    closing: "",
    day_of_year: "315"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "venerdì",
    month_name: "novembre",
    saint: "S. Renato",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve essere i migliori.", "Basta non essere", "quelli da aspettare sempre."),
    closing: "",
    day_of_year: "316"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 80
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "sabato",
    month_name: "novembre",
    saint: "S. Diego",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Più impari il mestiere,", "meno ti impressionano", "quelli che parlano tanto."),
    closing: "",
    day_of_year: "317"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "domenica",
    month_name: "novembre",
    saint: "S. Giocondo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il venerdì ha un pregio:", "prima o poi", "finisce anche questa settimana."),
    closing: "",
    day_of_year: "318"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "lunedì",
    month_name: "novembre",
    saint: "S. Alberto Magno",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Francesca",
    quote_lines: ("Gli anni passano.", "La pazienza cambia.", "Il carattere resta."),
    closing: "Auguri, Francesca.",
    day_of_year: "319"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "martedì",
    month_name: "novembre",
    saint: "S. Margherita di Scozia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il lavoro sarebbe anche bello.", "È tutto il contorno", "che rovina l’esperienza."),
    closing: "",
    day_of_year: "320"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 81
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "mercoledì",
    month_name: "novembre",
    saint: "S. Elisabetta d'Ungheria",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se per spiegare una cosa semplice", "servono venti minuti,", "qualcosa è già andato storto."),
    closing: "",
    day_of_year: "321"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "giovedì",
    month_name: "novembre",
    saint: "Dedicazione Basiliche Pietro e Paolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il comunismo ha sempre una soluzione:", "dividere meglio", "quello che hanno prodotto gli altri."),
    closing: "",
    day_of_year: "322"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "venerdì",
    month_name: "novembre",
    saint: "S. Fausto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Certe persone meritano fiducia.", "Altre il controllo al 100%."),
    closing: "",
    day_of_year: "323"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "sabato",
    month_name: "novembre",
    saint: "S. Benigno",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Fare bene il proprio lavoro", "è già una bella presentazione."),
    closing: "",
    day_of_year: "324"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 82
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "domenica",
    month_name: "novembre",
    saint: "Presentazione B.V. Maria",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono giorni", "in cui una scrivania vuota", "mette di buon umore."),
    closing: "",
    day_of_year: "325"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "lunedì",
    month_name: "novembre",
    saint: "S. Cecilia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Lascia parlare la gente.", "Prima o poi", "si presenta da sola."),
    closing: "",
    day_of_year: "326"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "martedì",
    month_name: "novembre",
    saint: "S. Clemente",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il freddo arriva.", "La gente pesante", "era già qui."),
    closing: "",
    day_of_year: "327"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "mercoledì",
    month_name: "novembre",
    saint: "S. Flora",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Quando il problema", "ha sempre lo stesso nome,", "forse non è più un caso."),
    closing: "",
    day_of_year: "328"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 83
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "giovedì",
    month_name: "novembre",
    saint: "S. Caterina d'Alessandria",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il rispetto non è una parola.", "È quello che rimane", "quando nessuno ti obbliga."),
    closing: "",
    day_of_year: "329"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "venerdì",
    month_name: "novembre",
    saint: "S. Corrado",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il talento serve.", "Ma senza testa", "diventa solo un rischio."),
    closing: "",
    day_of_year: "330"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "sabato",
    month_name: "novembre",
    saint: "S. Virgilio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Ci sono colleghi", "che risolvono problemi.", "E colleghi che danno materiale ai primi."),
    closing: "",
    day_of_year: "331"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "domenica",
    month_name: "novembre",
    saint: "S. Giacomo della Marca",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Essere bravi è utile.", "Essere affidabili", "molto di più."),
    closing: "",
    day_of_year: "332"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 84
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "lunedì",
    month_name: "novembre",
    saint: "S. Saturnino",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve essere d’accordo.", "Basta non essere coglioni."),
    closing: "",
    day_of_year: "333"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "martedì",
    month_name: "novembre",
    saint: "S. Andrea Apostolo",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Novembre è finito.", "Adesso arriva il mese", "delle cene, dei regali e delle balle."),
    closing: "",
    day_of_year: "334"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "1",
    day_of_week: "mercoledì",
    month_name: "dicembre",
    saint: "S. Ansano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Dicembre.", "Il mese in cui la dieta", "diventa un problema di gennaio."),
    closing: "",
    day_of_year: "335"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "2",
    day_of_week: "giovedì",
    month_name: "dicembre",
    saint: "S. Bibiana",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Dicembre è iniziato.", "Adesso fingiamo tutti", "di essere più buoni."),
    closing: "",
    day_of_year: "336"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 85
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "3",
    day_of_week: "venerdì",
    month_name: "dicembre",
    saint: "S. Francesco Saverio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("I soldi non fanno la felicità.", "Ma aiutano parecchio", "a scegliere dove essere tristi."),
    closing: "",
    day_of_year: "337"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "4",
    day_of_week: "sabato",
    month_name: "dicembre",
    saint: "S. Barbara",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se la vita ti chiude una porta,", "controlla che non fosse", "semplicemente da tirare."),
    closing: "",
    day_of_year: "338"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "5",
    day_of_week: "domenica",
    month_name: "dicembre",
    saint: "S. Saba",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il segreto per una vita felice?", "Fai come il cane:", "se ti piace, mangialo o giocaci.", "Altrimenti pisciaci sopra e passa oltre."),
    closing: "",
    day_of_year: "339"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "6",
    day_of_week: "lunedì",
    month_name: "dicembre",
    saint: "S. Nicola di Bari",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non ho bisogno di terapia.", "Ho bisogno", "di soldi e ferie."),
    closing: "",
    day_of_year: "340"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 86
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "7",
    day_of_week: "martedì",
    month_name: "dicembre",
    saint: "S. Ambrogio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Le persone cambiano.", "Soprattutto quando", "tocca pagare."),
    closing: "",
    day_of_year: "341"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "8",
    day_of_week: "mercoledì",
    month_name: "dicembre",
    saint: "Immacolata Concezione",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Immacolata.", "Oggi siamo tutti più puri.", "Domani si torna normali."),
    closing: "",
    day_of_year: "342"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "9",
    day_of_week: "giovedì",
    month_name: "dicembre",
    saint: "S. Siro",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non inseguire chi se ne va.", "Potrebbe rallentare."),
    closing: "",
    day_of_year: "343"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "10",
    day_of_week: "venerdì",
    month_name: "dicembre",
    saint: "B.V. Maria di Loreto",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La felicità è fatta di piccole cose.", "Tipo una bottiglia grande."),
    closing: "",
    day_of_year: "344"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 87
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "11",
    day_of_week: "sabato",
    month_name: "dicembre",
    saint: "S. Damaso",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("A volte bisogna essere maturi.", "Altre volte basta", "ordinare un altro gin tonic."),
    closing: "",
    day_of_year: "345"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "12",
    day_of_week: "domenica",
    month_name: "dicembre",
    saint: "B.V. Maria di Guadalupe",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Fede",
    quote_lines: ("Poca pazienza.", "Gran cuore.", "Dice quello che pensa,", "ma quando serve c’è sempre."),
    closing: "Buon compleanno, Fede.",
    day_of_year: "346"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "13",
    day_of_week: "lunedì",
    month_name: "dicembre",
    saint: "S. Lucia",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Mangiare bene è importante.", "Bere bene", "aiuta a dimenticare il resto."),
    closing: "",
    day_of_year: "347"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "14",
    day_of_week: "martedì",
    month_name: "dicembre",
    saint: "S. Giovanni della Croce",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il comunismo a Natale", "è perfetto:", "i regali li comprano gli altri", "e poi si dividono."),
    closing: "",
    day_of_year: "348"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 88
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "15",
    day_of_week: "mercoledì",
    month_name: "dicembre",
    saint: "S. Valeriano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("La famiglia è bellissima.", "Soprattutto quando", "ognuno torna a casa sua."),
    closing: "",
    day_of_year: "349"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "16",
    day_of_week: "giovedì",
    month_name: "dicembre",
    saint: "S. Adelaide",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non tutto quello che perdi", "va ritrovato.", "A volte hai avuto culo."),
    closing: "",
    day_of_year: "350"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "17",
    day_of_week: "venerdì",
    month_name: "dicembre",
    saint: "S. Lazzaro",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Gardenghi",
    quote_lines: ("Sei riuscito ad arrivare sveglio", "fino al tuo compleanno?", "E senza farti arrestare?", "Allora auguri, Gardenghi."),
    closing: "",
    day_of_year: "351"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "18",
    day_of_week: "sabato",
    month_name: "dicembre",
    saint: "S. Graziano",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il Natale porta tutti più vicini.", "Ed è proprio questo", "il problema."),
    closing: "",
    day_of_year: "352"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 89
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "19",
    day_of_week: "domenica",
    month_name: "dicembre",
    saint: "S. Dario",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non serve avere tutto.", "Basta avere abbastanza", "da non dover chiedere niente."),
    closing: "",
    day_of_year: "353"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "20",
    day_of_week: "lunedì",
    month_name: "dicembre",
    saint: "S. Liberato",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il vino non risolve i problemi.", "Ma neanche l’acqua", "ha mai fatto miracoli."),
    closing: "",
    day_of_year: "354"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "21",
    day_of_week: "martedì",
    month_name: "dicembre",
    saint: "S. Pietro Canisio",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("L’inverno è iniziato.", "Adesso possiamo", "lamentarci del freddo."),
    closing: "",
    day_of_year: "355"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "22",
    day_of_week: "mercoledì",
    month_name: "dicembre",
    saint: "S. Francesca Saverio Cabrini",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se devi fare un regalo utile,", "regala soldi.", "Almeno non sbagli."),
    closing: "",
    day_of_year: "356"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 90
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "23",
    day_of_week: "giovedì",
    month_name: "dicembre",
    saint: "S. Giovanni da Kety",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Domani ferie.", "Qualunque problema", "può diventare un problema di gennaio."),
    closing: "",
    day_of_year: "357"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "24",
    day_of_week: "venerdì",
    month_name: "dicembre",
    saint: "S. Adele",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Se è urgente,", "lo sarà anche dopo Natale."),
    closing: "",
    day_of_year: "358"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "25",
    day_of_week: "sabato",
    month_name: "dicembre",
    saint: "Natale del Signore",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Natale.", "Mangiate, bevete", "e non rompete i coglioni."),
    closing: "Buon Natale.",
    day_of_year: "359"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "26",
    day_of_week: "domenica",
    month_name: "dicembre",
    saint: "S. Stefano",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Oggi si recupera", "dalla fatica", "di aver mangiato troppo."),
    closing: "",
    day_of_year: "360"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 91
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "27",
    day_of_week: "lunedì",
    month_name: "dicembre",
    saint: "S. Giovanni Evangelista",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Non disturbare.", "Stiamo facendo pratica", "con il non fare niente."),
    closing: "",
    day_of_year: "361"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "28",
    day_of_week: "martedì",
    month_name: "dicembre",
    saint: "Ss. Innocenti Martiri",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Il lavoro può aspettare.", "Noi stiamo benissimo così."),
    closing: "",
    day_of_year: "362"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "29",
    day_of_week: "mercoledì",
    month_name: "dicembre",
    saint: "S. Tommaso Becket",
    is_ferie: false,
    is_birthday: true,
    birthday_person: "Conti",
    quote_lines: ("Ti auguro tanta salute.", "Ma qualche giorno di ferie in più", "non mi dispiacerebbe."),
    closing: "Buon compleanno, Conti.",
    day_of_year: "363"
  )]],
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "30",
    day_of_week: "giovedì",
    month_name: "dicembre",
    saint: "S. Eugenio",
    is_ferie: true,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("Domani finisce l’anno.", "Le cazzate no."),
    closing: "",
    day_of_year: "364"
  )]],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
#pagebreak()

// Page 92
#grid(
  columns: (105mm, 105mm),
  rows: (148.5mm, 148.5mm),
  box(width: 105mm, height: 148.5mm)[#place(center + horizon)[#render_leaf(
    day_num: "31",
    day_of_week: "venerdì",
    month_name: "dicembre",
    saint: "S. Silvestro I Papa",
    is_ferie: false,
    is_birthday: false,
    birthday_person: "",
    quote_lines: ("365 giorni.", "Qualche soddisfazione.", "Parecchie cazzate.", "E abbastanza motivi per rifarlo."),
    closing: "Buon 2028 Stronzi.",
    day_of_year: "365"
  )]],
  box(width: 105mm, height: 148.5mm)[],
  box(width: 105mm, height: 148.5mm)[],
  box(width: 105mm, height: 148.5mm)[],
)
#place(top + left, dx: 105mm, line(start: (0mm, 0mm), end: (0mm, 297mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dy: 148.5mm, line(start: (0mm, 0mm), end: (210mm, 0mm), stroke: (paint: rgb("#bbbbbb"), dash: "dashed", thickness: 0.45pt)))
#place(top + left, dx: 105mm, dy: 148.5mm)[#place(center + horizon)[#box(fill: white, inset: 1.2mm, radius: 1.5mm, stroke: 0.35pt + rgb("#cccccc"))[#text(size: 5.5pt, fill: rgb("#666666"), font: "Georgia", weight: "bold")[✂ TAGLIO SINGOLO]]]]
