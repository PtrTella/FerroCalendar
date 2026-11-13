import React, { useState } from 'react';
import { X, Copy, Check, Share2, Download, MessageSquare } from 'lucide-react';
import { CalendarDay } from '../data/calendarData';
import { downloadDayAsPng } from '../utils/canvasExport';

interface ShareModalProps {
  isOpen: boolean;
  onClose: () => void;
  day: CalendarDay;
  year: number;
}

export const ShareModal: React.FC<ShareModalProps> = ({
  isOpen,
  onClose,
  day,
  year,
}) => {
  const [copiedText, setCopiedText] = useState(false);
  const [copiedLink, setCopiedLink] = useState(false);
  const [isDownloading, setIsDownloading] = useState(false);

  if (!isOpen) return null;

  const quoteFormatted = `🗓️ FerroCalendar 2027 • ${day.day} ${day.month}\n\n"${day.quote}"\n${day.closing ? `— ${day.closing}\n` : ''}\nScopri tutte le 365 perle su ${window.location.origin}${window.location.pathname}`;

  const handleCopyText = async () => {
    try {
      await navigator.clipboard.writeText(quoteFormatted);
      setCopiedText(true);
      setTimeout(() => setCopiedText(false), 2000);
    } catch {
      // Fallback
    }
  };

  const handleCopyLink = async () => {
    try {
      const shareUrl = `${window.location.origin}${window.location.pathname}#${day.day}-${day.month}`;
      await navigator.clipboard.writeText(shareUrl);
      setCopiedLink(true);
      setTimeout(() => setCopiedLink(false), 2000);
    } catch {
      // Fallback
    }
  };

  const handleDownload = async () => {
    try {
      setIsDownloading(true);
      await downloadDayAsPng(day, year);
    } finally {
      setIsDownloading(false);
    }
  };

  const handleNativeShare = async () => {
    if (navigator.share) {
      try {
        await navigator.share({
          title: `FerroCalendar - ${day.day} ${day.month}`,
          text: `"${day.quote}"\n${day.closing || ''}`,
          url: `${window.location.origin}${window.location.pathname}#${day.day}-${day.month}`,
        });
      } catch {
        // User cancelled or not supported
      }
    } else {
      handleCopyLink();
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-4 bg-black/75 backdrop-blur-sm animate-fade-in">
      <div 
        className="relative w-full max-w-md bg-stone-900 border border-stone-800 rounded-2xl shadow-2xl p-5 overflow-hidden flex flex-col"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="flex items-center justify-between pb-3 border-b border-stone-800">
          <div>
            <h3 className="font-serif font-black text-xl text-stone-100 flex items-center gap-2">
              <Share2 className="w-5 h-5 text-red-500" />
              Condividi questa perla
            </h3>
            <p className="text-xs text-stone-400">
              {day.day} {day.month} {year}
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg bg-stone-800 hover:bg-stone-700 text-stone-400 hover:text-white transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Quote Preview */}
        <div className="my-4 p-4 rounded-xl bg-stone-800/80 border border-stone-700/80 text-stone-200">
          <p className="font-serif italic text-sm leading-relaxed text-stone-100">
            "{day.quote}"
          </p>
          {day.closing && (
            <p className="font-serif italic text-xs text-amber-300 font-semibold mt-2">
              — {day.closing}
            </p>
          )}
        </div>

        {/* Action Buttons */}
        <div className="space-y-2">
          {/* Download Image Button */}
          <button
            onClick={handleDownload}
            disabled={isDownloading}
            className="w-full py-2.5 px-4 rounded-xl bg-[#c92a2a] hover:bg-red-700 text-white font-bold text-xs flex items-center justify-center gap-2 transition-all shadow-md active:scale-98"
          >
            <Download className="w-4 h-4" />
            <span>{isDownloading ? 'Generazione immagine...' : 'Scarica Immagine PNG (per WhatsApp)'}</span>
          </button>

          {/* Native Share on mobile */}
          {typeof navigator !== 'undefined' && 'share' in navigator && (
            <button
              onClick={handleNativeShare}
              className="w-full py-2.5 px-4 rounded-xl bg-stone-800 hover:bg-stone-700 text-stone-100 font-semibold text-xs flex items-center justify-center gap-2 border border-stone-700 transition-colors"
            >
              <MessageSquare className="w-4 h-4 text-emerald-400" />
              <span>Invia su WhatsApp / Social</span>
            </button>
          )}

          {/* Copy Text */}
          <button
            onClick={handleCopyText}
            className="w-full py-2.5 px-4 rounded-xl bg-stone-800 hover:bg-stone-700 text-stone-200 font-semibold text-xs flex items-center justify-center gap-2 border border-stone-700 transition-colors"
          >
            {copiedText ? (
              <>
                <Check className="w-4 h-4 text-emerald-400" />
                <span className="text-emerald-400">Frase copiata negli appunti!</span>
              </>
            ) : (
              <>
                <Copy className="w-4 h-4 text-stone-400" />
                <span>Copia testo della frase</span>
              </>
            )}
          </button>

          {/* Copy Link */}
          <button
            onClick={handleCopyLink}
            className="w-full py-2.5 px-4 rounded-xl bg-stone-800 hover:bg-stone-700 text-stone-200 font-semibold text-xs flex items-center justify-center gap-2 border border-stone-700 transition-colors"
          >
            {copiedLink ? (
              <>
                <Check className="w-4 h-4 text-emerald-400" />
                <span className="text-emerald-400">Link copiato!</span>
              </>
            ) : (
              <>
                <Share2 className="w-4 h-4 text-stone-400" />
                <span>Copia link a questo giorno</span>
              </>
            )}
          </button>
        </div>
      </div>
    </div>
  );
};
