// Web Audio API synthetic paper tear sound generator
class SoundController {
  private ctx: AudioContext | null = null;
  private isMuted: boolean = false;

  constructor() {
    // Check localStorage for mute preference
    if (typeof window !== 'undefined') {
      this.isMuted = localStorage.getItem('ferro_calendar_muted') === 'true';
    }
  }

  private initContext() {
    if (!this.ctx && typeof window !== 'undefined') {
      const AudioCtx = window.AudioContext || (window as unknown as { webkitAudioContext: typeof AudioContext }).webkitAudioContext;
      if (AudioCtx) {
        this.ctx = new AudioCtx();
      }
    }
    if (this.ctx && this.ctx.state === 'suspended') {
      this.ctx.resume();
    }
  }

  public toggleMute(): boolean {
    this.isMuted = !this.isMuted;
    if (typeof window !== 'undefined') {
      localStorage.setItem('ferro_calendar_muted', String(this.isMuted));
    }
    return this.isMuted;
  }

  public getMuted(): boolean {
    return this.isMuted;
  }

  public playTearSound() {
    if (this.isMuted) return;
    try {
      this.initContext();
      if (!this.ctx) return;

      const now = this.ctx.currentTime;
      const duration = 0.38; // seconds

      // Buffer with noise
      const bufferSize = Math.floor(this.ctx.sampleRate * duration);
      const buffer = this.ctx.createBuffer(1, bufferSize, this.ctx.sampleRate);
      const output = buffer.getChannelData(0);

      // Generate crackling/tearing fibers noise
      let lastOut = 0.0;
      for (let i = 0; i < bufferSize; i++) {
        // Pinkish noise with random spikes
        const white = Math.random() * 2 - 1;
        lastOut = (lastOut * 0.7) + (white * 0.3);
        const spike = Math.random() > 0.96 ? (Math.random() - 0.5) * 2.5 : 0;
        output[i] = (lastOut * 0.75 + spike * 0.25);
      }

      const whiteNoise = this.ctx.createBufferSource();
      whiteNoise.buffer = buffer;

      // Filter to simulate paper frequency response
      const bandpass = this.ctx.createBiquadFilter();
      bandpass.type = 'bandpass';
      bandpass.frequency.setValueAtTime(1400, now);
      bandpass.frequency.exponentialRampToValueAtTime(700, now + duration);
      bandpass.Q.setValueAtTime(1.8, now);

      // Highpass to eliminate dull thuds
      const highpass = this.ctx.createBiquadFilter();
      highpass.type = 'highpass';
      highpass.frequency.setValueAtTime(450, now);

      // Gain Envelope
      const gainNode = this.ctx.createGain();
      gainNode.gain.setValueAtTime(0.01, now);
      gainNode.gain.linearRampToValueAtTime(0.4, now + 0.04);
      gainNode.gain.exponentialRampToValueAtTime(0.2, now + 0.15);
      gainNode.gain.exponentialRampToValueAtTime(0.001, now + duration);

      whiteNoise.connect(bandpass);
      bandpass.connect(highpass);
      highpass.connect(gainNode);
      gainNode.connect(this.ctx.destination);

      whiteNoise.start(now);
      whiteNoise.stop(now + duration);
    } catch {
      // Ignore audio failure gracefully
    }
  }

  public playFlipSound() {
    if (this.isMuted) return;
    try {
      this.initContext();
      if (!this.ctx) return;

      const now = this.ctx.currentTime;
      const duration = 0.18;

      const bufferSize = Math.floor(this.ctx.sampleRate * duration);
      const buffer = this.ctx.createBuffer(1, bufferSize, this.ctx.sampleRate);
      const output = buffer.getChannelData(0);

      for (let i = 0; i < bufferSize; i++) {
        output[i] = (Math.random() * 2 - 1) * 0.4;
      }

      const noise = this.ctx.createBufferSource();
      noise.buffer = buffer;

      const filter = this.ctx.createBiquadFilter();
      filter.type = 'lowpass';
      filter.frequency.setValueAtTime(900, now);
      filter.frequency.exponentialRampToValueAtTime(300, now + duration);

      const gain = this.ctx.createGain();
      gain.gain.setValueAtTime(0.01, now);
      gain.gain.linearRampToValueAtTime(0.25, now + 0.02);
      gain.gain.exponentialRampToValueAtTime(0.001, now + duration);

      noise.connect(filter);
      filter.connect(gain);
      gain.connect(this.ctx.destination);

      noise.start(now);
      noise.stop(now + duration);
    } catch {
      // Ignore
    }
  }
}

export const soundCtrl = new SoundController();
