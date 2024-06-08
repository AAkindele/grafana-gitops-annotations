import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
  const res = http.get(`http://${__ENV.TARGET_HOST}/delay/1`);
  sleep(1);
}
