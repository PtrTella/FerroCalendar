import json
import re

month_names = [
    'gennaio', 'febbraio', 'marzo', 'aprile', 'maggio', 'giugno',
    'luglio', 'agosto', 'settembre', 'ottobre', 'novembre', 'dicembre'
]

saints_map = {
    (1, 1): 'Maria Madre di Dio', (1, 2): 'S. Basilio Magno', (1, 3): 'S. Genoveffa', (1, 4): 'S. Ermete',
    (1, 5): 'S. Amelia', (1, 6): 'Epifania del Signore', (1, 7): 'S. Raimondo', (1, 8): 'S. Massimo',
    (1, 9): 'S. Giuliano', (1, 10): 'S. Aldo', (1, 11): 'S. Igino', (1, 12): 'S. Modesto',
    (1, 13): 'S. Ilario', (1, 14): 'S. Felice', (1, 15): 'S. Mauro', (1, 16): 'S. Marcello',
    (1, 17): 'S. Antonio Abate', (1, 18): 'S. Liberata', (1, 19): 'S. Mario', (1, 20): 'S. Sebastiano',
    (1, 21): 'S. Agnese', (1, 22): 'S. Vincenzo', (1, 23): 'S. Emerenziana', (1, 24): 'S. Francesco di Sales',
    (1, 25): 'Conversione di S. Paolo', (1, 26): 'S. Tito e Timoteo', (1, 27): 'S. Angela Merici', (1, 28): 'S. Tommaso d\'Aquino',
    (1, 29): 'S. Costanzo', (1, 30): 'S. Martina', (1, 31): 'S. Giovanni Bosco',

    (2, 1): 'S. Verdiana', (2, 2): 'Presentazione del Signore', (2, 3): 'S. Biagio', (2, 4): 'S. Gilberto',
    (2, 5): 'S. Agata', (2, 6): 'S. Paolo Miki', (2, 7): 'S. Teodoro', (2, 8): 'S. Girolamo Emiliani',
    (2, 9): 'S. Apollonia', (2, 10): 'S. Scolastica', (2, 11): 'N.S. di Lourdes', (2, 12): 'S. Eulalia',
    (2, 13): 'S. Maura', (2, 14): 'S. Valentino', (2, 15): 'S. Faustino', (2, 16): 'S. Giuliana',
    (2, 17): 'S. Donato', (2, 18): 'S. Simeone', (2, 19): 'S. Mansueto', (2, 20): 'S. Silvano',
    (2, 21): 'S. Pier Damiani', (2, 22): 'Cattedra di S. Pietro', (2, 23): 'S. Policarpo', (2, 24): 'S. Edilberto',
    (2, 25): 'S. Cesario', (2, 26): 'S. Romeo', (2, 27): 'S. Leandro', (2, 28): 'S. Romano',

    (3, 1): 'S. Albino', (3, 2): 'S. Simplicio', (3, 3): 'S. Cunegonda', (3, 4): 'S. Casimiro',
    (3, 5): 'S. Adriano', (3, 6): 'S. Coletta', (3, 7): 'S. Perpetua e Felicita', (3, 8): 'S. Giovanni di Dio',
    (3, 9): 'S. Francesca Romana', (3, 10): 'S. Simplicio', (3, 11): 'S. Costantino', (3, 12): 'S. Massimiliano',
    (3, 13): 'S. Patrizia', (3, 14): 'S. Matilde', (3, 15): 'S. Luisa', (3, 16): 'S. Eriberto',
    (3, 17): 'S. Patrizio', (3, 18): 'S. Cirillo', (3, 19): 'S. Giuseppe', (3, 20): 'S. Claudia',
    (3, 21): 'S. Benedetto', (3, 22): 'S. Lea', (3, 23): 'S. Turibio', (3, 24): 'S. Romolo',
    (3, 25): 'Annunciazione del Signore', (3, 26): 'S. Emanuele', (3, 27): 'S. Augusto', (3, 28): 'S. Sisto III',
    (3, 29): 'S. Secondo', (3, 30): 'S. Amedeo', (3, 31): 'S. Beniamino',

    (4, 1): 'S. Ugo', (4, 2): 'S. Francesco da Paola', (4, 3): 'S. Riccardo', (4, 4): 'S. Isidoro',
    (4, 5): 'S. Vincenzo Ferrer', (4, 6): 'S. Guglielmo', (4, 7): 'S. Giovanni Battista de la Salle', (4, 8): 'S. Alberto',
    (4, 9): 'S. Maria Cleofe', (4, 10): 'S. Terenzio', (4, 11): 'S. Gemma Galgani', (4, 12): 'S. Giulio',
    (4, 13): 'S. Martino I', (4, 14): 'S. Lamberto', (4, 15): 'S. Annibale', (4, 16): 'S. Bernadette',
    (4, 17): 'S. Aniceto', (4, 18): 'S. Galdino', (4, 19): 'S. Emma', (4, 20): 'S. Adalgisa',
    (4, 21): 'S. Anselmo', (4, 22): 'S. Sotero', (4, 23): 'S. Giorgio', (4, 24): 'S. Fedele',
    (4, 25): 'S. Marco Evangelista', (4, 26): 'S. Marcellino', (4, 27): 'S. Zita', (4, 28): 'S. Valeria',
    (4, 29): 'S. Caterina da Siena', (4, 30): 'S. Pio V',

    (5, 1): 'S. Giuseppe Artigiano', (5, 2): 'S. Atanasio', (5, 3): 'Ss. Filippo e Giacomo', (5, 4): 'S. Silvano',
    (5, 5): 'S. Pellegrino', (5, 6): 'S. Domenico Savio', (5, 7): 'S. Flavia', (5, 8): 'B.V. Maria del Rosario',
    (5, 9): 'S. Gregorio', (5, 10): 'S. Antonino', (5, 11): 'S. Fabio', (5, 12): 'S. Pancrazio',
    (5, 13): 'B.V. di Fatima', (5, 14): 'S. Mattia', (5, 15): 'S. Torquato', (5, 16): 'S. Ubaldo',
    (5, 17): 'S. Pasquale Baylon', (5, 18): 'S. Giovanni I', (5, 19): 'S. Pietro di Morrone', (5, 20): 'S. Bernardino da Siena',
    (5, 21): 'S. Vittorio', (5, 22): 'S. Rita da Cascia', (5, 23): 'S. Desiderio', (5, 24): 'B.V. Maria Ausiliatrice',
    (5, 25): 'S. Beda', (5, 26): 'S. Filippo Neri', (5, 27): 'S. Agostino di Canterbury', (5, 28): 'S. Emilio',
    (5, 29): 'S. Massimo', (5, 30): 'S. Ferdinando', (5, 31): 'Visitazione B.V.M.',

    (6, 1): 'S. Giustino', (6, 2): 'Ss. Marcellino e Pietro', (6, 3): 'S. Carlo Lwanga', (6, 4): 'S. Quirino',
    (6, 5): 'S. Bonifacio', (6, 6): 'S. Norberto', (6, 7): 'S. Roberto', (6, 8): 'S. Medardo',
    (6, 9): 'S. Primo e Feliciano', (6, 10): 'S. Diana', (6, 11): 'S. Barnaba', (6, 12): 'S. Onofrio',
    (6, 13): 'S. Antonio di Padova', (6, 14): 'S. Eliseo', (6, 15): 'S. Vito', (6, 16): 'S. Aureliano',
    (6, 17): 'S. Ranieri', (6, 18): 'S. Gregorio Barbarigo', (6, 19): 'S. Romualdo', (6, 20): 'S. Silverio',
    (6, 21): 'S. Luigi Gonzaga', (6, 22): 'S. Paolino da Nola', (6, 23): 'S. Lanfranco', (6, 24): 'Natività S. Giovanni Battista',
    (6, 25): 'S. Guglielmo', (6, 26): 'S. Vigilio', (6, 27): 'S. Cirillo d\'Alessandria', (6, 28): 'S. Ireneo',
    (6, 29): 'Ss. Pietro e Paolo', (6, 30): 'Primi Santi Martiri',

    (7, 1): 'S. Pier Giorgio Frassati', (7, 2): 'S. Ottone', (7, 3): 'S. Tommaso Apostolo', (7, 4): 'S. Elisabetta del Portogallo',
    (7, 5): 'S. Antonio Maria Zaccaria', (7, 6): 'S. Maria Goretti', (7, 7): 'S. Claudio', (7, 8): 'S. Adriano',
    (7, 9): 'S. Veronica Giuliani', (7, 10): 'S. Felicita', (7, 11): 'S. Benedetto da Norcia', (7, 12): 'S. Fortunato',
    (7, 13): 'S. Enrico', (7, 14): 'S. Camillo de Lellis', (7, 15): 'S. Bonaventura', (7, 16): 'B.V. Maria del Carmelo',
    (7, 17): 'S. Alessio', (7, 18): 'S. Federico', (7, 19): 'S. Arsenio', (7, 20): 'S. Elia',
    (7, 21): 'S. Lorenzo da Brindisi', (7, 22): 'S. Maria Maddalena', (7, 23): 'S. Brigida', (7, 24): 'S. Cristina',
    (7, 25): 'S. Giacomo Apostolo', (7, 26): 'Ss. Anna e Gioacchino', (7, 27): 'S. Liliana', (7, 28): 'S. Nazario',
    (7, 29): 'S. Marta', (7, 30): 'S. Pietro Crisologo', (7, 31): 'S. Ignazio di Loyola',

    (8, 1): 'S. Alfonso Maria de Liguori', (8, 2): 'S. Eusebio', (8, 3): 'S. Lidia', (8, 4): 'S. Giovanni Maria Vianney',
    (8, 5): 'Dedicazione Basilica S. Maria Maggiore', (8, 6): 'Trasfigurazione del Signore', (8, 7): 'S. Gaetano da Thiene', (8, 8): 'S. Domenico',
    (8, 9): 'S. Teresa Benedetta', (8, 10): 'S. Lorenzo', (8, 11): 'S. Chiara', (8, 12): 'S. Ercolano',
    (8, 13): 'S. Ponziano', (8, 14): 'S. Massimiliano Kolbe', (8, 15): 'Assunzione della B.V. Maria', (8, 16): 'S. Rocco',
    (8, 17): 'S. Giacinto', (8, 18): 'S. Elena', (8, 19): 'S. Giovanni Eudes', (8, 20): 'S. Bernardo',
    (8, 21): 'S. Pio X', (8, 22): 'B.V. Maria Regina', (8, 23): 'S. Rosa da Lima', (8, 24): 'S. Bartolomeo Apostolo',
    (8, 25): 'S. Ludovico', (8, 26): 'S. Alessandro', (8, 27): 'S. Monica', (8, 28): 'S. Agostino',
    (8, 29): 'Martirio di S. Giovanni Battista', (8, 30): 'S. Faustina', (8, 31): 'S. Aristide',

    (9, 1): 'S. Egidio', (9, 2): 'S. Elpidio', (9, 3): 'S. Gregorio Magno', (9, 4): 'S. Rosalia',
    (9, 5): 'S. Teresa di Calcutta', (9, 6): 'S. Umberto', (9, 7): 'S. Regina', (9, 8): 'Natività B.V. Maria',
    (9, 9): 'S. Sergio', (9, 10): 'S. Nicola da Tolentino', (9, 11): 'S. Giacinto', (9, 12): 'Santissimo Nome di Maria',
    (9, 13): 'S. Giovanni Crisostomo', (9, 14): 'Esaltazione Santa Croce', (9, 15): 'B.V. Maria Addolorata', (9, 16): 'Ss. Cornelio e Cipriano',
    (9, 17): 'S. Roberto Bellarmino', (9, 18): 'S. Sofia', (9, 19): 'S. Gennaro', (9, 20): 'Ss. Martiri Coreani',
    (9, 21): 'S. Matteo Apostolo', (9, 22): 'S. Maurizio', (9, 23): 'S. Pio da Pietrelcina', (9, 24): 'S. Pacifico',
    (9, 25): 'S. Aurelia', (9, 26): 'Ss. Cosma e Damiano', (9, 27): 'S. Vincenzo de\' Paoli', (9, 28): 'S. Venceslao',
    (9, 29): 'Ss. Michele, Gabriele e Raffaele', (9, 30): 'S. Girolamo',

    (10, 1): 'S. Teresa di Gesù Bambino', (10, 2): 'Ss. Angeli Custodi', (10, 3): 'S. Gerardo', (10, 4): 'S. Francesco d\'Assisi',
    (10, 5): 'S. Placido', (10, 6): 'S. Bruno', (10, 7): 'B.V. Maria del Rosario', (10, 8): 'S. Pelagia',
    (10, 9): 'S. Dionigi', (10, 10): 'S. Daniele', (10, 11): 'S. Giovanni XXIII', (10, 12): 'S. Serafino',
    (10, 13): 'S. Edoardo', (10, 14): 'S. Callisto', (10, 15): 'S. Teresa d\'Avila', (10, 16): 'S. Edvige',
    (10, 17): 'S. Ignazio d\'Antiochia', (10, 18): 'S. Luca Evangelista', (10, 19): 'S. Paolo della Croce', (10, 20): 'S. Irene',
    (10, 21): 'S. Orsola', (10, 22): 'S. Giovanni Paolo II', (10, 23): 'S. Giovanni da Capestrano', (10, 24): 'S. Antonio Maria Claret',
    (10, 25): 'S. Crispino', (10, 26): 'S. Evaristo', (10, 27): 'S. Fiorenzo', (10, 28): 'Ss. Simone e Giuda',
    (10, 29): 'S. Ermelinda', (10, 30): 'S. Germano', (10, 31): 'S. Quintino',

    (11, 1): 'Tutti i Santi', (11, 2): 'Commemorazione dei Defunti', (11, 3): 'S. Martino de Porres', (11, 4): 'S. Carlo Borromeo',
    (11, 5): 'S. Zaccaria', (11, 6): 'S. Leonardo', (11, 7): 'S. Ernesto', (11, 8): 'S. Goffredo',
    (11, 9): 'Dedicazione Basilica Lateranense', (11, 10): 'S. Leone Magno', (11, 11): 'S. Martino di Tours', (11, 12): 'S. Renato',
    (11, 13): 'S. Diego', (11, 14): 'S. Giocondo', (11, 15): 'S. Alberto Magno', (11, 16): 'S. Margherita di Scozia',
    (11, 17): 'S. Elisabetta d\'Ungheria', (11, 18): 'Dedicazione Basiliche Pietro e Paolo', (11, 19): 'S. Fausto', (11, 20): 'S. Benigno',
    (11, 21): 'Presentazione B.V. Maria', (11, 22): 'S. Cecilia', (11, 23): 'S. Clemente', (11, 24): 'S. Flora',
    (11, 25): 'S. Caterina d\'Alessandria', (11, 26): 'S. Corrado', (11, 27): 'S. Virgilio', (11, 28): 'S. Giacomo della Marca',
    (11, 29): 'S. Saturnino', (11, 30): 'S. Andrea Apostolo',

    (12, 1): 'S. Ansano', (12, 2): 'S. Bibiana', (12, 3): 'S. Francesco Saverio', (12, 4): 'S. Barbara',
    (12, 5): 'S. Saba', (12, 6): 'S. Nicola di Bari', (12, 7): 'S. Ambrogio', (12, 8): 'Immacolata Concezione',
    (12, 9): 'S. Siro', (12, 10): 'B.V. Maria di Loreto', (12, 11): 'S. Damaso', (12, 12): 'B.V. Maria di Guadalupe',
    (12, 13): 'S. Lucia', (12, 14): 'S. Giovanni della Croce', (12, 15): 'S. Valeriano', (12, 16): 'S. Adelaide',
    (12, 17): 'S. Lazzaro', (12, 18): 'S. Graziano', (12, 19): 'S. Dario', (12, 20): 'S. Liberato',
    (12, 21): 'S. Pietro Canisio', (12, 22): 'S. Francesca Saverio Cabrini', (12, 23): 'S. Giovanni da Kety', (12, 24): 'S. Adele',
    (12, 25): 'Natale del Signore', (12, 26): 'S. Stefano', (12, 27): 'S. Giovanni Evangelista', (12, 28): 'Ss. Innocenti Martiri',
    (12, 29): 'S. Tommaso Becket', (12, 30): 'S. Eugenio', (12, 31): 'S. Silvestro I Papa'
}

with open('data.md', 'r', encoding='utf-8') as f:
    content = f.read()

lines = content.split('\n')
day_pattern = re.compile(r'^\s*(\d{1,2})\s+(' + '|'.join(month_names) + r')\s*$', re.IGNORECASE)

entries_raw = []
cur_day, cur_month, cur_lines = None, None, []

for line in lines:
    if re.match(r'^Calendario\s+', line.strip(), re.I):
        continue
    m = day_pattern.match(line.strip())
    if m:
        if cur_day and cur_month:
            entries_raw.append((int(cur_day), cur_month.lower(), cur_lines))
        cur_day, cur_month = m.group(1), m.group(2).lower()
        cur_lines = []
    else:
        if cur_day:
            cur_lines.append(line)

if cur_day and cur_month:
    entries_raw.append((int(cur_day), cur_month.lower(), cur_lines))

print(f'Parsed {len(entries_raw)} raw entries.')

calendar_days = []
day_of_year = 0

for day, month_name, lines_block in entries_raw:
    day_of_year += 1
    month_idx = month_names.index(month_name) + 1
    
    raw_text = '\n'.join(lines_block)
    
    # Check if closed for holidays
    is_ferie = bool(re.search(r'CHIUSO\s+PER\s+FERIE', raw_text, re.I))
    
    # Detect birthday / special greeting
    is_birthday = False
    birthday_person = None
    
    # Look for 'Auguri, <Person>' or 'Buon compleanno, <Person>'
    bday_m = re.search(r'(?:Auguri(?:,\s*|\s+)|Buon\s+compleanno(?:,\s*|\s+))([A-Za-zÀ-ÿ\s\!]+)', raw_text, re.I)
    if bday_m:
        is_birthday = True
        birthday_person = bday_m.group(1).strip().strip('.!\"”\u201d')
    elif 'Auguri a me' in raw_text:
        is_birthday = True
        birthday_person = 'a me'
    
    # Clean text lines
    clean_lines = []
    for l in lines_block:
        # Remove markdown & Unicode em spaces
        s = l.replace('\u2003', ' ').replace('\u3000', ' ').replace('\xa0', ' ').strip()
        # Don't duplicate 'CHIUSO PER FERIE' if it's already a dedicated badge, but we can keep or omit
        if s.upper() == 'CHIUSO PER FERIE':
            continue
        if s:
            clean_lines.append(s)
            
    full_clean_text = '\n'.join(clean_lines).strip()
    
    # Extract closing / signature if at bottom
    # e.g. "Auguri, Ferro." or "William Shakespeare" or "Buon 2028 Stronzi." or "Oci!\nAuguri, Fox."
    closing = None
    quote_text = full_clean_text
    
    if len(clean_lines) >= 2:
        last_line = clean_lines[-1].strip('“”\"')
        # Check if last line looks like an attribution or wish
        if re.search(r'^(Auguri|Buon|Oci|LA VITA È FANTASTICA|William Shakespeare)', last_line, re.I):
            closing = clean_lines[-1]
            quote_text = '\n'.join(clean_lines[:-1]).strip()
        elif len(clean_lines) >= 3 and re.search(r'^(Auguri|Buon|LA VITA È FANTASTICA)', clean_lines[-1], re.I):
            closing = clean_lines[-1]
            quote_text = '\n'.join(clean_lines[:-1]).strip()
    
    # Strip enclosing quotes from quote_text
    quote_text = re.sub(r'^[“\"\s]+', '', quote_text)
    quote_text = re.sub(r'[”\"\s]+$', '', quote_text)
    if closing:
        closing = re.sub(r'^[“\"\s]+', '', closing)
        closing = re.sub(r'[”\"\s]+$', '', closing)
        
    saint = saints_map.get((month_idx, day), '')
    
    calendar_days.append({
        'day': day,
        'month': month_name,
        'monthNumber': month_idx,
        'dayOfYear': day_of_year,
        'saint': saint,
        'isFerie': is_ferie,
        'isBirthday': is_birthday,
        'birthdayPerson': birthday_person,
        'quote': quote_text,
        'closing': closing,
        'rawLines': clean_lines
    })

print(f'Total calendar days processed: {len(calendar_days)}')

# Save as JSON
with open('src/data/calendarData.json', 'w', encoding='utf-8') as f:
    json.dump(calendar_days, f, ensure_ascii=False, indent=2)

# Save as TypeScript
ts_code = f"""// Generated calendar data for FerroCalendar
export interface CalendarDay {{
  day: number;
  month: string;
  monthNumber: number;
  dayOfYear: number;
  saint: string;
  isFerie: boolean;
  isBirthday: boolean;
  birthdayPerson: string | null;
  quote: string;
  closing: string | null;
  rawLines: string[];
}}

export const CALENDAR_DATA: CalendarDay[] = {json.dumps(calendar_days, ensure_ascii=False, indent=2)};

export const MONTH_NAMES = [
  'gennaio', 'febbraio', 'marzo', 'aprile', 'maggio', 'giugno',
  'luglio', 'agosto', 'settembre', 'ottobre', 'novembre', 'dicembre'
];

export const MONTH_NAMES_CAPITALIZED = [
  'Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno',
  'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'
];

export const DAYS_OF_WEEK = [
  'domenica', 'lunedì', 'martedì', 'mercoledì', 'giovedì', 'venerdì', 'sabato'
];
"""

with open('src/data/calendarData.ts', 'w', encoding='utf-8') as f:
    f.write(ts_code)

print('Successfully written calendarData.json and calendarData.ts!')
