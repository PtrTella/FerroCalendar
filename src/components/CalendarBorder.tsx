import React from 'react';

interface CalendarBorderProps {
  className?: string;
  year?: number;
}

export const CalendarBorder: React.FC<CalendarBorderProps> = ({ className = '', year = 2027 }) => {
  return (
    <svg
      className={`absolute inset-0 w-full h-full pointer-events-none ${className}`}
      viewBox="0 0 400 580"
      preserveAspectRatio="none"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <defs>
        {/* Rough grunge filter for authentic brush effect */}
        <filter id="brush-rough" x="-5%" y="-5%" width="110%" height="110%">
          <feTurbulence type="fractalNoise" baseFrequency="0.04 0.08" numOctaves="3" result="noise" />
          <feDisplacementMap in="SourceGraphic" in2="noise" scale="3" xChannelSelector="R" yChannelSelector="G" />
        </filter>
        <filter id="soft-rough" x="-2%" y="-2%" width="104%" height="104%">
          <feTurbulence type="fractalNoise" baseFrequency="0.06 0.04" numOctaves="2" result="noise" />
          <feDisplacementMap in="SourceGraphic" in2="noise" scale="1.5" xChannelSelector="R" yChannelSelector="G" />
        </filter>
      </defs>

      {/* OUTER RED BRUSH BORDER */}
      <g filter="url(#brush-rough)">
        {/* Top edge red strokes */}
        <path
          d="M 25 18 C 90 15, 140 19, 180 16 M 220 16 C 260 19, 310 15, 375 18"
          stroke="#c92a2a"
          strokeWidth="6"
          strokeLinecap="round"
          opacity="0.9"
        />
        <path
          d="M 30 20 C 100 18, 150 21, 185 19 M 215 19 C 250 21, 300 18, 370 20"
          stroke="#d93829"
          strokeWidth="3"
          strokeLinecap="round"
          opacity="0.8"
        />

        {/* Left edge red strokes */}
        <path
          d="M 20 25 C 17 120, 23 280, 19 380 C 16 440, 24 510, 21 555"
          stroke="#c92a2a"
          strokeWidth="7"
          strokeLinecap="round"
          opacity="0.95"
        />
        <path
          d="M 24 40 C 22 150, 26 310, 23 420 C 21 470, 25 520, 24 550"
          stroke="#d93829"
          strokeWidth="3.5"
          strokeLinecap="round"
          opacity="0.75"
        />

        {/* Right edge red strokes */}
        <path
          d="M 380 25 C 383 130, 377 270, 381 370 C 384 450, 376 500, 379 555"
          stroke="#c92a2a"
          strokeWidth="7"
          strokeLinecap="round"
          opacity="0.95"
        />
        <path
          d="M 376 40 C 378 140, 374 300, 377 410 C 379 470, 375 520, 376 550"
          stroke="#d93829"
          strokeWidth="3.5"
          strokeLinecap="round"
          opacity="0.75"
        />

        {/* Bottom edge red strokes */}
        <path
          d="M 25 560 C 110 563, 200 558, 290 562 C 320 561, 350 563, 375 560"
          stroke="#c92a2a"
          strokeWidth="6"
          strokeLinecap="round"
          opacity="0.9"
        />
        <path
          d="M 35 558 C 120 559, 210 556, 300 560 C 330 559, 360 561, 365 558"
          stroke="#d93829"
          strokeWidth="3"
          strokeLinecap="round"
          opacity="0.8"
        />

        {/* TOP CENTER RED BANNER FOR YEAR */}
        <path
          d="M 180 18 Q 200 12 220 18 L 228 36 Q 200 40 172 36 Z"
          fill="#c92a2a"
          opacity="0.95"
        />
        <path
          d="M 175 20 Q 200 15 225 20 L 227 34 Q 200 37 173 34 Z"
          fill="#a61e1e"
          opacity="0.9"
        />
      </g>

      {/* INNER CHARCOAL / GREY BRUSH BORDER */}
      <g filter="url(#soft-rough)">
        {/* Left inner grey stroke */}
        <path
          d="M 32 35 C 30 160, 34 320, 31 430 C 29 480, 33 520, 32 545"
          stroke="#495057"
          strokeWidth="2.5"
          strokeLinecap="round"
          opacity="0.85"
        />
        {/* Right inner grey stroke */}
        <path
          d="M 368 35 C 370 150, 366 310, 369 420 C 371 475, 367 520, 368 545"
          stroke="#495057"
          strokeWidth="2.5"
          strokeLinecap="round"
          opacity="0.85"
        />
        {/* Top inner grey stroke */}
        <path
          d="M 35 30 C 80 28, 130 31, 170 29 M 230 29 C 270 31, 320 28, 365 30"
          stroke="#495057"
          strokeWidth="2"
          strokeLinecap="round"
          opacity="0.75"
        />
        {/* Bottom inner grey stroke */}
        <path
          d="M 35 550 C 130 548, 260 552, 365 550"
          stroke="#495057"
          strokeWidth="2"
          strokeLinecap="round"
          opacity="0.75"
        />
      </g>

      {/* Centered Year inside the red banner */}
      <text
        x="200"
        y="30"
        textAnchor="middle"
        dominantBaseline="central"
        fill="#ffffff"
        fontFamily="Cinzel, serif"
        fontWeight="800"
        fontSize="17"
        letterSpacing="2"
      >
        {year}
      </text>
    </svg>
  );
};
