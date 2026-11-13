import React, { useState, useMemo } from 'react';
import { X, Search as SearchIcon, ArrowRight, Cake, Palmtree } from 'lucide-react';
import { CalendarDay, CALENDAR_DATA } from '../data/calendarData';

interface SearchModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSelectDay: (day: CalendarDay) => void;
}

export const SearchModal: React.FC<SearchModalProps> = ({
  isOpen,
  onClose,
  onSelectDay,
}) => {
  const [query, setQuery] = useState('');

  const results = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return [];
    return CALENDAR_DATA.filter((d) => {
      const matchQuote = d.quote.toLowerCase().includes(q);
      const matchClosing = d.closing ? d.closing.toLowerCase().includes(q) : false;
      const matchSaint = d.saint ? d.saint.toLowerCase().includes(q) : false;
      const matchPerson = d.birthdayPerson ? d.birthdayPerson.toLowerCase().includes(q) : false;
      const matchDate = `${d.day} ${d.month}`.toLowerCase().includes(q);
      return matchQuote || matchClosing || matchSaint || matchPerson || matchDate;
    });
  }, [query]);

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-4 bg-black/75 backdrop-blur-sm animate-fade-in">
      <div 
        className="relative w-full max-w-xl bg-stone-900 border border-stone-800 rounded-2xl shadow-2xl p-5 overflow-hidden flex flex-col max-h-[85vh]"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="flex items-center justify-between pb-3 border-b border-stone-800">
          <div>
            <h3 className="font-serif font-black text-xl text-stone-100 flex items-center gap-2">
              <SearchIcon className="w-5 h-5 text-red-500" />
              Cerca tra le 365 frasi
            </h3>
            <p className="text-xs text-stone-400">
              Digita una parola, un nome (es. Ferro, Ale, Gigi...) o un giorno
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg bg-stone-800 hover:bg-stone-700 text-stone-400 hover:text-white transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Search Input */}
        <div className="relative my-3">
          <input
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Es: ferro, tornio, ferie, rispetto, amore..."
            autoFocus
            className="w-full bg-stone-800/90 border border-stone-700 rounded-xl px-4 py-2.5 pl-10 text-stone-100 placeholder-stone-500 focus:outline-none focus:ring-2 focus:ring-red-500 font-medium text-sm"
          />
          <SearchIcon className="w-4 h-4 text-stone-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
          {query && (
            <button
              onClick={() => setQuery('')}
              className="absolute right-3 top-1/2 -translate-y-1/2 text-stone-400 hover:text-white text-xs bg-stone-700 px-1.5 py-0.5 rounded"
            >
              cancella
            </button>
          )}
        </div>

        {/* Results Info */}
        <div className="text-[11px] text-stone-400 mb-2 font-mono">
          {query ? `Trovati ${results.length} risultati` : 'Suggerimenti: cerca "ferie", "auguri", "tornio", "fresa", o nomi dei colleghi'}
        </div>

        {/* Results List */}
        <div className="overflow-y-auto flex-1 space-y-2 pr-1">
          {results.map((d) => (
            <button
              key={`${d.monthNumber}-${d.day}`}
              onClick={() => {
                onSelectDay(d);
                onClose();
              }}
              className="w-full text-left p-3 rounded-xl bg-stone-800/60 hover:bg-stone-800 border border-stone-700/60 hover:border-red-500/60 transition-all flex items-start justify-between gap-3 group"
            >
              <div className="flex-1">
                <div className="flex items-center gap-2 mb-1">
                  <span className="font-serif font-black text-red-400 text-sm">
                    {d.day} {d.month}
                  </span>
                  {d.isBirthday && (
                    <span className="inline-flex items-center gap-1 text-[10px] bg-amber-950/80 text-amber-300 border border-amber-700/60 px-1.5 py-0.2 rounded-full">
                      <Cake className="w-3 h-3" /> {d.birthdayPerson}
                    </span>
                  )}
                  {d.isFerie && (
                    <span className="inline-flex items-center gap-1 text-[10px] bg-red-950/80 text-red-300 border border-red-700/60 px-1.5 py-0.2 rounded-full">
                      <Palmtree className="w-3 h-3" /> Ferie
                    </span>
                  )}
                </div>
                <p className="font-serif italic text-xs text-stone-300 line-clamp-2">
                  "{d.quote.replace(/\n/g, ' ')}"
                </p>
                {d.closing && (
                  <p className="font-serif italic text-[11px] text-stone-400 font-semibold mt-0.5">
                    — {d.closing}
                  </p>
                )}
              </div>
              <ArrowRight className="w-4 h-4 text-stone-500 group-hover:text-red-400 group-hover:translate-x-1 transition-all flex-shrink-0 mt-2" />
            </button>
          ))}

          {query && results.length === 0 && (
            <div className="text-center py-8 text-stone-500 text-sm">
              Nessuna perla trovata per "{query}". Prova con un'altra parola!
            </div>
          )}
        </div>
      </div>
    </div>
  );
};
