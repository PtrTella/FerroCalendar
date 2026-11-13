import React, { useState } from 'react';
import { X, Printer, FileText, Grid, CheckCircle2, AlertCircle } from 'lucide-react';
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
  const [selectedScope, setSelectedScope] = useState<'current' | 'month' | 'all'>('current');
  const [selectedMonth, setSelectedMonth] = useState<number>(currentDay.monthNumber);
  const [layoutMode, setLayoutMode] = useState<'single' | 'grid4'>('single');

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

    // Give browser a split second to render the print DOM, then open system print
    setTimeout(() => {
      window.print();
    }, 150);
  };

  const getPageEstimate = () => {
    let count = 1;
    if (selectedScope === 'month') {
      count = CALENDAR_DATA.filter((d) => d.monthNumber === selectedMonth).length;
    } else if (selectedScope === 'all') {
      count = 365;
    }

    if (layoutMode === 'grid4') {
      return `${Math.ceil(count / 4)} fogli A4 (4 giorni per foglio - taglio a croce)`;
    }
    return `${count} pagine A4 (1 giorno centrato per pagina)`;
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-4 bg-black/75 backdrop-blur-sm animate-fade-in">
      <div 
        className="relative w-full max-w-lg bg-stone-900 border border-stone-800 rounded-2xl shadow-2xl p-5 overflow-hidden flex flex-col"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="flex items-center justify-between pb-3 border-b border-stone-800">
          <div>
            <h3 className="font-serif font-black text-xl text-stone-100 flex items-center gap-2">
              <Printer className="w-5 h-5 text-red-500" />
              Stampa & Esporta PDF
            </h3>
            <p className="text-xs text-stone-400">
              Crea il tuo calendario a strappo fisico o salva in PDF
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg bg-stone-800 hover:bg-stone-700 text-stone-400 hover:text-white transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

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
                <span className="text-[10px] text-stone-400">365 pagine</span>
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
                  Centrato a piena pagina A4, ideale da appendere o incorniciare
                </span>
              </button>

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
                  Taglio singolo: 1 taglio verticale + 1 orizzontale dividono i 4 giorni (A6) senza rifili
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
                <strong>Consiglio:</strong> Nella finestra di stampa del browser, assicurati di selezionare <em>"Grafica di sfondo"</em> (Background graphics) per stampare la texture della carta e i bordi colorati.
              </span>
            </div>
          </div>
        </div>

        {/* Footer / CTA */}
        <div className="pt-3 border-t border-stone-800 flex items-center justify-end gap-2">
          <button
            onClick={onClose}
            className="px-4 py-2 rounded-xl bg-stone-800 hover:bg-stone-700 text-stone-300 text-xs font-semibold transition-colors"
          >
            Annulla
          </button>
          <button
            onClick={handlePrint}
            className="px-5 py-2.5 rounded-xl bg-[#c92a2a] hover:bg-red-700 text-white text-xs font-bold flex items-center gap-2 transition-all shadow-md active:scale-98"
          >
            <Printer className="w-4 h-4" />
            <span>Apri Stampa / Salva PDF</span>
          </button>
        </div>
      </div>
    </div>
  );
};
