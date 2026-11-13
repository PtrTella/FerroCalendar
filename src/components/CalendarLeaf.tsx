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
  printLayout?: 'single' | 'grid4';
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
  printLayout,
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
  const isSinglePrint = isPrint && printLayout === 'single';
  const isGridPrint = isPrint && printLayout === 'grid4';

  return (
    <div
      id={id}
      onClick={isInteractive && onTear ? onTear : undefined}
      className={`
        relative mx-auto select-none flex flex-col justify-between
        ${isGridPrint 
          ? 'w-[86mm] h-[125mm] max-h-[125mm] overflow-hidden bg-white text-black' 
          : isSinglePrint 
          ? 'w-full max-w-none aspect-[1/1.46] bg-white text-black printable-sheet' 
          : 'w-full max-w-[390px] aspect-[1/1.46] bg-paper-texture rounded-b-md text-calendar-charcoal shadow-paper transition-transform duration-200'}
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
      <div 
        className={`relative z-10 text-center flex flex-col items-center ${
          isSinglePrint ? 'pt-[28mm] px-10' : isGridPrint ? 'pt-[9mm] px-3' : 'pt-12 sm:pt-14 px-8'
        }`}
      >
        {/* Day of the week in bold serif (lowercase as in original image) */}
        <h2 
          className={`font-serif font-black tracking-wide text-stone-900 lowercase select-none ${
            isSinglePrint ? 'text-3xl sm:text-4xl' : isGridPrint ? 'text-[13px] leading-tight' : 'text-2xl sm:text-3xl'
          }`}
        >
          {dayOfWeek}
        </h2>

        {/* Giant Didone Date Number (e.g. 25) */}
        <div className={`flex items-center justify-center leading-none ${
          isSinglePrint ? 'my-1' : isGridPrint ? 'my-[-3px]' : 'my-[-4px] sm:my-[-6px]'
        }`}>
          <span 
            className={`font-serif font-black tracking-tighter text-[#161616] select-none ${
              isSinglePrint 
                ? 'text-[124px] sm:text-[136px]' 
                : isGridPrint 
                ? 'text-[46px] leading-none' 
                : 'text-[96px] sm:text-[120px]'
            }`}
            style={{
              fontFeatureSettings: '"pnum" 1, "lnum" 1',
              textShadow: isPrint ? 'none' : '1px 1px 0px rgba(0,0,0,0.08)'
            }}
          >
            {day.day}
          </span>
        </div>

        {/* Month in bold serif (lowercase as in original image) */}
        <h3 
          className={`font-serif font-extrabold tracking-tight text-stone-900 lowercase select-none ${
            isSinglePrint ? 'text-3xl sm:text-4xl mt-1' : isGridPrint ? 'text-[13px] leading-tight mt-0.5' : 'text-2xl sm:text-3xl mt-0.5'
          }`}
        >
          {day.month}
        </h3>

        {/* Saint / Onomastico (or empty spacer) */}
        <p 
          className={`font-serif italic text-stone-600 select-none ${
            isSinglePrint ? 'text-sm mt-2' : isGridPrint ? 'text-[8.5px] mt-0.5' : 'text-[11px] sm:text-xs mt-1'
          }`}
        >
          {day.saint ? day.saint : ' '}
        </p>

        {/* Special status badge: CHIUSO PER FERIE or Birthday */}
        {day.isFerie && (
          <div className={isGridPrint ? 'mt-0.5' : 'mt-2'}>
            <span className={
              isGridPrint 
                ? 'inline-block text-[7px] leading-tight px-1.5 py-[1px] font-bold text-red-800 bg-red-50 border border-dashed border-red-600 rounded' 
                : `stamp-ferie ${isSinglePrint ? 'text-sm px-3.5 py-1' : 'text-xs sm:text-sm'}`
            }>
              CHIUSO PER FERIE
            </span>
          </div>
        )}

        {!day.isFerie && day.isBirthday && day.birthdayPerson && (
          <div className={isGridPrint ? 'mt-0.5' : 'mt-1.5'}>
            <span className={
              isGridPrint 
                ? 'inline-block text-[7px] leading-tight px-1.5 py-[1px] font-bold text-amber-900 bg-amber-100 border border-amber-600 rounded-full tracking-normal' 
                : `stamp-bday ${isSinglePrint ? 'text-xs px-3 py-1' : 'text-[10px] sm:text-xs'}`
            }>
              ★ {day.birthdayPerson.toLowerCase() === 'a me' ? 'IL MIO COMPLEANNO' : `COMPLEANNO ${day.birthdayPerson.toUpperCase()}`} ★
            </span>
          </div>
        )}
      </div>

      {/* MIDDLE SECTION: The Daily Quote & Closing / Dedication */}
      <div 
        className={`relative z-10 my-auto text-center flex flex-col items-center justify-center ${
          isSinglePrint ? 'px-12 py-3' : isGridPrint ? 'px-3 py-0.5 max-h-[38%] overflow-hidden' : 'px-9 py-2'
        }`}
      >
        <div 
          className={`mx-auto ${
            isSinglePrint 
              ? 'max-w-[460px] space-y-2.5' 
              : isGridPrint 
              ? 'max-w-[240px] space-y-0.5' 
              : 'max-w-[300px] space-y-1.5 sm:space-y-2'
          }`}
        >
          {quoteLines.map((line, idx) => (
            <p
              key={idx}
              className={`font-serif italic font-bold tracking-normal text-stone-900 ${
                isSinglePrint 
                  ? 'text-xl sm:text-2xl leading-relaxed' 
                  : isGridPrint 
                  ? 'text-[9.5px] leading-snug' 
                  : 'text-base sm:text-lg leading-snug sm:leading-relaxed'
              }`}
            >
              {line}
            </p>
          ))}
        </div>

        {/* Signature / Ending wish if present */}
        {day.closing && (
          <div className={`border-t border-stone-300/60 w-3/4 ${isSinglePrint ? 'mt-4 pt-1.5' : isGridPrint ? 'mt-1 pt-0.5' : 'mt-3 pt-1'}`}>
            <p className={`font-serif italic font-semibold text-stone-800 tracking-wide ${
              isSinglePrint ? 'text-base' : isGridPrint ? 'text-[8.5px]' : 'text-xs sm:text-sm'
            }`}>
              {day.closing}
            </p>
          </div>
        )}
      </div>

      {/* BOTTOM FOOTER SECTION: Classic Calendar Info Line */}
      <div 
        className={`relative z-10 text-center select-none ${
          isSinglePrint ? 'pb-[22mm] px-8' : isGridPrint ? 'pb-[7mm] px-2' : 'pb-8 sm:pb-9 px-6'
        }`}
      >
        <div 
          className={`flex items-center justify-center gap-1.5 font-serif tracking-wider whitespace-nowrap overflow-hidden ${
            isSinglePrint 
              ? 'text-[10px] sm:text-[11px] text-stone-600' 
              : isGridPrint 
              ? 'text-[6.5px] text-stone-600' 
              : 'text-[7.5px] sm:text-[8.5px] text-stone-600'
          }`}
        >
          <span>www.andalogianni.com</span>
          <span className="text-stone-400">•</span>
          <span className="font-semibold text-stone-700">Andalò Gianni - Imola</span>
          <span className="text-stone-400">•</span>
          <span className="font-mono">{day.dayOfYear}/365</span>
        </div>
      </div>

      {/* Corner tear prompt in interactive mode */}
      {isInteractive && !isTearing && (
        <div 
          className="absolute bottom-4 right-4 text-stone-400/70 hover:text-red-600 transition-colors pointer-events-none text-[8.5px] uppercase tracking-wider font-mono flex items-center gap-0.5"
          title="Tocca o clicca per strappare"
        >
          <span>strappa ⤓</span>
        </div>
      )}
    </div>
  );
};
