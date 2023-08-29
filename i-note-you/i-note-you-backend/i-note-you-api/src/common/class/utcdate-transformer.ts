import * as dayjs from 'dayjs';
import * as utc from 'dayjs/plugin/utc';

dayjs.extend(utc);
export class ColumnUtcTransformer {
  to(date: Date) {
    return date;
  }
  from(date: string | null): Date | null {
    if (date === null) {
      return null;
    }
    return dayjs(date).toDate();
  }
}
