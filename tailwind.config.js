/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        serif: ['"Playfair Display"', 'Georgia', 'Cambria', '"Times New Roman"', 'serif'],
        cinzel: ['Cinzel', 'serif'],
        stamp: ['"Special Elite"', 'Courier', 'monospace'],
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
      },
      colors: {
        calendar: {
          red: '#c92a2a',
          darkRed: '#a61e1e',
          charcoal: '#212529',
          paper: '#faf8f5',
          paperWarm: '#f5f0e6',
          borderRed: '#d93829',
          borderGrey: '#495057',
        }
      },
      boxShadow: {
        'paper': '0 10px 30px -5px rgba(0, 0, 0, 0.3), 0 0 0 1px rgba(0, 0, 0, 0.05), inset 0 0 40px rgba(0, 0, 0, 0.02)',
        'paper-stack': '0 1px 3px rgba(0,0,0,0.12), 0 10px 20px rgba(0,0,0,0.22), 0 20px 40px rgba(0,0,0,0.15)',
        'stamp': '0 0 0 3px #d93829, 0 2px 4px rgba(0,0,0,0.2)',
      },
      animation: {
        'tear': 'tearOff 0.75s cubic-bezier(0.25, 1, 0.5, 1) forwards',
        'tear-restore': 'tearRestore 0.6s cubic-bezier(0.2, 0.8, 0.2, 1) forwards',
        'fade-in': 'fadeIn 0.3s ease-out forwards',
        'pulse-subtle': 'pulseSubtle 2s infinite ease-in-out',
      },
      keyframes: {
        tearOff: {
          '0%': {
            transform: 'translateY(0) rotate(0deg) scale(1)',
            opacity: '1',
            transformOrigin: 'top right',
          },
          '20%': {
            transform: 'translateY(15px) rotate(-3deg) skewY(2deg)',
            opacity: '1',
          },
          '50%': {
            transform: 'translateY(80px) rotate(-14deg) skewY(6deg)',
            opacity: '0.85',
          },
          '100%': {
            transform: 'translateY(400px) rotate(-28deg) scale(0.9)',
            opacity: '0',
          }
        },
        tearRestore: {
          '0%': {
            transform: 'translateY(-60px) rotate(6deg) scale(0.95)',
            opacity: '0',
          },
          '100%': {
            transform: 'translateY(0) rotate(0deg) scale(1)',
            opacity: '1',
          }
        },
        fadeIn: {
          '0%': { opacity: '0', transform: 'scale(0.98)' },
          '100%': { opacity: '1', transform: 'scale(1)' },
        },
        pulseSubtle: {
          '0%, 100%': { transform: 'scale(1)' },
          '50%': { transform: 'scale(1.03)' },
        }
      }
    },
  },
  plugins: [],
}
