import React, { useState } from 'react';
import { 
  Scissors, 
  RotateCcw, 
  Calendar as CalendarIcon, 
  Dices, 
  Search, 
  Printer, 
  Share2, 
  Volume2, 
  VolumeX, 
  Cake, 
  Download
} from 'lucide-react';
import { soundCtrl } from '../utils/audio';

interface ToolbarProps {
  onTear: () => void;
  onRewind: () => void;
  onToday: () => void;
  onRandom: () => void;
  onOpenDrawer: () => void;
  onOpenSearch: () => void;
  onOpenPrint: () => void;
  onOpenSpecial: () => void;
  onDownloadImage: () => void;
  onShare: () => void;
  canTear: boolean;
  canRewind: boolean;
  year: number;
  onYearChange: (y: number) => void;
}

export const Toolbar: React.FC<ToolbarProps> = ({
  onTear,
  onRewind,
  onToday,
  onRandom,
  onOpenDrawer,
  onOpenSearch,
  onOpenPrint,
  onOpenSpecial,
  onDownloadImage,
  onShare,
  canTear,
  canRewind,
  year,
  onYearChange,
}) => {
  const [isMuted, setIsMuted] = useState(soundCtrl.getMuted());

  const handleToggleSound = () => {
    const next = soundCtrl.toggleMute();
    setIsMuted(next);
  };

  return (
    <header className="w-full max-w-4xl mx-auto px-4 py-3 flex flex-wrap items-center justify-between gap-3 text-stone-200">
      {/* Brand Title & Year Selector */}
      <div className="flex items-center gap-3">
        <div className="flex items-center gap-2">
          <div className="w-8 h-8 rounded-lg bg-[#c92a2a] text-white flex items-center justify-center font-serif font-black text-lg shadow-md border border-red-500">
            F
          </div>
          <div>
            <h1 className="font-serif font-black tracking-tight text-lg sm:text-xl text-stone-100 leading-none">
              FerroCalendar
            </h1>
            <p className="text-[10px] text-stone-400 font-mono tracking-wider">
              CALENDARIO A STRAPPO
            </p>
          </div>
        </div>

        {/* Year Selector */}
        <select
          value={year}
          onChange={(e) => onYearChange(Number(e.target.value))}
          className="bg-stone-800 text-stone-200 border border-stone-700 rounded-md px-2 py-1 text-xs font-semibold focus:outline-none focus:ring-1 focus:ring-red-500 cursor-pointer"
          title="Seleziona l'anno del calendario"
        >
          <option value={2027}>2027 (Ufficiale)</option>
          <option value={2026}>2026</option>
          <option value={2028}>2028</option>
        </select>
      </div>

      {/* Main Action Buttons */}
      <div className="flex items-center flex-wrap gap-1.5 sm:gap-2">
        {/* Rewind */}
        <button
          onClick={onRewind}
          disabled={!canRewind}
          title="Giorno precedente (Freccia Sinistra)"
          className={`p-2 rounded-lg border flex items-center gap-1.5 text-xs font-medium transition-colors ${
            canRewind
              ? 'bg-stone-800/90 border-stone-700 hover:bg-stone-700 text-stone-200 hover:border-stone-600'
              : 'bg-stone-900 border-stone-800 text-stone-600 cursor-not-allowed'
          }`}
        >
          <RotateCcw className="w-4 h-4" />
          <span className="hidden sm:inline">Incolla</span>
        </button>

        {/* Tear Off Button */}
        <button
          onClick={onTear}
          disabled={!canTear}
          title="Strappa il foglio (Spazio o Freccia Destra)"
          className={`px-3 py-2 rounded-lg border flex items-center gap-1.5 text-xs font-bold transition-all shadow-md ${
            canTear
              ? 'bg-[#c92a2a] border-red-500 hover:bg-red-700 text-white active:scale-95'
              : 'bg-stone-800 border-stone-700 text-stone-500 cursor-not-allowed'
          }`}
        >
          <Scissors className="w-4 h-4 rotate-90" />
          <span>Strappa!</span>
        </button>

        {/* Today */}
        <button
          onClick={onToday}
          title="Torna ad oggi"
          className="p-2 rounded-lg bg-stone-800/90 border border-stone-700 hover:bg-stone-700 text-stone-200 text-xs font-medium flex items-center gap-1.5 transition-colors"
        >
          <CalendarIcon className="w-4 h-4 text-red-400" />
          <span className="hidden md:inline">Oggi</span>
        </button>

        {/* Random Day */}
        <button
          onClick={onRandom}
          title="Giorno casuale"
          className="p-2 rounded-lg bg-stone-800/90 border border-stone-700 hover:bg-stone-700 text-stone-200 text-xs font-medium flex items-center gap-1.5 transition-colors"
        >
          <Dices className="w-4 h-4 text-amber-400" />
          <span className="hidden md:inline">Casuale</span>
        </button>

        {/* Date Drawer / Calendar picker */}
        <button
          onClick={onOpenDrawer}
          title="Sfoglia mesi e date"
          className="p-2 rounded-lg bg-stone-800/90 border border-stone-700 hover:bg-stone-700 text-stone-200 text-xs font-medium flex items-center gap-1.5 transition-colors"
        >
          <CalendarIcon className="w-4 h-4" />
          <span className="hidden lg:inline">Sfoglia</span>
        </button>

        {/* Special Days / Birthdays */}
        <button
          onClick={onOpenSpecial}
          title="Compleanni & Feste speciali"
          className="p-2 rounded-lg bg-stone-800/90 border border-stone-700 hover:bg-stone-700 text-amber-300 text-xs font-medium flex items-center gap-1.5 transition-colors"
        >
          <Cake className="w-4 h-4" />
          <span className="hidden lg:inline">Eventi</span>
        </button>

        {/* Search */}
        <button
          onClick={onOpenSearch}
          title="Cerca tra le frasi"
          className="p-2 rounded-lg bg-stone-800/90 border border-stone-700 hover:bg-stone-700 text-stone-200 text-xs font-medium flex items-center gap-1.5 transition-colors"
        >
          <Search className="w-4 h-4" />
          <span className="hidden lg:inline">Cerca</span>
        </button>

        {/* Download Image */}
        <button
          onClick={onDownloadImage}
          title="Scarica foglio come immagine PNG (per WhatsApp)"
          className="p-2 rounded-lg bg-stone-800/90 border border-stone-700 hover:bg-stone-700 text-stone-200 text-xs font-medium flex items-center gap-1.5 transition-colors"
        >
          <Download className="w-4 h-4 text-emerald-400" />
          <span className="hidden xl:inline">Scarica</span>
        </button>

        {/* Print / PDF Suite */}
        <button
          onClick={onOpenPrint}
          title="Stampa calendario o esporta in PDF"
          className="px-3 py-2 rounded-lg bg-stone-800 border border-stone-600 hover:bg-stone-700 text-white text-xs font-semibold flex items-center gap-1.5 transition-colors shadow-sm"
        >
          <Printer className="w-4 h-4 text-red-400" />
          <span>Stampa / PDF</span>
        </button>

        {/* Share */}
        <button
          onClick={onShare}
          title="Condividi o copia frase"
          className="p-2 rounded-lg bg-stone-800/90 border border-stone-700 hover:bg-stone-700 text-stone-200 text-xs font-medium flex items-center gap-1.5 transition-colors"
        >
          <Share2 className="w-4 h-4" />
        </button>

        {/* Audio Toggle */}
        <button
          onClick={handleToggleSound}
          title={isMuted ? "Attiva suono strappo carta" : "Disattiva audio"}
          className="p-2 rounded-lg bg-stone-800/90 border border-stone-700 hover:bg-stone-700 text-stone-400 hover:text-stone-200 text-xs font-medium transition-colors"
        >
          {isMuted ? <VolumeX className="w-4 h-4 text-stone-500" /> : <Volume2 className="w-4 h-4 text-green-400" />}
        </button>
      </div>
    </header>
  );
};
