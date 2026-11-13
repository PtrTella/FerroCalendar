import { CalendarDay, CALENDAR_DATA, DAYS_OF_WEEK } from '../data/calendarData';

/**
 * Returns Italian day of the week for given day, month (1-12) and year.
 */
export function getDayOfWeek(day: number, monthNumber: number, year: number): string {
  // JavaScript Date month is 0-indexed
  const date = new Date(year, monthNumber - 1, day);
  const dayIndex = date.getDay(); // 0 is Sunday, 1 is Monday...
  return DAYS_OF_WEEK[dayIndex];
}

/**
 * Get calendar day by day and monthNumber
 */
export function getCalendarDay(day: number, monthNumber: number): CalendarDay | undefined {
  return CALENDAR_DATA.find(d => d.day === day && d.monthNumber === monthNumber);
}

/**
 * Get initial day index based on real-world today's date
 */
export function getTodayDayOfYear(): number {
  const now = new Date();
  const currentMonth = now.getMonth() + 1;
  const currentDay = now.getDate();

  const found = CALENDAR_DATA.findIndex(d => d.monthNumber === currentMonth && d.day === currentDay);
  if (found !== -1) {
    return found;
  }
  return 0; // Default to Jan 1st
}

/**
 * Format date nicely in Italian
 */
export function formatFullDate(day: CalendarDay, year: number): string {
  const dow = getDayOfWeek(day.day, day.monthNumber, year);
  return `${dow} ${day.day} ${day.month} ${year}`;
}
