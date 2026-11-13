import React from 'react';
import { CalendarDay } from '../data/calendarData';
import { CalendarBorder } from './CalendarBorder';
import { getDayOfWeek } from '../utils/dates';

interface CalendarLeafProps {
  day: CalendarDay;
  year?: number;
  isTearing?: boolean;
  isRestoring?: boolean;
  onTear?: () => void;
  variant?: 'interactive' | 'print' | 'stack';
  className?: string;
  id?: string;
}

export const CalendarLeaf: React.FC<CalendarLeafProps> = ({
  day,
  year = 2027,
  isTearing = false,
  isRestoring = false,
  onTear,
  variant = 'interactive',
  className = '',
  id,
}) => {
  const dayOfWeek = getDayOfWeek(day.day, day.monthNumber, year);

  // Split quote lines to preserve the poetry/strophe structure
  const quoteLines = day.quote.split('\n').filter(l => l.trim().length > 0);

  // Dynamic animation class
  let animClass = '';
  if (isTearing) {
    animClass = 'animate-tear pointer-events-none z-30';
  } else if (isRestoring) {
    animClass = 'animate-tear-restore z-20';
  }

  const isInteractive = variant === 'interactive';
  const isPrint = variant === 'print';

  return (
    <div
      id={id}
      onClick={isInteractive && onTear ? onTear : undefined}
      className={`
        relative w-full max-w-[390px] aspect-[1/1.46] mx-auto 
        bg-paper-texture rounded-b-md text-calendar-charcoal 
        flex flex-col justify-between select-none
        ${isPrint ? 'printable-sheet border border-stone-200' : 'shadow-paper transition-transform duration-200'}
        ${isInteractive ? 'cursor-pointer hover:shadow-2xl' : ''}
        ${animClass}
        ${className}
      `}
      style={{
        boxSizing: 'border-box',
      }}
    >
      {/* SVG Hand-Drawn Distressed Double Grunge Border & Year Ribbon */}
      <CalendarBorder year={year} />

      {/* TOP SECTION: Day of Week & Giant Date */}
      <div className="relative z-10 pt-9 px-8 text-center flex flex-col items-center">
        {/* Day of the week in bold serif (lowercase as in original image) */}
        <h2 className="font-serif font-black text-2xl sm:text-3xl tracking-wide text-stone-900 lowercase select-none">
          {dayOfWeek}
        </h2>

        {/* Giant Didone Date Number (e.g. 25) */}
        <div className="my-[-4px] sm:my-[-8px] flex items-center justify-center leading-none">
          <span 
            className="font-serif font-black text-[96px] sm:text-[124px] tracking-tighter text-[#161616] select-none"
            style={{
              fontFeatureSettings: '"pnum" 1, "lnum" 1',
              textShadow: '1px 1px 0px rgba(0,0,0,0.08)'
            }}
          >
            {day.day}
          </span>
        </div>

        {/* Month in bold serif (lowercase as in original image) */}
        <h3 className="font-serif font-extrabold text-2xl sm:text-3xl tracking-tight text-stone-900 lowercase select-none -mt-2">
          {day.month}
        </h3>

        {/* Saint / Onomastico (or empty spacer) */}
        <p className="font-serif italic text-[11px] sm:text-xs text-stone-600 mt-1 select-none">
          {day.saint ? day.saint : ' '}
        </p>

        {/* Special status badge: CHIUSO PER FERIE or Birthday */}
        {day.isFerie && (
          <div className="mt-2 animate-bounce-subtle">
            <span className="stamp-ferie text-xs sm:text-sm">
              CHIUSO PER FERIE
            </span>
          </div>
        )}

        {!day.isFerie && day.isBirthday && day.birthdayPerson && (
          <div className="mt-1.5">
            <span className="stamp-bday text-[10px] sm:text-xs">
              ★ {day.birthdayPerson.toLowerCase() === 'a me' ? 'IL MIO COMPLEANNO' : `COMPLEANNO ${day.birthdayPerson.toUpperCase()}`} ★
            </span>
          </div>
        )}
      </div>

      {/* MIDDLE SECTION: The Daily Quote & Closing / Dedication */}
      <div className="relative z-10 px-9 py-2 my-auto text-center flex flex-col items-center justify-center">
        <div className="max-w-[300px] mx-auto space-y-1.5 sm:space-y-2">
          {quoteLines.map((line, idx) => (
            <p
              key={idx}
              className="font-serif italic font-bold text-base sm:text-lg leading-snug sm:leading-relaxed text-stone-900 tracking-normal"
            >
              {line}
            </p>
          ))}
        </div>

        {/* Signature / Ending wish if present */}
        {day.closing && (
          <div className="mt-3 pt-1 border-t border-stone-300/60 w-3/4">
            <p className="font-serif italic font-semibold text-xs sm:text-sm text-stone-800 tracking-wide">
              {day.closing}
            </p>
          </div>
        )}
      </div>

      {/* BOTTOM FOOTER SECTION: Classic Calendar Info Line */}
      <div className="relative z-10 pb-4 px-8 text-center">
        <div className="flex items-center justify-center gap-1.5 text-[8px] sm:text-[9px] text-stone-500 font-serif tracking-wider">
          <span>www.ferrocalendar.it</span>
          <span>•</span>
          <span>Officina & Verità</span>
          <span>•</span>
          <span>{day.dayOfYear}/365</span>
        </div>
      </div>

      {/* Corner tear prompt in interactive mode */}
      {isInteractive && !isTearing && (
        <div 
          className="absolute bottom-2 right-2 text-stone-400/70 hover:text-red-600 transition-colors pointer-events-none text-[9px] uppercase tracking-wider font-mono flex items-center gap-0.5"
          title="Tocca o clicca per strappare"
        >
          <span>strappa ⤓</span>
        </div>
      )}
    </div>
  );
};
