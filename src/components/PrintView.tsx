import React from 'react';
import { CalendarDay } from '../data/calendarData';
import { CalendarLeaf } from './CalendarLeaf';

export type PrintMode = 'single' | 'month' | 'all' | 'grid4';

interface PrintViewProps {
  mode: PrintMode;
  daysToPrint: CalendarDay[];
  year: number;
  includeCuttingMarks?: boolean;
}

export const PrintView: React.FC<PrintViewProps> = ({
  mode,
  daysToPrint,
  year,
  includeCuttingMarks = true,
}) => {
  if (daysToPrint.length === 0) return null;

  // Mode: 4 per page on A4 with cut marks
  if (mode === 'grid4') {
    // Group days in chunks of 4
    const chunks: CalendarDay[][] = [];
    for (let i = 0; i < daysToPrint.length; i += 4) {
      chunks.push(daysToPrint.slice(i, i + 4));
    }

    return (
      <div className="print-only hidden print:block bg-white text-black p-0 m-0">
        <style>{`
          @media print {
            @page {
              size: A4 portrait;
              margin: 10mm;
            }
            .a4-sheet {
              width: 100%;
              height: 277mm;
              display: grid;
              grid-template-columns: 1fr 1fr;
              grid-template-rows: 1fr 1fr;
              gap: 8mm;
              page-break-after: always;
              break-after: page;
              box-sizing: border-box;
            }
            .grid-leaf-wrapper {
              position: relative;
              width: 100%;
              height: 100%;
              display: flex;
              align-items: center;
              justify-content: center;
            }
          }
        `}</style>
        {chunks.map((group, pageIdx) => (
          <div key={pageIdx} className="a4-sheet">
            {group.map((day) => (
              <div key={day.dayOfYear} className="grid-leaf-wrapper">
                {/* Optional cut marks */}
                {includeCuttingMarks && (
                  <div className="absolute inset-0 border border-dashed border-stone-400 pointer-events-none"></div>
                )}
                <div className="w-full h-full transform scale-[0.85] flex items-center justify-center">
                  <CalendarLeaf
                    day={day}
                    year={year}
                    variant="print"
                    className="w-[95%] h-[95%]"
                  />
                </div>
              </div>
            ))}
          </div>
        ))}
      </div>
    );
  }

  // Mode: 1 leaf per page (A6 or A5 format)
  return (
    <div className="print-only hidden print:block bg-white text-black p-0 m-0">
      <style>{`
        @media print {
          @page {
            size: 105mm 155mm; /* Classic desk calendar tear-off format (A6+) */
            margin: 0;
          }
          .single-print-page {
            width: 105mm;
            height: 155mm;
            page-break-after: always;
            break-after: page;
            display: flex;
            align-items: center;
            justify-content: center;
            box-sizing: border-box;
            padding: 4mm;
            background: white;
          }
        }
      `}</style>

      {daysToPrint.map((day) => (
        <div key={day.dayOfYear} className="single-print-page">
          <CalendarLeaf
            day={day}
            year={year}
            variant="print"
            className="w-full h-full max-w-none shadow-none"
          />
        </div>
      ))}
    </div>
  );
};
