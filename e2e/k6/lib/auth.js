import k6crypto from 'k6/crypto';
import encoding from 'k6/encoding';
import { JWT_CLIENT_ID, JWT_SECRET } from './config.js';

const base64Url = (value) => encoding.b64encode(value, 'rawurl');

export function uuid() {
  return crypto.randomUUID();
}

// Creates a (short lived) JWT in the format OpenZaak expects.
export function createJwt() {
  const now = Math.floor(Date.now() / 1000);
  const header = base64Url(JSON.stringify({ alg: 'HS256', typ: 'JWT' }));
  const payload = base64Url(
    JSON.stringify({
      iss: JWT_CLIENT_ID,
      iat: now,
      exp: now + 600,
      client_id: JWT_CLIENT_ID,
      user_id: JWT_CLIENT_ID,
      user_representation: JWT_CLIENT_ID,
      jti: uuid(),
    }),
  );
  const signature = k6crypto.hmac('sha256', JWT_SECRET, `${header}.${payload}`, 'base64rawurl');
  return `Bearer ${header}.${payload}.${signature}`;
}
