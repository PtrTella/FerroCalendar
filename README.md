# FerroCalendar 2027 🗓️

> Il celebre calendario filosofico a strappo da officina: 365 perle, aforismi e verità quotidiane senza filtri.

Ispirato al classico calendario a strappo da banco e da parete con cornice grunge rossa e antracite, numeri Didone ad alto contrasto e cartoncino di supporto.

Disponibile sia come **Web App interattiva e accessibile** con animazioni realistiche di strappo foglio, sia come **suite di stampa professionale per realizzare il vero blocco a strappo cartaceo** (o salvare in PDF).

---

## 🌟 Caratteristiche Principali

### 1. Web App Interattiva ("Aprendola hai il calendario di ogni giorno")
- **Visuale Fedele al Calendario Fisico**: Cornice distressed con pennellate grunge rosse e antracite, testata di cartoncino nero con rivetti, linea di perforazione tratteggiata, nastro con anno 2027, numeri Didone ad altissima definizione e font serif poetico per le frasi.
- **Apertura Intelligente sulla Data Odierna**: All'apertura riconosce la data corrente (es. 13 Novembre) e mostra direttamente il foglio del giorno.
- **Animazione di Strappo Realistica ("Strappa!")**: Cliccando sul foglio, sulla testata, sul pulsante o premendo `Spazio`, il foglio si stacca con fisica di rotazione e caduta, svelando istantaneamente il foglio del giorno successivo.
- **Fisica Sonora Web Audio API**: Effetto sonoro sintetico dello strappo della carta generato tramite Web Audio (nessun file audio pesante da caricare, offline al 100%, con interruttore mute/audio).
- **Incolla / Annulla Strappo**: Puoi sfogliare all'indietro per ripristinare i fogli strappati.
- **Supporto Swipe Mobile & Tastiera**: 
  - `Spazio` o `Freccia Destra`: strappa il foglio.
  - `Freccia Sinistra`: torna al foglio precedente.
  - Swipe su smartphone/tablet.
- **Giorno Casuale**: Tasto dadi per estrarre una perla random tra le 365 dell'anno.
- **Compleanni & Eventi Speciali**: Cassetto dedicato con scorciatoie immediate per tutti i compleanni (Ferro 25 Febbraio, Ale, Massi, Fox, Gigi, Giorgia, Igli, Conti...) ed i periodi "CHIUSO PER FERIE", con coriandoli celebrativi!
- **Ricerca dal Vivo**: Ricerca istantanea su tutte le 365 frasi e citazioni.
- **Condivisione & Esportazione PNG**:
  - Copia citazione negli appunti con un clic.
  - Condivisione su WhatsApp/Telegram con link diretto alla data (`#25-febbraio`).
  - **Esportazione Immagine PNG ad alta risoluzione** del singolo foglio per condividerlo come foto sui social o nelle chat.
- **Selettore Anno Dinamico**: Anno 2027 ufficiale (con giorni della settimana ricalcolati automaticamente, supporta anche 2026/2028).

---

### 2. Suite di Stampa Professionale & PDF ("Possibilità di stampare il tutto")
Cliccando sul pulsante **"Stampa / PDF"** è possibile generare e stampare:
1. **Questo Giorno (1 Pagina)**: Formato perfetto per stampare e appendere una singola perla in officina, sulla macchina utensile o in bacheca.
2. **Tutto l'Anno (365 Pagine)**: Genera l'intero blocco calendario di 365 pagine con salti pagina precisi (`page-break-after: always`). Ideale per rilegatura a colla o spillatura da calendario a strappo da banco.
3. **Un Singolo Mese**: Stampa solo il mese desiderato (28-31 giorni).
4. **Layout Eco A4 Fai-Da-Te (4 giorni per foglio)**: Disponi 4 fogli per pagina A4 con crocini e guide tratteggiate di taglio per forbice o taglierina (bastano 92 fogli A4 per stampare l'intero anno in casa!).

> 💡 **Suggerimento per la stampa**: Nella finestra di stampa del browser (o salvataggio PDF), seleziona **"Grafica di sfondo"** (*Background graphics*) per stampare i bordi grunge e le sfumature della carta.

---

## 🛠️ Tecnologie Utilizzate

- **React 19 & TypeScript**: Architettura moderna e modulare.
- **Vite 6**: Bundling ultra-veloce con percorsi relativi (`base: './'`).
- **Tailwind CSS**: Design tipografico ad alta fedeltà e stili di stampa `@media print`.
- **Web Audio API**: Sintesi sonora procedurale per lo strappo della carta.
- **Canvas / SVG Vector Rendering**: Bordi grunge vettoriali nitidi sia a schermo retina che a 600 DPI in stampa.
- **Canvas Confetti**: Animazioni festive per i compleanni.
- **Lucide Icons**: Iconografia pulita ed essenziale.
- **GitHub Actions**: Deployment automatico continuo su GitHub Pages.

---

## 🚀 Sviluppo Locale

Per avviare il progetto sul tuo computer:

```bash
# Installa le dipendenze
npm install

# Avvia il server di sviluppo locale
npm run dev
```

Apri `http://localhost:5173` nel browser.

Per compilare la versione di produzione:

```bash
npm run build
```

---

## 🌐 Pubblicazione su GitHub Pages

Il repository include già il workflow di deploy automatico in `.github/workflows/deploy.yml`.

Per abilitarlo su GitHub:
1. Vai nel tuo repository su GitHub: `Settings` → `Pages`.
2. Sotto **Build and deployment** > **Source**, seleziona **GitHub Actions**.
3. Ad ogni commit o push sul branch `main`, GitHub Actions compilerà il sito e lo pubblicherà automaticamente su `https://ptrtella.github.io/FerroCalendar/`!
