export const COMMANDS=new Set(["LOOK","MOVE","SAY","ATTACK","CAST","INVENTORY","WHO","HELP","QUIT"]);
export function parseCommand(line){
  const parts=String(line).trim().split(/\s+/); const name=(parts.shift()||"").toUpperCase();
  return {name,args:parts,text:parts.join(" ")};
}
