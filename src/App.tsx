import React, { useState, useEffect, useCallback, useMemo } from 'react';
import { CALENDAR_DATA, CalendarDay } from './data/calendarData';
import { getTodayDayOfYear } from './utils/dates';
import { downloadDayAsPng } from './utils/canvasExport';
import { soundCtrl } from './utils/audio';

import { CalendarStack } from './components/CalendarStack';
import { Toolbar } from './components/Toolbar';
import { DateDrawer } from './components/DateDrawer';
import { SearchModal } from './components/SearchModal';
import { SpecialDaysModal } from './components/SpecialDaysModal';
import { ShareModal } from './components/ShareModal';
import { PrintModal } from './components/PrintModal';
import { PrintView, PrintMode } from './components/PrintView';

export const App: React.FC = () => {
  // Calendar year (2027 official from data.md, switchable to 2026/2028)
  const [year, setYear] = useState<number>(2027);

  // Parse initial index from URL hash or today's date
  const [currentIndex, setCurrentIndex] = useState<number>(() => {
    if (typeof window !== 'undefined' && window.location.hash) {
      const hash = window.location.hash.replace('#', '').toLowerCase();
      const parts = hash.split('-');
      if (parts.length === 2) {
        const dNum = parseInt(parts[0], 10);
        const mName = parts[1];
        const found = CALENDAR_DATA.findIndex(
          (d) => d.day === dNum && d.month.toLowerCase() === mName
        );
        if (found !== -1) return found;
      }
    }
    return getTodayDayOfYear();
  });

  // Modal open states
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [isSearchOpen, setIsSearchOpen] = useState(false);
  const [isSpecialOpen, setIsSpecialOpen] = useState(false);
  const [isShareOpen, setIsShareOpen] = useState(false);
  const [isPrintOpen, setIsPrintOpen] = useState(false);

  // Print preparation state
  const [printMode, setPrintMode] = useState<PrintMode>('single');
  const [daysToPrint, setDaysToPrint] = useState<CalendarDay[]>([CALENDAR_DATA[currentIndex]]);

  const currentDay = CALENDAR_DATA[currentIndex] || CALENDAR_DATA[0];
  const nextDay = currentIndex < CALENDAR_DATA.length - 1 ? CALENDAR_DATA[currentIndex + 1] : null;
  const prevDay = currentIndex > 0 ? CALENDAR_DATA[currentIndex - 1] : null;

  // Keep URL hash in sync with current day
  useEffect(() => {
    if (typeof window !== 'undefined') {
      const hash = `#${currentDay.day}-${currentDay.month}`;
      if (window.location.hash !== hash) {
        window.history.replaceState(null, '', hash);
      }
    }
  }, [currentDay]);

  // Handle hashchange event (e.g. browser back/forward)
  useEffect(() => {
    const handleHashChange = () => {
      const hash = window.location.hash.replace('#', '').toLowerCase();
      const parts = hash.split('-');
      if (parts.length === 2) {
        const dNum = parseInt(parts[0], 10);
        const mName = parts[1];
        const found = CALENDAR_DATA.findIndex(
          (d) => d.day === dNum && d.month.toLowerCase() === mName
        );
        if (found !== -1 && found !== currentIndex) {
          setCurrentIndex(found);
        }
      }
    };

    window.addEventListener('hashchange', handleHashChange);
    return () => window.removeEventListener('hashchange', handleHashChange);
  }, [currentIndex]);

  const advanceDay = useCallback(() => {
    if (currentIndex < CALENDAR_DATA.length - 1) {
      setCurrentIndex((prev) => prev + 1);
    }
  }, [currentIndex]);

  const rewindDay = useCallback(() => {
    if (currentIndex > 0) {
      setCurrentIndex((prev) => prev - 1);
    }
  }, [currentIndex]);

  const handleSelectDay = (day: CalendarDay) => {
    const idx = CALENDAR_DATA.findIndex((d) => d.dayOfYear === day.dayOfYear);
    if (idx !== -1) {
      setCurrentIndex(idx);
      soundCtrl.playFlipSound();
    }
  };

  const handleToday = () => {
    const todayIdx = getTodayDayOfYear();
    setCurrentIndex(todayIdx);
    soundCtrl.playFlipSound();
  };

  const handleRandom = () => {
    let rand = Math.floor(Math.random() * CALENDAR_DATA.length);
    if (rand === currentIndex) {
      rand = (rand + 1) % CALENDAR_DATA.length;
    }
    setCurrentIndex(rand);
    soundCtrl.playFlipSound();
  };

  const handleDownloadImage = () => {
    downloadDayAsPng(currentDay, year);
  };

  const handlePreparePrint = (mode: PrintMode, days: CalendarDay[]) => {
    setPrintMode(mode);
    setDaysToPrint(days);
  };

  return (
    <div className="min-h-screen flex flex-col justify-between overflow-x-hidden">
      {/* Top Application Toolbar */}
      <div className="no-print">
        <Toolbar
          onTear={advanceDay}
          onRewind={rewindDay}
          onToday={handleToday}
          onRandom={handleRandom}
          onOpenDrawer={() => setIsDrawerOpen(true)}
          onOpenSearch={() => setIsSearchOpen(true)}
          onOpenPrint={() => setIsPrintOpen(true)}
          onOpenSpecial={() => setIsSpecialOpen(true)}
          onDownloadImage={handleDownloadImage}
          onShare={() => setIsShareOpen(true)}
          canTear={currentIndex < CALENDAR_DATA.length - 1}
          canRewind={currentIndex > 0}
          year={year}
          onYearChange={setYear}
        />
      </div>

      {/* Main Interactive Calendar Area */}
      <main className="no-print flex-1 flex flex-col items-center justify-center p-2 sm:p-4">
        <CalendarStack
          currentDay={currentDay}
          nextDay={nextDay}
          prevDay={prevDay}
          year={year}
          onAdvanceDay={advanceDay}
          onRewindDay={rewindDay}
        />

        {/* Progress and status indicators */}
        <div className="mt-4 flex flex-col items-center gap-1.5 text-center select-none text-stone-400">
          <div className="flex items-center gap-2 text-xs font-mono font-medium">
            <span>Foglio {currentIndex + 1} di 365</span>
            <span>•</span>
            <span className="text-stone-300 font-serif font-bold">
              {currentDay.day} {currentDay.month} {year}
            </span>
          </div>

          <div className="w-48 h-1 bg-stone-800 rounded-full overflow-hidden">
            <div
              className="h-full bg-red-600 transition-all duration-300"
              style={{ width: `${((currentIndex + 1) / 365) * 100}%` }}
            ></div>
          </div>

          <p className="text-[11px] text-stone-500 font-medium hidden sm:block">
            Tocca il foglio o premi <kbd className="px-1.5 py-0.5 rounded bg-stone-800 border border-stone-700 text-stone-300 font-mono text-[10px]">Spazio</kbd> per strappare • <kbd className="px-1.5 py-0.5 rounded bg-stone-800 border border-stone-700 text-stone-300 font-mono text-[10px]">←</kbd> <kbd className="px-1.5 py-0.5 rounded bg-stone-800 border border-stone-700 text-stone-300 font-mono text-[10px]">→</kbd> per sfogliare
          </p>
        </div>
      </main>

      {/* Footer */}
      <footer className="no-print py-3 text-center text-xs text-stone-500 border-t border-stone-800/80">
        <p>
          FerroCalendar 2027 • Andalò Gianni srl • Via Serraglio, 46 - Imola (BO) • Meccanica di alta precisione dal 1968
        </p>
      </footer>

      {/* Modals and Drawers */}
      <DateDrawer
        isOpen={isDrawerOpen}
        onClose={() => setIsDrawerOpen(false)}
        currentDay={currentDay}
        onSelectDay={handleSelectDay}
      />

      <SearchModal
        isOpen={isSearchOpen}
        onClose={() => setIsSearchOpen(false)}
        onSelectDay={handleSelectDay}
      />

      <SpecialDaysModal
        isOpen={isSpecialOpen}
        onClose={() => setIsSpecialOpen(false)}
        onSelectDay={handleSelectDay}
      />

      <ShareModal
        isOpen={isShareOpen}
        onClose={() => setIsShareOpen(false)}
        day={currentDay}
        year={year}
      />

      <PrintModal
        isOpen={isPrintOpen}
        onClose={() => setIsPrintOpen(false)}
        currentDay={currentDay}
        year={year}
        onPreparePrint={handlePreparePrint}
      />

      {/* Dedicated Invisible Print View (activated only on @media print) */}
      <PrintView
        mode={printMode}
        daysToPrint={daysToPrint}
        year={year}
      />
    </div>
  );
};

export default App;
