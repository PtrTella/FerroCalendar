import React from 'react';

interface TopMountProps {
  onTear?: () => void;
  canTear?: boolean;
}

export const TopMount: React.FC<TopMountProps> = ({ onTear, canTear = true }) => {
  return (
    <div className="relative w-full max-w-[390px] mx-auto select-none">
      {/* Top hanging eyelet */}
      <div className="absolute -top-3 left-1/2 -translate-x-1/2 w-4 h-4 rounded-full bg-stone-700 border-2 border-stone-900 shadow-inner z-20 flex items-center justify-center">
        <div className="w-1.5 h-1.5 rounded-full bg-stone-900"></div>
      </div>

      {/* Main Cardboard Holder Bar */}
      <div className="relative bg-gradient-to-b from-stone-950 via-stone-900 to-stone-950 text-white rounded-t-lg pt-3 pb-2 px-4 shadow-xl border-t border-x border-stone-800 overflow-hidden">
        {/* Subtle texture highlight */}
        <div className="absolute inset-0 bg-white/5 pointer-events-none"></div>

        {/* Brand layout mimicking the original photo */}
        <div className="flex items-center justify-between gap-2 relative z-10">
          {/* Left sub-info */}
          <div className="text-[9px] text-stone-400 leading-tight font-medium">
            <p className="font-bold text-stone-200 uppercase tracking-wider">Officina Ferro</p>
            <p>Via dell'Acciaio, 1</p>
          </div>

          {/* Central Logo Pill */}
          <div className="flex flex-col items-center">
            <div className="bg-[#c92a2a] text-white px-3 py-0.5 rounded-full font-black text-sm tracking-widest shadow-md border border-red-400 flex items-center gap-1">
              <span>FERRO</span>
            </div>
            <span className="text-[8px] text-stone-300 tracking-wider uppercase font-semibold mt-0.5">
              Efficienza nelle tue mani
            </span>
          </div>

          {/* Right sub-info */}
          <div className="text-[9px] text-stone-400 text-right leading-tight font-medium">
            <p className="font-bold text-stone-200">www.ferrocalendar.it</p>
            <p>365 giorni senza filtri</p>
          </div>
        </div>

        {/* Silver staples/metal fasteners */}
        <div className="flex justify-between items-center px-6 mt-1.5 pt-1 border-t border-stone-800/80">
          <div className="w-4 h-1 bg-stone-400 rounded-sm shadow-inner border border-stone-600"></div>
          <span className="text-[8px] uppercase tracking-widest text-stone-400 font-mono">
            CALENDARIO A STRAPPO
          </span>
          <div className="w-4 h-1 bg-stone-400 rounded-sm shadow-inner border border-stone-600"></div>
        </div>
      </div>

      {/* Perforation Tear Guide */}
      <div 
        onClick={canTear ? onTear : undefined}
        title={canTear ? "Clicca per strappare il foglio!" : ""}
        className={`relative h-3 bg-[#e8e2d5] border-x border-stone-400/40 flex items-center justify-center overflow-hidden cursor-pointer group transition-colors ${canTear ? 'hover:bg-[#dfd7c7]' : ''}`}
      >
        {/* Dashed perforation cut lines */}
        <div className="w-full h-full perforation-line opacity-70 group-hover:opacity-100 transition-opacity"></div>
        
        {/* Little tear label hint */}
        {canTear && (
          <div className="absolute text-[7px] uppercase font-bold tracking-widest text-stone-500/70 group-hover:text-red-700 bg-[#e8e2d5]/90 px-2 rounded-full border border-stone-400/30">
            ✂ strappa qui
          </div>
        )}
      </div>
    </div>
  );
};
