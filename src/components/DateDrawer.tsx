import React, { useState } from 'react';
import { X, Cake, Palmtree } from 'lucide-react';
import { CalendarDay, CALENDAR_DATA, MONTH_NAMES_CAPITALIZED } from '../data/calendarData';

interface DateDrawerProps {
  isOpen: boolean;
  onClose: () => void;
  currentDay: CalendarDay;
  onSelectDay: (day: CalendarDay) => void;
}

export const DateDrawer: React.FC<DateDrawerProps> = ({
  isOpen,
  onClose,
  currentDay,
  onSelectDay,
}) => {
  const [selectedMonth, setSelectedMonth] = useState<number>(currentDay.monthNumber);

  if (!isOpen) return null;

  const monthDays = CALENDAR_DATA.filter((d) => d.monthNumber === selectedMonth);

  return (
    <div className="no-print fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-4 bg-black/75 backdrop-blur-sm animate-fade-in">
      <div 
        className="relative w-full max-w-xl bg-stone-900 border border-stone-800 rounded-2xl shadow-2xl p-5 overflow-hidden flex flex-col max-h-[90vh]"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="flex items-center justify-between pb-3 border-b border-stone-800">
          <div>
            <h3 className="font-serif font-black text-xl text-stone-100">
              Sfoglia il Calendario
            </h3>
            <p className="text-xs text-stone-400">
              Scegli un mese e un giorno per aprirlo all'istante
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg bg-stone-800 hover:bg-stone-700 text-stone-400 hover:text-white transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Month Selector Pills */}
        <div className="flex flex-wrap gap-1.5 py-3 border-b border-stone-800/80">
          {MONTH_NAMES_CAPITALIZED.map((mName, idx) => {
            const mNum = idx + 1;
            const isCurrent = selectedMonth === mNum;
            return (
              <button
                key={mNum}
                onClick={() => setSelectedMonth(mNum)}
                className={`px-2.5 py-1 rounded-md text-xs font-semibold transition-all ${
                  isCurrent
                    ? 'bg-[#c92a2a] text-white shadow-sm'
                    : 'bg-stone-800 text-stone-400 hover:bg-stone-700 hover:text-stone-200'
                }`}
              >
                {mName}
              </button>
            );
          })}
        </div>

        {/* Days Grid */}
        <div className="overflow-y-auto py-4 flex-1">
          <div className="grid grid-cols-5 sm:grid-cols-7 gap-2">
            {monthDays.map((d) => {
              const isSelected = d.day === currentDay.day && d.monthNumber === currentDay.monthNumber;
              return (
                <button
                  key={d.day}
                  onClick={() => {
                    onSelectDay(d);
                    onClose();
                  }}
                  className={`
                    relative p-2.5 rounded-xl border flex flex-col items-center justify-between min-h-[58px] transition-all group
                    ${
                      isSelected
                        ? 'bg-red-950/70 border-red-500 text-white ring-1 ring-red-500'
                        : 'bg-stone-800/70 border-stone-700/60 hover:bg-stone-700/90 text-stone-200 hover:border-stone-500'
                    }
                  `}
                >
                  <span className="font-serif font-black text-lg leading-none group-hover:scale-105 transition-transform">
                    {d.day}
                  </span>
                  
                  {/* Indicators for special days */}
                  <div className="flex items-center gap-1 mt-1">
                    {d.isBirthday && (
                      <span title={`Compleanno: ${d.birthdayPerson || ''}`} className="text-amber-400">
                        <Cake className="w-3.5 h-3.5 animate-pulse" />
                      </span>
                    )}
                    {d.isFerie && (
                      <span title="Chiuso per Ferie" className="text-red-400">
                        <Palmtree className="w-3.5 h-3.5" />
                      </span>
                    )}
                  </div>
                </button>
              );
            })}
          </div>
        </div>

        {/* Legend */}
        <div className="pt-3 border-t border-stone-800 flex items-center justify-between text-[11px] text-stone-400">
          <div className="flex items-center gap-3">
            <span className="flex items-center gap-1">
              <Cake className="w-3.5 h-3.5 text-amber-400" /> Compleanni
            </span>
            <span className="flex items-center gap-1">
              <Palmtree className="w-3.5 h-3.5 text-red-400" /> Chiuso per Ferie
            </span>
          </div>
          <span className="font-mono text-stone-500">
            {currentDay.day} {currentDay.month}
          </span>
        </div>
      </div>
    </div>
  );
};
