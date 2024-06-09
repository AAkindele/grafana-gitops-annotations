import http from 'k6/http';
import { randomIntBetween } from 'https://jslib.k6.io/k6-utils/1.2.0/index.js';

export default function () {
  const delay = randomIntBetween(0, parseInt(__ENV.MAX_DELAY))
  http.get(`http://${__ENV.TARGET_HOST}/delay/${delay}`);
}
