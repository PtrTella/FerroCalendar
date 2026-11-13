import React, { useState, useRef, useEffect, useCallback } from 'react';
import confetti from 'canvas-confetti';
import { CalendarDay } from '../data/calendarData';
import { CalendarLeaf } from './CalendarLeaf';
import { TopMount } from './TopMount';
import { soundCtrl } from '../utils/audio';

interface CalendarStackProps {
  currentDay: CalendarDay;
  nextDay: CalendarDay | null;
  prevDay: CalendarDay | null;
  year: number;
  onAdvanceDay: () => void;
  onRewindDay: () => void;
}

export const CalendarStack: React.FC<CalendarStackProps> = ({
  currentDay,
  nextDay,
  prevDay,
  year,
  onAdvanceDay,
  onRewindDay,
}) => {
  const [isTearing, setIsTearing] = useState(false);
  const [isRestoring, setIsRestoring] = useState(false);
  const touchStartX = useRef<number | null>(null);
  const touchStartY = useRef<number | null>(null);

  // Trigger confetti if birthday
  useEffect(() => {
    if (currentDay.isBirthday) {
      try {
        confetti({
          particleCount: 50,
          spread: 70,
          origin: { y: 0.6 },
          colors: ['#c92a2a', '#d93829', '#f59e0b', '#fbbf24', '#ffffff']
        });
      } catch {
        // Safe fallback
      }
    }
  }, [currentDay]);

  const handleTear = useCallback(() => {
    if (isTearing || !nextDay) return;
    setIsTearing(true);
    soundCtrl.playTearSound();

    setTimeout(() => {
      onAdvanceDay();
      setIsTearing(false);
    }, 700);
  }, [isTearing, nextDay, onAdvanceDay]);

  const handleRewind = useCallback(() => {
    if (isRestoring || !prevDay) return;
    setIsRestoring(true);
    soundCtrl.playFlipSound();
    onRewindDay();

    setTimeout(() => {
      setIsRestoring(false);
    }, 550);
  }, [isRestoring, prevDay, onRewindDay]);

  // Touch Swipe Handlers for mobile
  const handleTouchStart = (e: React.TouchEvent) => {
    touchStartX.current = e.touches[0].clientX;
    touchStartY.current = e.touches[0].clientY;
  };

  const handleTouchEnd = (e: React.TouchEvent) => {
    if (touchStartX.current === null || touchStartY.current === null) return;
    const diffX = e.changedTouches[0].clientX - touchStartX.current;
    const diffY = e.changedTouches[0].clientY - touchStartY.current;

    // Swipe left or swipe up -> Tear off!
    if ((diffX < -60 || diffY < -60) && Math.abs(diffX) > 40) {
      handleTear();
    }
    // Swipe right -> Rewind
    else if (diffX > 60 && Math.abs(diffY) < 50) {
      handleRewind();
    }

    touchStartX.current = null;
    touchStartY.current = null;
  };

  // Keyboard shortcut listener
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      // Don't intercept when user is typing in an input
      if (['INPUT', 'TEXTAREA'].includes((e.target as HTMLElement)?.tagName)) {
        return;
      }
      if (e.key === ' ' || e.key === 'ArrowRight') {
        e.preventDefault();
        handleTear();
      } else if (e.key === 'ArrowLeft') {
        e.preventDefault();
        handleRewind();
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [handleTear, handleRewind]);

  return (
    <div
      className="relative flex flex-col items-center justify-center py-2 px-3 sm:py-6"
      onTouchStart={handleTouchStart}
      onTouchEnd={handleTouchEnd}
    >
      {/* Real Top Cardboard Backer Mount */}
      <TopMount onTear={handleTear} canTear={!!nextDay && !isTearing} />

      {/* Sheet Stack Container */}
      <div className="relative w-full max-w-[390px] mx-auto mt-[-1px]">
        {/* Next Day Leaf (visible right underneath when tearing current leaf) */}
        {nextDay && (
          <div className="absolute inset-0 z-0">
            <CalendarLeaf
              day={nextDay}
              year={year}
              variant="stack"
              className="opacity-95 transform scale-[0.99] translate-y-[2px]"
            />
          </div>
        )}

        {/* Current Day Leaf (on top) */}
        <div className="relative z-10">
          <CalendarLeaf
            day={currentDay}
            year={year}
            isTearing={isTearing}
            isRestoring={isRestoring}
            onTear={handleTear}
            variant="interactive"
          />
        </div>
      </div>
    </div>
  );
};
