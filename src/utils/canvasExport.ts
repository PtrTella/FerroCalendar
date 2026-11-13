import { CalendarDay } from '../data/calendarData';
import { getDayOfWeek } from './dates';

/**
 * Generates an SVG string representation of the calendar leaf for high-res download or sharing
 */
export function generateCalendarSvg(day: CalendarDay, year: number = 2027): string {
  const dow = getDayOfWeek(day.day, day.monthNumber, year);
  const quoteLines = day.quote.split('\n').filter(l => l.trim().length > 0);

  // Line height spacing
  const startY = 370;
  const lineSpacing = 28;
  const quoteTspans = quoteLines
    .map((line, idx) => `<tspan x="250" dy="${idx === 0 ? 0 : lineSpacing}">${escapeXml(line)}</tspan>`)
    .join('');

  const closingY = startY + quoteLines.length * lineSpacing + 20;

  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 730" width="1000" height="1460">
    <defs>
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@700;900&amp;family=Playfair+Display:ital,wght@0,700;0,900;1,600;1,700&amp;family=Special+Elite&amp;display=swap');
        .bg-paper { fill: #faf7f2; }
        .dow { font-family: 'Playfair Display', serif; font-size: 32px; font-weight: 900; fill: #1c1917; text-anchor: middle; }
        .num { font-family: 'Playfair Display', serif; font-size: 155px; font-weight: 900; fill: #111111; text-anchor: middle; }
        .month { font-family: 'Playfair Display', serif; font-size: 36px; font-weight: 900; fill: #1c1917; text-anchor: middle; }
        .saint { font-family: 'Playfair Display', serif; font-size: 14px; font-style: italic; fill: #57534e; text-anchor: middle; }
        .quote { font-family: 'Playfair Display', serif; font-size: 21px; font-style: italic; font-weight: 700; fill: #1c1917; text-anchor: middle; }
        .closing { font-family: 'Playfair Display', serif; font-size: 16px; font-style: italic; font-weight: 700; fill: #292524; text-anchor: middle; }
        .stamp { font-family: 'Special Elite', monospace; font-size: 16px; font-weight: bold; fill: #b91c1c; }
        .footer { font-family: 'Playfair Display', serif; font-size: 12px; fill: #78716c; text-anchor: middle; }
      </style>
      <filter id="brush">
        <feTurbulence type="fractalNoise" baseFrequency="0.04 0.08" numOctaves="3" result="noise" />
        <feDisplacementMap in="SourceGraphic" in2="noise" scale="3" />
      </filter>
    </defs>

    <!-- Paper Background -->
    <rect width="500" height="730" rx="8" class="bg-paper" />

    <!-- Top Cardboard Header -->
    <rect width="500" height="65" rx="8 8 0 0" fill="#1c1917" />
    <circle cx="250" cy="14" r="5" fill="#44403c" stroke="#1c1917" stroke-width="2" />
    
    <!-- Center Logo Badge -->
    <rect x="175" y="18" width="150" height="34" rx="4" fill="#ffffff" />
    <text x="250" y="34" font-family="sans-serif" font-weight="900" font-size="13" fill="#c92a2a" text-anchor="middle">Andalò Gianni</text>
    <text x="250" y="46" font-family="sans-serif" font-weight="bold" font-size="7" fill="#1c1917" text-anchor="middle" letter-spacing="0.5">MECCANICA DI ALTA PRECISIONE</text>

    <!-- Left sub-info -->
    <text x="25" y="32" font-family="sans-serif" font-weight="bold" font-size="9.5" fill="#ffffff">Andalò Gianni srl</text>
    <text x="25" y="44" font-family="sans-serif" font-size="8" fill="#a8a29e">Via Serraglio, 46 - Imola</text>
    <text x="25" y="55" font-family="sans-serif" font-size="8" fill="#a8a29e">Tel. 0542 640387</text>

    <!-- Right sub-info -->
    <text x="475" y="32" font-family="sans-serif" font-weight="bold" font-size="9.5" fill="#ffffff" text-anchor="end">www.andalogianni.com</text>
    <text x="475" y="44" font-family="sans-serif" font-size="8" fill="#a8a29e" text-anchor="end">info@andalogianni.com</text>
    <text x="475" y="55" font-family="sans-serif" font-weight="bold" font-size="8" fill="#fbbf24" text-anchor="end">Edizione Ferro 2027</text>

    <!-- Perforation line -->
    <line x1="10" y1="70" x2="490" y2="70" stroke="#78716c" stroke-width="2" stroke-dasharray="6,4" />

    <!-- Distressed Red Border -->
    <g filter="url(#brush)">
      <path d="M 35 90 C 130 85, 370 85, 465 90" stroke="#c92a2a" stroke-width="7" stroke-linecap="round" fill="none" />
      <path d="M 30 100 C 26 250, 32 500, 28 695" stroke="#c92a2a" stroke-width="8" stroke-linecap="round" fill="none" />
      <path d="M 470 100 C 474 250, 468 500, 472 695" stroke="#c92a2a" stroke-width="8" stroke-linecap="round" fill="none" />
      <path d="M 35 700 C 130 705, 370 705, 465 700" stroke="#c92a2a" stroke-width="7" stroke-linecap="round" fill="none" />
      
      <!-- Top Red Banner with Year -->
      <path d="M 225 80 Q 250 72 275 80 L 285 106 Q 250 112 215 106 Z" fill="#c92a2a" />
    </g>

    <!-- Year Text -->
    <text x="250" y="99" font-family="'Cinzel', serif" font-weight="900" font-size="20" fill="#ffffff" text-anchor="middle" letter-spacing="3">${year}</text>

    <!-- Day of Week -->
    <text x="250" y="150" class="dow">${escapeXml(dow)}</text>

    <!-- Giant Day Number -->
    <text x="250" y="275" class="num">${day.day}</text>

    <!-- Month -->
    <text x="250" y="320" class="month">${escapeXml(day.month)}</text>

    <!-- Saint -->
    <text x="250" y="342" class="saint">${escapeXml(day.saint || '')}</text>

    <!-- Stamp if Ferie -->
    ${day.isFerie ? `
      <g transform="translate(180, 348) rotate(-4)">
        <rect x="0" y="0" width="140" height="26" rx="4" fill="none" stroke="#b91c1c" stroke-width="2" stroke-dasharray="4,2" />
        <text x="70" y="18" class="stamp" text-anchor="middle">CHIUSO PER FERIE</text>
      </g>
    ` : ''}

    <!-- The Quote -->
    <text x="250" y="${startY}" class="quote">
      ${quoteTspans}
    </text>

    <!-- Closing / Dedication -->
    ${day.closing ? `
      <line x1="150" y1="${closingY - 14}" x2="350" y2="${closingY - 14}" stroke="#d6d3d1" stroke-width="1" />
      <text x="250" y="${closingY}" class="closing">${escapeXml(day.closing)}</text>
    ` : ''}

    <!-- Footer -->
    <text x="250" y="695" class="footer">www.andalogianni.com • Andalò Gianni srl (Imola) • ${day.dayOfYear}/365</text>
  </svg>`;
}

function escapeXml(unsafe: string): string {
  return unsafe.replace(/[<>&'"]/g, (c) => {
    switch (c) {
      case '<': return '&lt;';
      case '>': return '&gt;';
      case '&': return '&amp;';
      case '\'': return '&apos;';
      case '"': return '&quot;';
      default: return c;
    }
  });
}

/**
 * Downloads the current calendar day as a PNG image
 */
export async function downloadDayAsPng(day: CalendarDay, year: number = 2027): Promise<void> {
  const svgString = generateCalendarSvg(day, year);
  const blob = new Blob([svgString], { type: 'image/svg+xml;charset=utf-8' });
  const url = URL.createObjectURL(blob);

  const img = new Image();
  img.crossOrigin = 'anonymous';

  return new Promise((resolve, reject) => {
    img.onload = () => {
      const canvas = document.createElement('canvas');
      canvas.width = 1000;
      canvas.height = 1460;
      const ctx = canvas.getContext('2d');
      if (!ctx) {
        reject(new Error('Canvas context failed'));
        return;
      }

      ctx.fillStyle = '#faf7f2';
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
      URL.revokeObjectURL(url);

      canvas.toBlob((pngBlob) => {
        if (!pngBlob) {
          reject(new Error('Blob creation failed'));
          return;
        }
        const pngUrl = URL.createObjectURL(pngBlob);
        const a = document.createElement('a');
        a.href = pngUrl;
        a.download = `ferro-calendar-${day.day}-${day.month}-${year}.png`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(pngUrl);
        resolve();
      }, 'image/png');
    };

    img.onerror = (e) => {
      URL.revokeObjectURL(url);
      reject(e);
    };

    img.src = url;
  });
}
