export class SessionManager {
  constructor(){this.sessions=new Map();}
  create(accountId){const token=cryptoRandom(); this.sessions.set(token,{accountId,createdAt:Date.now()}); return token;}
  get(token){return this.sessions.get(token)||null;}
  destroy(token){this.sessions.delete(token);}
}
function cryptoRandom(){return [...crypto.getRandomValues(new Uint8Array(18))].map(x=>x.toString(16).padStart(2,"0")).join("");}
