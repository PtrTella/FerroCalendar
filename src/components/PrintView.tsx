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

  // Mode: 4 per page on A4 with SINGLE cut lines (1 horizontal, 1 vertical)
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
              margin: 0;
            }
            html, 
            body, 
            #root, 
            #root > div {
              background: #ffffff !important;
              background-color: #ffffff !important;
              background-image: none !important;
              color: #000000 !important;
              margin: 0 !important;
              padding: 0 !important;
              width: 210mm !important;
              height: auto !important;
            }
            .a4-grid-sheet {
              width: 210mm;
              height: 297mm;
              max-height: 297mm;
              margin: 0 !important;
              padding: 0 !important;
              position: relative;
              display: grid;
              grid-template-columns: 105mm 105mm;
              grid-template-rows: 148.5mm 148.5mm;
              gap: 0;
              page-break-after: always;
              break-after: page;
              page-break-inside: avoid;
              break-inside: avoid;
              box-sizing: border-box;
              background: #ffffff !important;
              overflow: hidden;
            }
            .grid-quadrant {
              width: 105mm;
              height: 148.5mm;
              max-width: 105mm;
              max-height: 148.5mm;
              box-sizing: border-box;
              display: flex;
              align-items: center;
              justify-content: center;
              padding: 4mm 4.5mm;
              background: #ffffff !important;
              overflow: hidden;
              position: relative;
            }
            /* Single Cut Guidelines: 1 vertical, 1 horizontal across the entire A4 */
            .cut-guide-vertical {
              position: absolute;
              left: 105mm;
              top: 0;
              bottom: 0;
              width: 0;
              border-left: 1px dashed #9ca3af;
              pointer-events: none;
              z-index: 30;
            }
            .cut-guide-horizontal {
              position: absolute;
              top: 148.5mm;
              left: 0;
              right: 0;
              height: 0;
              border-top: 1px dashed #9ca3af;
              pointer-events: none;
              z-index: 30;
            }
            .cut-tick {
              position: absolute;
              background: #374151;
              pointer-events: none;
              z-index: 35;
            }
          }
        `}</style>

        {chunks.map((group, pageIdx) => {
          // Always fill 4 quadrants so grid spacing and borders are strictly preserved
          const quadrantItems: (CalendarDay | null)[] = [...group];
          while (quadrantItems.length < 4) {
            quadrantItems.push(null);
          }

          return (
            <div key={pageIdx} className="a4-grid-sheet">
              {/* Single cut guide lines */}
              {includeCuttingMarks && (
                <>
                  <div className="cut-guide-vertical"></div>
                  <div className="cut-guide-horizontal"></div>

                  {/* Top tick mark */}
                  <div 
                    className="cut-tick" 
                    style={{ left: '105mm', top: 0, width: '1px', height: '6mm', transform: 'translateX(-50%)' }} 
                  />
                  {/* Bottom tick mark */}
                  <div 
                    className="cut-tick" 
                    style={{ left: '105mm', bottom: 0, width: '1px', height: '6mm', transform: 'translateX(-50%)' }} 
                  />
                  {/* Left tick mark */}
                  <div 
                    className="cut-tick" 
                    style={{ left: 0, top: '148.5mm', height: '1px', width: '6mm', transform: 'translateY(-50%)' }} 
                  />
                  {/* Right tick mark */}
                  <div 
                    className="cut-tick" 
                    style={{ right: 0, top: '148.5mm', height: '1px', width: '6mm', transform: 'translateY(-50%)' }} 
                  />

                  {/* Center intersection icon */}
                  <div 
                    className="absolute bg-white px-1 py-0.5 rounded text-[8px] text-stone-500 font-mono tracking-widest border border-stone-300 pointer-events-none z-40 flex items-center gap-1 select-none"
                    style={{ 
                      top: '148.5mm', 
                      left: '105mm', 
                      transform: 'translate(-50%, -50%)' 
                    }}
                  >
                    <span>✂</span>
                    <span className="text-[7px] uppercase font-bold text-stone-600">taglio singolo</span>
                  </div>
                </>
              )}

              {/* 4 Quadrants */}
              {quadrantItems.map((day, qIdx) => (
                <div key={day ? day.dayOfYear : `empty-${qIdx}`} className="grid-quadrant">
                  {day && (
                    <CalendarLeaf
                      day={day}
                      year={year}
                      variant="print"
                      printLayout="grid4"
                      className="w-full h-full max-w-none shadow-none"
                    />
                  )}
                </div>
              ))}
            </div>
          );
        })}
      </div>
    );
  }

  // Mode: 1 leaf per page (Full page A4, centered)
  return (
    <div className="print-only hidden print:block bg-white text-black p-0 m-0">
      <style>{`
        @media print {
          @page {
            size: A4 portrait;
            margin: 0;
          }
          html, 
          body, 
          #root, 
          #root > div {
            background: #ffffff !important;
            background-color: #ffffff !important;
            background-image: none !important;
            color: #000000 !important;
            margin: 0 !important;
            padding: 0 !important;
            width: 210mm !important;
            height: auto !important;
          }
          .single-print-page {
            width: 210mm;
            height: 297mm;
            max-height: 297mm;
            margin: 0 !important;
            padding: 0 !important;
            display: flex;
            align-items: center;
            justify-content: center;
            page-break-after: always;
            break-after: page;
            page-break-inside: avoid;
            break-inside: avoid;
            background: #ffffff !important;
            box-sizing: border-box;
            overflow: hidden;
          }
          .single-print-leaf-container {
            width: 172mm;
            height: 251mm;
            max-width: 172mm;
            max-height: 251mm;
            box-sizing: border-box;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #ffffff !important;
          }
        }
      `}</style>

      {daysToPrint.map((day) => (
        <div key={day.dayOfYear} className="single-print-page">
          <div className="single-print-leaf-container">
            <CalendarLeaf
              day={day}
              year={year}
              variant="print"
              printLayout="single"
              className="w-full h-full max-w-none shadow-none"
            />
          </div>
        </div>
      ))}
    </div>
  );
};