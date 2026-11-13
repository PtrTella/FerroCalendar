import React, { useState } from 'react';
import { X, Printer, FileText, Grid, CheckCircle2, AlertCircle, Download, Sparkles, Scissors } from 'lucide-react';
import { CalendarDay, CALENDAR_DATA, MONTH_NAMES_CAPITALIZED } from '../data/calendarData';
import { PrintMode } from './PrintView';

interface PrintModalProps {
  isOpen: boolean;
  onClose: () => void;
  currentDay: CalendarDay;
  year: number;
  onPreparePrint: (mode: PrintMode, days: CalendarDay[]) => void;
}

export const PrintModal: React.FC<PrintModalProps> = ({
  isOpen,
  onClose,
  currentDay,
  year,
  onPreparePrint,
}) => {
  const [activeTab, setActiveTab] = useState<'download' | 'browser'>('download');
  const [selectedScope, setSelectedScope] = useState<'current' | 'month' | 'all'>('current');
  const [selectedMonth, setSelectedMonth] = useState<number>(currentDay.monthNumber);
  const [layoutMode, setLayoutMode] = useState<'single' | 'grid4'>('grid4');

  if (!isOpen) return null;

  const handlePrint = () => {
    let days: CalendarDay[] = [];
    if (selectedScope === 'current') {
      days = [currentDay];
    } else if (selectedScope === 'month') {
      days = CALENDAR_DATA.filter((d) => d.monthNumber === selectedMonth);
    } else {
      days = CALENDAR_DATA;
    }

    const mode: PrintMode = layoutMode === 'grid4' ? 'grid4' : 'single';
    onPreparePrint(mode, days);

    // CRITICAL: Close the modal immediately so it unmounts and removes the dark backdrop overlay!
    onClose();

    // Give browser time to finish React render & print layout, then open system print
    setTimeout(() => {
      window.print();
    }, 250);
  };

  const getPageEstimate = () => {
    let count = 1;
    if (selectedScope === 'month') {
      count = CALENDAR_DATA.filter((d) => d.monthNumber === selectedMonth).length;
    } else if (selectedScope === 'all') {
      count = 365;
    }

    if (layoutMode === 'grid4') {
      return `${Math.ceil(count / 4)} fogli A4 (4 giorni per foglio - taglio a croce singolo)`;
    }
    return `${count} pagine A4 (1 giorno centrato per pagina)`;
  };

  return (
    <div className="no-print fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-4 bg-black/75 backdrop-blur-sm animate-fade-in">
      <div 
        className="relative w-full max-w-lg bg-stone-900 border border-stone-800 rounded-2xl shadow-2xl p-5 overflow-hidden flex flex-col max-h-[92vh] overflow-y-auto"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="flex items-center justify-between pb-3 border-b border-stone-800">
          <div>
            <h3 className="font-serif font-black text-xl text-stone-100 flex items-center gap-2">
              <Printer className="w-5 h-5 text-red-500" />
              Stampa & PDF FerroCalendar 2027
            </h3>
            <p className="text-xs text-stone-400">
              Scarica il PDF pronto o stampa con impostazioni personalizzate
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg bg-stone-800 hover:bg-stone-700 text-stone-400 hover:text-white transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Navigation Tabs */}
        <div className="grid grid-cols-2 gap-2 mt-4 p-1 bg-stone-950/60 rounded-xl border border-stone-800">
          <button
            type="button"
            onClick={() => setActiveTab('download')}
            className={`py-2 px-3 rounded-lg text-xs font-bold flex items-center justify-center gap-1.5 transition-all ${
              activeTab === 'download'
                ? 'bg-red-600 text-white shadow-md'
                : 'text-stone-400 hover:text-stone-200'
            }`}
          >
            <Sparkles className="w-3.5 h-3.5 text-amber-300" />
            <span>PDF Precompilati (Consigliato)</span>
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('browser')}
            className={`py-2 px-3 rounded-lg text-xs font-bold flex items-center justify-center gap-1.5 transition-all ${
              activeTab === 'browser'
                ? 'bg-stone-800 text-white shadow-md'
                : 'text-stone-400 hover:text-stone-200'
            }`}
          >
            <Printer className="w-3.5 h-3.5" />
            <span>Stampa dal Browser</span>
          </button>
        </div>

        {/* TAB 1: PRECOMPILED PDFS (ZERO PRINT ERRORS, 1-CLICK DOWNLOAD) */}
        {activeTab === 'download' && (
          <div className="py-4 space-y-3.5">
            <div className="bg-emerald-950/40 border border-emerald-800/60 rounded-xl p-3 flex items-start gap-2.5">
              <CheckCircle2 className="w-4 h-4 text-emerald-400 flex-shrink-0 mt-0.5" />
              <div className="text-xs text-emerald-200 leading-relaxed">
                <strong>Massima qualità garantita:</strong> PDF vettoriali precompilati direttamente con Typst, senza errori di margini del browser, senza pagine bianche e con colori e grafica perfetti.
              </div>
            </div>

            {/* Option 1: Eco 4 per Foglio */}
            <div className="bg-stone-950/80 border-2 border-red-500/80 rounded-xl p-3.5 hover:border-red-400 transition-all flex flex-col justify-between gap-3 shadow-lg">
              <div>
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <div className="p-1.5 bg-red-600/20 rounded-lg text-red-400 border border-red-500/30">
                      <Grid className="w-4 h-4" />
                    </div>
                    <h4 className="font-bold text-sm text-stone-100">
                      Eco A4 • 4 Giorni per Foglio
                    </h4>
                  </div>
                  <span className="text-[10px] font-mono uppercase bg-emerald-900/60 text-emerald-300 px-2 py-0.5 rounded-full border border-emerald-700/50">
                    Consigliato
                  </span>
                </div>
                <p className="text-xs text-stone-400 mt-2 leading-relaxed">
                  Completo per tutto il 2027: <strong>92 fogli A4</strong> con linee di <strong>taglio singolo a croce</strong> (1 taglio verticale + 1 orizzontale) e indicatore ✂ centrale.
                </p>
                <div className="flex items-center gap-3 text-[11px] text-stone-400 mt-2 font-mono">
                  <span>📄 92 Pagine</span>
                  <span>•</span>
                  <span>📦 738 KB</span>
                  <span>•</span>
                  <span>✂ Taglio Singolo</span>
                </div>
              </div>

              <a
                href="./FerroCalendar_2027_Eco_4_per_foglio.pdf"
                download="FerroCalendar_2027_Eco_4_per_foglio.pdf"
                className="w-full py-2.5 px-4 bg-red-600 hover:bg-red-500 active:scale-98 text-white rounded-lg text-xs font-bold flex items-center justify-center gap-2 shadow-md transition-all text-center"
              >
                <Download className="w-4 h-4" />
                <span>Scarica PDF Eco (92 Fogli - 4 per Pagina)</span>
              </a>
            </div>

            {/* Option 2: Single Full Page A4 */}
            <div className="bg-stone-950/50 border border-stone-800 rounded-xl p-3.5 hover:border-stone-700 transition-all flex flex-col justify-between gap-3">
              <div>
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <div className="p-1.5 bg-stone-800 rounded-lg text-stone-300 border border-stone-700">
                      <FileText className="w-4 h-4" />
                    </div>
                    <h4 className="font-bold text-sm text-stone-200">
                      Formato Grande • 1 Giorno per Pagina A4
                    </h4>
                  </div>
                  <span className="text-[10px] font-mono text-stone-400">
                    A4 Intera
                  </span>
                </div>
                <p className="text-xs text-stone-400 mt-2 leading-relaxed">
                  1 foglio A4 per ogni giorno dell'anno, numeri giganti Didot e bordi d'officina centrati, ideale per blocchetto gigante o esposizione.
                </p>
                <div className="flex items-center gap-3 text-[11px] text-stone-400 mt-2 font-mono">
                  <span>📄 365 Pagine</span>
                  <span>•</span>
                  <span>📦 928 KB</span>
                </div>
              </div>

              <a
                href="./FerroCalendar_2027_A4_Intera_Pagina.pdf"
                download="FerroCalendar_2027_A4_Intera_Pagina.pdf"
                className="w-full py-2.5 px-4 bg-stone-800 hover:bg-stone-700 active:scale-98 text-stone-200 rounded-lg text-xs font-bold flex items-center justify-center gap-2 border border-stone-700 shadow-md transition-all text-center"
              >
                <Download className="w-4 h-4" />
                <span>Scarica PDF Intera Pagina (365 Pagine)</span>
              </a>
            </div>
          </div>
        )}

        {/* TAB 2: BROWSER PRINT (CUSTOM RANGE / SINGLE DAY) */}
        {activeTab === 'browser' && (
          <div className="py-4 space-y-4">
            {/* Scope Selection */}
            <div>
              <label className="block text-xs font-bold uppercase tracking-wider text-stone-300 mb-2">
                1. Cosa vuoi stampare?
              </label>
              <div className="grid grid-cols-3 gap-2">
                <button
                  type="button"
                  onClick={() => setSelectedScope('current')}
                  className={`p-3 rounded-xl border text-center transition-all ${
                    selectedScope === 'current'
                      ? 'bg-red-950/70 border-red-500 text-white'
                      : 'bg-stone-800/70 border-stone-700 text-stone-300 hover:bg-stone-800'
                  }`}
                >
                  <FileText className="w-4 h-4 mx-auto mb-1 text-red-400" />
                  <span className="block text-xs font-bold">Questo giorno</span>
                  <span className="text-[10px] text-stone-400">{currentDay.day} {currentDay.month}</span>
                </button>

                <button
                  type="button"
                  onClick={() => setSelectedScope('month')}
                  className={`p-3 rounded-xl border text-center transition-all ${
                    selectedScope === 'month'
                      ? 'bg-red-950/70 border-red-500 text-white'
                      : 'bg-stone-800/70 border-stone-700 text-stone-300 hover:bg-stone-800'
                  }`}
                >
                  <FileText className="w-4 h-4 mx-auto mb-1 text-amber-400" />
                  <span className="block text-xs font-bold">Un Mese</span>
                  <span className="text-[10px] text-stone-400">28-31 giorni</span>
                </button>

                <button
                  type="button"
                  onClick={() => setSelectedScope('all')}
                  className={`p-3 rounded-xl border text-center transition-all ${
                    selectedScope === 'all'
                      ? 'bg-red-950/70 border-red-500 text-white'
                      : 'bg-stone-800/70 border-stone-700 text-stone-300 hover:bg-stone-800'
                  }`}
                >
                  <FileText className="w-4 h-4 mx-auto mb-1 text-emerald-400" />
                  <span className="block text-xs font-bold">Tutto l'Anno</span>
                  <span className="text-[10px] text-stone-400">365 giorni</span>
                </button>
              </div>
            </div>

            {/* Month Dropdown if Month chosen */}
            {selectedScope === 'month' && (
              <div className="bg-stone-800/80 p-3 rounded-xl border border-stone-700/80">
                <label className="block text-xs font-medium text-stone-300 mb-1.5">
                  Seleziona il mese da stampare:
                </label>
                <select
                  value={selectedMonth}
                  onChange={(e) => setSelectedMonth(Number(e.target.value))}
                  className="w-full bg-stone-900 border border-stone-700 rounded-lg p-2 text-sm text-stone-100 font-medium focus:ring-1 focus:ring-red-500"
                >
                  {MONTH_NAMES_CAPITALIZED.map((mName, idx) => (
                    <option key={idx + 1} value={idx + 1}>
                      {mName} ({CALENDAR_DATA.filter((d) => d.monthNumber === idx + 1).length} giorni)
                    </option>
                  ))}
                </select>
              </div>
            )}

            {/* Layout Mode Selection */}
            <div>
              <label className="block text-xs font-bold uppercase tracking-wider text-stone-300 mb-2">
                2. Formato e Layout di stampa
              </label>
              <div className="grid grid-cols-2 gap-2">
                <button
                  type="button"
                  onClick={() => setLayoutMode('grid4')}
                  className={`p-3 rounded-xl border text-left transition-all ${
                    layoutMode === 'grid4'
                      ? 'bg-red-950/70 border-red-500 text-white'
                      : 'bg-stone-800/70 border-stone-700 text-stone-300 hover:bg-stone-800'
                  }`}
                >
                  <Grid className="w-4 h-4 mb-1 text-emerald-400" />
                  <span className="block text-xs font-bold">Eco A4 (4 per Foglio)</span>
                  <span className="text-[10px] text-stone-400">
                    Taglio singolo: 1 taglio verticale + 1 orizzontale
                  </span>
                </button>

                <button
                  type="button"
                  onClick={() => setLayoutMode('single')}
                  className={`p-3 rounded-xl border text-left transition-all ${
                    layoutMode === 'single'
                      ? 'bg-red-950/70 border-red-500 text-white'
                      : 'bg-stone-800/70 border-stone-700 text-stone-300 hover:bg-stone-800'
                  }`}
                >
                  <FileText className="w-4 h-4 mb-1 text-red-400" />
                  <span className="block text-xs font-bold">1 Foglio per Pagina</span>
                  <span className="text-[10px] text-stone-400">
                    Centrato a piena pagina A4
                  </span>
                </button>
              </div>
            </div>

            {/* Summary / Tip Box */}
            <div className="bg-stone-800/60 p-3 rounded-xl border border-stone-700/60 text-xs text-stone-300 space-y-1.5">
              <div className="flex items-center gap-2 font-semibold text-emerald-400">
                <CheckCircle2 className="w-4 h-4" />
                <span>Totale stimato: {getPageEstimate()}</span>
              </div>
              <div className="flex items-start gap-2 text-stone-400 text-[11px]">
                <AlertCircle className="w-4 h-4 text-amber-400 flex-shrink-0 mt-0.5" />
                <span>
                  <strong>Consiglio di stampa:</strong> Nelle impostazioni di stampa, seleziona <em>"Grafica di sfondo"</em> e imposta i margini su <em>"Nessuno"</em> (o predefiniti).
                </span>
              </div>
            </div>

            <div className="pt-2 flex items-center justify-end gap-2">
              <button
                onClick={handlePrint}
                className="w-full py-2.5 px-4 rounded-xl bg-[#c92a2a] hover:bg-red-700 text-white text-xs font-bold flex items-center justify-center gap-2 transition-all shadow-md active:scale-98"
              >
                <Printer className="w-4 h-4" />
                <span>Avvia Finestra di Stampa Browser</span>
              </button>
            </div>
          </div>
        )}

        {/* Close Button Footer */}
        <div className="pt-3 border-t border-stone-800 flex items-center justify-between">
          <span className="text-[10px] text-stone-400">
            Andalò Gianni • FerroCalendar 2027
          </span>
          <button
            onClick={onClose}
            className="px-4 py-1.5 rounded-lg bg-stone-800 hover:bg-stone-700 text-stone-300 text-xs font-semibold transition-colors"
          >
            Chiudi
          </button>
        </div>
      </div>
    </div>
  );
};
