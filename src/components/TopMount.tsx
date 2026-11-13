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
      <div className="relative bg-gradient-to-b from-stone-950 via-stone-900 to-stone-950 text-white rounded-t-lg pt-3 pb-2 px-3 sm:px-4 shadow-xl border-t border-x border-stone-800 overflow-hidden">
        {/* Subtle texture highlight */}
        <div className="absolute inset-0 bg-white/5 pointer-events-none"></div>

        {/* Brand layout mimicking the original photo with Andalò Gianni details */}
        <div className="flex items-center justify-between gap-1.5 sm:gap-2 relative z-10">
          {/* Left sub-info */}
          <div className="text-[8px] sm:text-[9px] text-stone-300 leading-tight font-medium flex-1">
            <p className="font-bold text-white uppercase tracking-wider">Andalò Gianni srl</p>
            <p className="text-stone-300">Via Serraglio, 46 - Imola (BO)</p>
            <p className="text-[7.5px] sm:text-[8px] text-stone-400">Tel. 0542 640387</p>
          </div>

          {/* Central Logo Box */}
          <div className="flex flex-col items-center flex-shrink-0 mx-1">
            <div className="bg-white px-2 py-0.5 rounded-md shadow-md border border-stone-200 flex items-center justify-center">
              <img 
                src="./andalo-logo.png" 
                alt="Andalò Gianni - Meccanica di alta precisione" 
                className="h-6 sm:h-7 w-auto object-contain"
              />
            </div>
            <span className="text-[7px] sm:text-[7.5px] text-stone-300 tracking-wider uppercase font-semibold mt-0.5">
              Meccanica di precisione dal 1968
            </span>
          </div>

          {/* Right sub-info */}
          <div className="text-[8px] sm:text-[9px] text-stone-300 text-right leading-tight font-medium flex-1">
            <p className="font-bold text-white">www.andalogianni.com</p>
            <p className="text-stone-300">info@andalogianni.com</p>
            <p className="text-[7.5px] sm:text-[8px] text-amber-400 font-bold uppercase tracking-wide">
              Edizione Ferro 2027
            </p>
          </div>
        </div>

        {/* Silver staples/metal fasteners */}
        <div className="flex justify-between items-center px-6 mt-1.5 pt-1 border-t border-stone-800/80">
          <div className="w-4 h-1 bg-stone-400 rounded-sm shadow-inner border border-stone-600"></div>
          <span className="text-[8px] uppercase tracking-widest text-stone-400 font-mono">
            CALENDARIO A STRAPPO D'OFFICINA
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
