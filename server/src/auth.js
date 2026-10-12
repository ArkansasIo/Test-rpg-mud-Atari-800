import crypto from "node:crypto";
export function hashPassword(password) {
  const salt=crypto.randomBytes(16); const hash=crypto.scryptSync(password,salt,32);
  return salt.toString("hex")+":"+hash.toString("hex");
}
export function verifyPassword(password, encoded) {
  const [saltHex,hashHex]=String(encoded).split(":");
  if(!saltHex||!hashHex) return false;
  const actual=crypto.scryptSync(password,Buffer.from(saltHex,"hex"),32);
  const expected=Buffer.from(hashHex,"hex");
  return actual.length===expected.length && crypto.timingSafeEqual(actual,expected);
}
