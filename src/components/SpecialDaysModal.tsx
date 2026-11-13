import React from 'react';
import { X, Cake, Palmtree, Sparkles, ArrowRight } from 'lucide-react';
import { CalendarDay, CALENDAR_DATA } from '../data/calendarData';

interface SpecialDaysModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSelectDay: (day: CalendarDay) => void;
}

export const SpecialDaysModal: React.FC<SpecialDaysModalProps> = ({
  isOpen,
  onClose,
  onSelectDay,
}) => {
  if (!isOpen) return null;

  const birthdays = CALENDAR_DATA.filter((d) => d.isBirthday);
  const ferie = CALENDAR_DATA.filter((d) => d.isFerie);

  return (
    <div className="no-print fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-4 bg-black/75 backdrop-blur-sm animate-fade-in">
      <div 
        className="relative w-full max-w-xl bg-stone-900 border border-stone-800 rounded-2xl shadow-2xl p-5 overflow-hidden flex flex-col max-h-[85vh]"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="flex items-center justify-between pb-3 border-b border-stone-800">
          <div>
            <h3 className="font-serif font-black text-xl text-stone-100 flex items-center gap-2">
              <Sparkles className="w-5 h-5 text-amber-400" />
              Compleanni & Giorni Speciali
            </h3>
            <p className="text-xs text-stone-400">
              I compleanni dei ragazzi dell'officina e le chiusure per ferie
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg bg-stone-800 hover:bg-stone-700 text-stone-400 hover:text-white transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Content Tabs / Sections */}
        <div className="overflow-y-auto flex-1 space-y-5 py-4 pr-1">
          {/* Birthdays Section */}
          <div>
            <h4 className="text-xs font-bold uppercase tracking-wider text-amber-400 flex items-center gap-1.5 mb-2.5">
              <Cake className="w-4 h-4" /> Compleanni & Dediche ({birthdays.length})
            </h4>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
              {birthdays.map((d) => (
                <button
                  key={`${d.monthNumber}-${d.day}`}
                  onClick={() => {
                    onSelectDay(d);
                    onClose();
                  }}
                  className={`
                    p-3 rounded-xl border text-left transition-all flex items-center justify-between group
                    ${d.birthdayPerson?.toLowerCase() === 'ferro' 
                      ? 'bg-red-950/60 border-red-500/80 hover:bg-red-900/60 ring-1 ring-red-500/50' 
                      : 'bg-stone-800/60 border-stone-700/60 hover:bg-stone-800 hover:border-amber-500/60'
                    }
                  `}
                >
                  <div>
                    <div className="flex items-center gap-1.5">
                      <span className="font-serif font-black text-white text-sm">
                        {d.day} {d.month}
                      </span>
                      {d.birthdayPerson?.toLowerCase() === 'ferro' && (
                        <span className="text-[9px] bg-red-600 text-white font-bold px-1.5 py-0.2 rounded-full uppercase">
                          VIP
                        </span>
                      )}
                    </div>
                    <p className="text-xs font-semibold text-amber-300 mt-0.5">
                      {d.birthdayPerson ? `Auguri, ${d.birthdayPerson}` : d.closing}
                    </p>
                  </div>
                  <ArrowRight className="w-4 h-4 text-stone-500 group-hover:text-amber-400 group-hover:translate-x-1 transition-all" />
                </button>
              ))}
            </div>
          </div>

          {/* Ferie Section */}
          <div>
            <h4 className="text-xs font-bold uppercase tracking-wider text-red-400 flex items-center gap-1.5 mb-2.5">
              <Palmtree className="w-4 h-4" /> Chiuso per Ferie ({ferie.length})
            </h4>
            <div className="grid grid-cols-2 sm:grid-cols-3 gap-2">
              {ferie.map((d) => (
                <button
                  key={`${d.monthNumber}-${d.day}`}
                  onClick={() => {
                    onSelectDay(d);
                    onClose();
                  }}
                  className="p-2.5 rounded-xl bg-stone-800/60 hover:bg-stone-800 border border-stone-700/60 hover:border-red-500/60 text-left transition-all group flex items-center justify-between"
                >
                  <span className="font-serif font-bold text-xs text-stone-300 group-hover:text-white">
                    {d.day} {d.month}
                  </span>
                  <Palmtree className="w-3.5 h-3.5 text-red-400 group-hover:scale-110 transition-transform" />
                </button>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
