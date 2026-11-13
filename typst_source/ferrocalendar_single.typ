// FerroCalendar 2027 - Formato Singolo (1 giorno per pagina A4)
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

// Day 1
#render_leaf_single(
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
)
#pagebreak()

// Day 2
#render_leaf_single(
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
)
#pagebreak()

// Day 3
#render_leaf_single(
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
)
#pagebreak()

// Day 4
#render_leaf_single(
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
)
#pagebreak()

// Day 5
#render_leaf_single(
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
)
#pagebreak()

// Day 6
#render_leaf_single(
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
)
#pagebreak()

// Day 7
#render_leaf_single(
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
)
#pagebreak()

// Day 8
#render_leaf_single(
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
)
#pagebreak()

// Day 9
#render_leaf_single(
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
)
#pagebreak()

// Day 10
#render_leaf_single(
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
)
#pagebreak()

// Day 11
#render_leaf_single(
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
)
#pagebreak()

// Day 12
#render_leaf_single(
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
)
#pagebreak()

// Day 13
#render_leaf_single(
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
)
#pagebreak()

// Day 14
#render_leaf_single(
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
)
#pagebreak()

// Day 15
#render_leaf_single(
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
)
#pagebreak()

// Day 16
#render_leaf_single(
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
)
#pagebreak()

// Day 17
#render_leaf_single(
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
)
#pagebreak()

// Day 18
#render_leaf_single(
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
)
#pagebreak()

// Day 19
#render_leaf_single(
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
)
#pagebreak()

// Day 20
#render_leaf_single(
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
)
#pagebreak()

// Day 21
#render_leaf_single(
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
)
#pagebreak()

// Day 22
#render_leaf_single(
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
)
#pagebreak()

// Day 23
#render_leaf_single(
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
)
#pagebreak()

// Day 24
#render_leaf_single(
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
)
#pagebreak()

// Day 25
#render_leaf_single(
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
)
#pagebreak()

// Day 26
#render_leaf_single(
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
)
#pagebreak()

// Day 27
#render_leaf_single(
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
)
#pagebreak()

// Day 28
#render_leaf_single(
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
)
#pagebreak()

// Day 29
#render_leaf_single(
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
)
#pagebreak()

// Day 30
#render_leaf_single(
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
)
#pagebreak()

// Day 31
#render_leaf_single(
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
)
#pagebreak()

// Day 32
#render_leaf_single(
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
)
#pagebreak()

// Day 33
#render_leaf_single(
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
)
#pagebreak()

// Day 34
#render_leaf_single(
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
)
#pagebreak()

// Day 35
#render_leaf_single(
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
)
#pagebreak()

// Day 36
#render_leaf_single(
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
)
#pagebreak()

// Day 37
#render_leaf_single(
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
)
#pagebreak()

// Day 38
#render_leaf_single(
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
)
#pagebreak()

// Day 39
#render_leaf_single(
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
)
#pagebreak()

// Day 40
#render_leaf_single(
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
)
#pagebreak()

// Day 41
#render_leaf_single(
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
)
#pagebreak()

// Day 42
#render_leaf_single(
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
)
#pagebreak()

// Day 43
#render_leaf_single(
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
)
#pagebreak()

// Day 44
#render_leaf_single(
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
)
#pagebreak()

// Day 45
#render_leaf_single(
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
)
#pagebreak()

// Day 46
#render_leaf_single(
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
)
#pagebreak()

// Day 47
#render_leaf_single(
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
)
#pagebreak()

// Day 48
#render_leaf_single(
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
)
#pagebreak()

// Day 49
#render_leaf_single(
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
)
#pagebreak()

// Day 50
#render_leaf_single(
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
)
#pagebreak()

// Day 51
#render_leaf_single(
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
)
#pagebreak()

// Day 52
#render_leaf_single(
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
)
#pagebreak()

// Day 53
#render_leaf_single(
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
)
#pagebreak()

// Day 54
#render_leaf_single(
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
)
#pagebreak()

// Day 55
#render_leaf_single(
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
)
#pagebreak()

// Day 56
#render_leaf_single(
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
)
#pagebreak()

// Day 57
#render_leaf_single(
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
)
#pagebreak()

// Day 58
#render_leaf_single(
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
)
#pagebreak()

// Day 59
#render_leaf_single(
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
)
#pagebreak()

// Day 60
#render_leaf_single(
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
)
#pagebreak()

// Day 61
#render_leaf_single(
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
)
#pagebreak()

// Day 62
#render_leaf_single(
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
)
#pagebreak()

// Day 63
#render_leaf_single(
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
)
#pagebreak()

// Day 64
#render_leaf_single(
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
)
#pagebreak()

// Day 65
#render_leaf_single(
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
)
#pagebreak()

// Day 66
#render_leaf_single(
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
)
#pagebreak()

// Day 67
#render_leaf_single(
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
)
#pagebreak()

// Day 68
#render_leaf_single(
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
)
#pagebreak()

// Day 69
#render_leaf_single(
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
)
#pagebreak()

// Day 70
#render_leaf_single(
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
)
#pagebreak()

// Day 71
#render_leaf_single(
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
)
#pagebreak()

// Day 72
#render_leaf_single(
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
)
#pagebreak()

// Day 73
#render_leaf_single(
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
)
#pagebreak()

// Day 74
#render_leaf_single(
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
)
#pagebreak()

// Day 75
#render_leaf_single(
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
)
#pagebreak()

// Day 76
#render_leaf_single(
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
)
#pagebreak()

// Day 77
#render_leaf_single(
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
)
#pagebreak()

// Day 78
#render_leaf_single(
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
)
#pagebreak()

// Day 79
#render_leaf_single(
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
)
#pagebreak()

// Day 80
#render_leaf_single(
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
)
#pagebreak()

// Day 81
#render_leaf_single(
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
)
#pagebreak()

// Day 82
#render_leaf_single(
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
)
#pagebreak()

// Day 83
#render_leaf_single(
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
)
#pagebreak()

// Day 84
#render_leaf_single(
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
)
#pagebreak()

// Day 85
#render_leaf_single(
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
)
#pagebreak()

// Day 86
#render_leaf_single(
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
)
#pagebreak()

// Day 87
#render_leaf_single(
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
)
#pagebreak()

// Day 88
#render_leaf_single(
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
)
#pagebreak()

// Day 89
#render_leaf_single(
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
)
#pagebreak()

// Day 90
#render_leaf_single(
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
)
#pagebreak()

// Day 91
#render_leaf_single(
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
)
#pagebreak()

// Day 92
#render_leaf_single(
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
)
#pagebreak()

// Day 93
#render_leaf_single(
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
)
#pagebreak()

// Day 94
#render_leaf_single(
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
)
#pagebreak()

// Day 95
#render_leaf_single(
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
)
#pagebreak()

// Day 96
#render_leaf_single(
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
)
#pagebreak()

// Day 97
#render_leaf_single(
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
)
#pagebreak()

// Day 98
#render_leaf_single(
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
)
#pagebreak()

// Day 99
#render_leaf_single(
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
)
#pagebreak()

// Day 100
#render_leaf_single(
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
)
#pagebreak()

// Day 101
#render_leaf_single(
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
)
#pagebreak()

// Day 102
#render_leaf_single(
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
)
#pagebreak()

// Day 103
#render_leaf_single(
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
)
#pagebreak()

// Day 104
#render_leaf_single(
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
)
#pagebreak()

// Day 105
#render_leaf_single(
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
)
#pagebreak()

// Day 106
#render_leaf_single(
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
)
#pagebreak()

// Day 107
#render_leaf_single(
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
)
#pagebreak()

// Day 108
#render_leaf_single(
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
)
#pagebreak()

// Day 109
#render_leaf_single(
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
)
#pagebreak()

// Day 110
#render_leaf_single(
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
)
#pagebreak()

// Day 111
#render_leaf_single(
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
)
#pagebreak()

// Day 112
#render_leaf_single(
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
)
#pagebreak()

// Day 113
#render_leaf_single(
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
)
#pagebreak()

// Day 114
#render_leaf_single(
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
)
#pagebreak()

// Day 115
#render_leaf_single(
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
)
#pagebreak()

// Day 116
#render_leaf_single(
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
)
#pagebreak()

// Day 117
#render_leaf_single(
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
)
#pagebreak()

// Day 118
#render_leaf_single(
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
)
#pagebreak()

// Day 119
#render_leaf_single(
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
)
#pagebreak()

// Day 120
#render_leaf_single(
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
)
#pagebreak()

// Day 121
#render_leaf_single(
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
)
#pagebreak()

// Day 122
#render_leaf_single(
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
)
#pagebreak()

// Day 123
#render_leaf_single(
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
)
#pagebreak()

// Day 124
#render_leaf_single(
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
)
#pagebreak()

// Day 125
#render_leaf_single(
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
)
#pagebreak()

// Day 126
#render_leaf_single(
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
)
#pagebreak()

// Day 127
#render_leaf_single(
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
)
#pagebreak()

// Day 128
#render_leaf_single(
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
)
#pagebreak()

// Day 129
#render_leaf_single(
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
)
#pagebreak()

// Day 130
#render_leaf_single(
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
)
#pagebreak()

// Day 131
#render_leaf_single(
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
)
#pagebreak()

// Day 132
#render_leaf_single(
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
)
#pagebreak()

// Day 133
#render_leaf_single(
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
)
#pagebreak()

// Day 134
#render_leaf_single(
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
)
#pagebreak()

// Day 135
#render_leaf_single(
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
)
#pagebreak()

// Day 136
#render_leaf_single(
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
)
#pagebreak()

// Day 137
#render_leaf_single(
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
)
#pagebreak()

// Day 138
#render_leaf_single(
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
)
#pagebreak()

// Day 139
#render_leaf_single(
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
)
#pagebreak()

// Day 140
#render_leaf_single(
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
)
#pagebreak()

// Day 141
#render_leaf_single(
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
)
#pagebreak()

// Day 142
#render_leaf_single(
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
)
#pagebreak()

// Day 143
#render_leaf_single(
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
)
#pagebreak()

// Day 144
#render_leaf_single(
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
)
#pagebreak()

// Day 145
#render_leaf_single(
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
)
#pagebreak()

// Day 146
#render_leaf_single(
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
)
#pagebreak()

// Day 147
#render_leaf_single(
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
)
#pagebreak()

// Day 148
#render_leaf_single(
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
)
#pagebreak()

// Day 149
#render_leaf_single(
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
)
#pagebreak()

// Day 150
#render_leaf_single(
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
)
#pagebreak()

// Day 151
#render_leaf_single(
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
)
#pagebreak()

// Day 152
#render_leaf_single(
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
)
#pagebreak()

// Day 153
#render_leaf_single(
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
)
#pagebreak()

// Day 154
#render_leaf_single(
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
)
#pagebreak()

// Day 155
#render_leaf_single(
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
)
#pagebreak()

// Day 156
#render_leaf_single(
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
)
#pagebreak()

// Day 157
#render_leaf_single(
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
)
#pagebreak()

// Day 158
#render_leaf_single(
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
)
#pagebreak()

// Day 159
#render_leaf_single(
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
)
#pagebreak()

// Day 160
#render_leaf_single(
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
)
#pagebreak()

// Day 161
#render_leaf_single(
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
)
#pagebreak()

// Day 162
#render_leaf_single(
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
)
#pagebreak()

// Day 163
#render_leaf_single(
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
)
#pagebreak()

// Day 164
#render_leaf_single(
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
)
#pagebreak()

// Day 165
#render_leaf_single(
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
)
#pagebreak()

// Day 166
#render_leaf_single(
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
)
#pagebreak()

// Day 167
#render_leaf_single(
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
)
#pagebreak()

// Day 168
#render_leaf_single(
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
)
#pagebreak()

// Day 169
#render_leaf_single(
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
)
#pagebreak()

// Day 170
#render_leaf_single(
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
)
#pagebreak()

// Day 171
#render_leaf_single(
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
)
#pagebreak()

// Day 172
#render_leaf_single(
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
)
#pagebreak()

// Day 173
#render_leaf_single(
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
)
#pagebreak()

// Day 174
#render_leaf_single(
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
)
#pagebreak()

// Day 175
#render_leaf_single(
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
)
#pagebreak()

// Day 176
#render_leaf_single(
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
)
#pagebreak()

// Day 177
#render_leaf_single(
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
)
#pagebreak()

// Day 178
#render_leaf_single(
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
)
#pagebreak()

// Day 179
#render_leaf_single(
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
)
#pagebreak()

// Day 180
#render_leaf_single(
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
)
#pagebreak()

// Day 181
#render_leaf_single(
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
)
#pagebreak()

// Day 182
#render_leaf_single(
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
)
#pagebreak()

// Day 183
#render_leaf_single(
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
)
#pagebreak()

// Day 184
#render_leaf_single(
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
)
#pagebreak()

// Day 185
#render_leaf_single(
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
)
#pagebreak()

// Day 186
#render_leaf_single(
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
)
#pagebreak()

// Day 187
#render_leaf_single(
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
)
#pagebreak()

// Day 188
#render_leaf_single(
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
)
#pagebreak()

// Day 189
#render_leaf_single(
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
)
#pagebreak()

// Day 190
#render_leaf_single(
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
)
#pagebreak()

// Day 191
#render_leaf_single(
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
)
#pagebreak()

// Day 192
#render_leaf_single(
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
)
#pagebreak()

// Day 193
#render_leaf_single(
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
)
#pagebreak()

// Day 194
#render_leaf_single(
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
)
#pagebreak()

// Day 195
#render_leaf_single(
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
)
#pagebreak()

// Day 196
#render_leaf_single(
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
)
#pagebreak()

// Day 197
#render_leaf_single(
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
)
#pagebreak()

// Day 198
#render_leaf_single(
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
)
#pagebreak()

// Day 199
#render_leaf_single(
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
)
#pagebreak()

// Day 200
#render_leaf_single(
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
)
#pagebreak()

// Day 201
#render_leaf_single(
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
)
#pagebreak()

// Day 202
#render_leaf_single(
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
)
#pagebreak()

// Day 203
#render_leaf_single(
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
)
#pagebreak()

// Day 204
#render_leaf_single(
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
)
#pagebreak()

// Day 205
#render_leaf_single(
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
)
#pagebreak()

// Day 206
#render_leaf_single(
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
)
#pagebreak()

// Day 207
#render_leaf_single(
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
)
#pagebreak()

// Day 208
#render_leaf_single(
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
)
#pagebreak()

// Day 209
#render_leaf_single(
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
)
#pagebreak()

// Day 210
#render_leaf_single(
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
)
#pagebreak()

// Day 211
#render_leaf_single(
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
)
#pagebreak()

// Day 212
#render_leaf_single(
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
)
#pagebreak()

// Day 213
#render_leaf_single(
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
)
#pagebreak()

// Day 214
#render_leaf_single(
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
)
#pagebreak()

// Day 215
#render_leaf_single(
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
)
#pagebreak()

// Day 216
#render_leaf_single(
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
)
#pagebreak()

// Day 217
#render_leaf_single(
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
)
#pagebreak()

// Day 218
#render_leaf_single(
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
)
#pagebreak()

// Day 219
#render_leaf_single(
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
)
#pagebreak()

// Day 220
#render_leaf_single(
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
)
#pagebreak()

// Day 221
#render_leaf_single(
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
)
#pagebreak()

// Day 222
#render_leaf_single(
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
)
#pagebreak()

// Day 223
#render_leaf_single(
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
)
#pagebreak()

// Day 224
#render_leaf_single(
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
)
#pagebreak()

// Day 225
#render_leaf_single(
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
)
#pagebreak()

// Day 226
#render_leaf_single(
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
)
#pagebreak()

// Day 227
#render_leaf_single(
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
)
#pagebreak()

// Day 228
#render_leaf_single(
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
)
#pagebreak()

// Day 229
#render_leaf_single(
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
)
#pagebreak()

// Day 230
#render_leaf_single(
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
)
#pagebreak()

// Day 231
#render_leaf_single(
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
)
#pagebreak()

// Day 232
#render_leaf_single(
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
)
#pagebreak()

// Day 233
#render_leaf_single(
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
)
#pagebreak()

// Day 234
#render_leaf_single(
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
)
#pagebreak()

// Day 235
#render_leaf_single(
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
)
#pagebreak()

// Day 236
#render_leaf_single(
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
)
#pagebreak()

// Day 237
#render_leaf_single(
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
)
#pagebreak()

// Day 238
#render_leaf_single(
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
)
#pagebreak()

// Day 239
#render_leaf_single(
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
)
#pagebreak()

// Day 240
#render_leaf_single(
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
)
#pagebreak()

// Day 241
#render_leaf_single(
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
)
#pagebreak()

// Day 242
#render_leaf_single(
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
)
#pagebreak()

// Day 243
#render_leaf_single(
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
)
#pagebreak()

// Day 244
#render_leaf_single(
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
)
#pagebreak()

// Day 245
#render_leaf_single(
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
)
#pagebreak()

// Day 246
#render_leaf_single(
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
)
#pagebreak()

// Day 247
#render_leaf_single(
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
)
#pagebreak()

// Day 248
#render_leaf_single(
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
)
#pagebreak()

// Day 249
#render_leaf_single(
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
)
#pagebreak()

// Day 250
#render_leaf_single(
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
)
#pagebreak()

// Day 251
#render_leaf_single(
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
)
#pagebreak()

// Day 252
#render_leaf_single(
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
)
#pagebreak()

// Day 253
#render_leaf_single(
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
)
#pagebreak()

// Day 254
#render_leaf_single(
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
)
#pagebreak()

// Day 255
#render_leaf_single(
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
)
#pagebreak()

// Day 256
#render_leaf_single(
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
)
#pagebreak()

// Day 257
#render_leaf_single(
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
)
#pagebreak()

// Day 258
#render_leaf_single(
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
)
#pagebreak()

// Day 259
#render_leaf_single(
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
)
#pagebreak()

// Day 260
#render_leaf_single(
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
)
#pagebreak()

// Day 261
#render_leaf_single(
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
)
#pagebreak()

// Day 262
#render_leaf_single(
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
)
#pagebreak()

// Day 263
#render_leaf_single(
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
)
#pagebreak()

// Day 264
#render_leaf_single(
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
)
#pagebreak()

// Day 265
#render_leaf_single(
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
)
#pagebreak()

// Day 266
#render_leaf_single(
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
)
#pagebreak()

// Day 267
#render_leaf_single(
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
)
#pagebreak()

// Day 268
#render_leaf_single(
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
)
#pagebreak()

// Day 269
#render_leaf_single(
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
)
#pagebreak()

// Day 270
#render_leaf_single(
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
)
#pagebreak()

// Day 271
#render_leaf_single(
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
)
#pagebreak()

// Day 272
#render_leaf_single(
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
)
#pagebreak()

// Day 273
#render_leaf_single(
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
)
#pagebreak()

// Day 274
#render_leaf_single(
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
)
#pagebreak()

// Day 275
#render_leaf_single(
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
)
#pagebreak()

// Day 276
#render_leaf_single(
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
)
#pagebreak()

// Day 277
#render_leaf_single(
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
)
#pagebreak()

// Day 278
#render_leaf_single(
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
)
#pagebreak()

// Day 279
#render_leaf_single(
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
)
#pagebreak()

// Day 280
#render_leaf_single(
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
)
#pagebreak()

// Day 281
#render_leaf_single(
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
)
#pagebreak()

// Day 282
#render_leaf_single(
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
)
#pagebreak()

// Day 283
#render_leaf_single(
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
)
#pagebreak()

// Day 284
#render_leaf_single(
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
)
#pagebreak()

// Day 285
#render_leaf_single(
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
)
#pagebreak()

// Day 286
#render_leaf_single(
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
)
#pagebreak()

// Day 287
#render_leaf_single(
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
)
#pagebreak()

// Day 288
#render_leaf_single(
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
)
#pagebreak()

// Day 289
#render_leaf_single(
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
)
#pagebreak()

// Day 290
#render_leaf_single(
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
)
#pagebreak()

// Day 291
#render_leaf_single(
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
)
#pagebreak()

// Day 292
#render_leaf_single(
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
)
#pagebreak()

// Day 293
#render_leaf_single(
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
)
#pagebreak()

// Day 294
#render_leaf_single(
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
)
#pagebreak()

// Day 295
#render_leaf_single(
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
)
#pagebreak()

// Day 296
#render_leaf_single(
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
)
#pagebreak()

// Day 297
#render_leaf_single(
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
)
#pagebreak()

// Day 298
#render_leaf_single(
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
)
#pagebreak()

// Day 299
#render_leaf_single(
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
)
#pagebreak()

// Day 300
#render_leaf_single(
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
)
#pagebreak()

// Day 301
#render_leaf_single(
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
)
#pagebreak()

// Day 302
#render_leaf_single(
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
)
#pagebreak()

// Day 303
#render_leaf_single(
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
)
#pagebreak()

// Day 304
#render_leaf_single(
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
)
#pagebreak()

// Day 305
#render_leaf_single(
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
)
#pagebreak()

// Day 306
#render_leaf_single(
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
)
#pagebreak()

// Day 307
#render_leaf_single(
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
)
#pagebreak()

// Day 308
#render_leaf_single(
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
)
#pagebreak()

// Day 309
#render_leaf_single(
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
)
#pagebreak()

// Day 310
#render_leaf_single(
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
)
#pagebreak()

// Day 311
#render_leaf_single(
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
)
#pagebreak()

// Day 312
#render_leaf_single(
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
)
#pagebreak()

// Day 313
#render_leaf_single(
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
)
#pagebreak()

// Day 314
#render_leaf_single(
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
)
#pagebreak()

// Day 315
#render_leaf_single(
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
)
#pagebreak()

// Day 316
#render_leaf_single(
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
)
#pagebreak()

// Day 317
#render_leaf_single(
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
)
#pagebreak()

// Day 318
#render_leaf_single(
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
)
#pagebreak()

// Day 319
#render_leaf_single(
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
)
#pagebreak()

// Day 320
#render_leaf_single(
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
)
#pagebreak()

// Day 321
#render_leaf_single(
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
)
#pagebreak()

// Day 322
#render_leaf_single(
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
)
#pagebreak()

// Day 323
#render_leaf_single(
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
)
#pagebreak()

// Day 324
#render_leaf_single(
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
)
#pagebreak()

// Day 325
#render_leaf_single(
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
)
#pagebreak()

// Day 326
#render_leaf_single(
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
)
#pagebreak()

// Day 327
#render_leaf_single(
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
)
#pagebreak()

// Day 328
#render_leaf_single(
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
)
#pagebreak()

// Day 329
#render_leaf_single(
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
)
#pagebreak()

// Day 330
#render_leaf_single(
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
)
#pagebreak()

// Day 331
#render_leaf_single(
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
)
#pagebreak()

// Day 332
#render_leaf_single(
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
)
#pagebreak()

// Day 333
#render_leaf_single(
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
)
#pagebreak()

// Day 334
#render_leaf_single(
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
)
#pagebreak()

// Day 335
#render_leaf_single(
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
)
#pagebreak()

// Day 336
#render_leaf_single(
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
)
#pagebreak()

// Day 337
#render_leaf_single(
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
)
#pagebreak()

// Day 338
#render_leaf_single(
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
)
#pagebreak()

// Day 339
#render_leaf_single(
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
)
#pagebreak()

// Day 340
#render_leaf_single(
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
)
#pagebreak()

// Day 341
#render_leaf_single(
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
)
#pagebreak()

// Day 342
#render_leaf_single(
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
)
#pagebreak()

// Day 343
#render_leaf_single(
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
)
#pagebreak()

// Day 344
#render_leaf_single(
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
)
#pagebreak()

// Day 345
#render_leaf_single(
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
)
#pagebreak()

// Day 346
#render_leaf_single(
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
)
#pagebreak()

// Day 347
#render_leaf_single(
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
)
#pagebreak()

// Day 348
#render_leaf_single(
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
)
#pagebreak()

// Day 349
#render_leaf_single(
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
)
#pagebreak()

// Day 350
#render_leaf_single(
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
)
#pagebreak()

// Day 351
#render_leaf_single(
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
)
#pagebreak()

// Day 352
#render_leaf_single(
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
)
#pagebreak()

// Day 353
#render_leaf_single(
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
)
#pagebreak()

// Day 354
#render_leaf_single(
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
)
#pagebreak()

// Day 355
#render_leaf_single(
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
)
#pagebreak()

// Day 356
#render_leaf_single(
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
)
#pagebreak()

// Day 357
#render_leaf_single(
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
)
#pagebreak()

// Day 358
#render_leaf_single(
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
)
#pagebreak()

// Day 359
#render_leaf_single(
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
)
#pagebreak()

// Day 360
#render_leaf_single(
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
)
#pagebreak()

// Day 361
#render_leaf_single(
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
)
#pagebreak()

// Day 362
#render_leaf_single(
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
)
#pagebreak()

// Day 363
#render_leaf_single(
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
)
#pagebreak()

// Day 364
#render_leaf_single(
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
)
#pagebreak()

// Day 365
#render_leaf_single(
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
)
