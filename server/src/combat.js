export function resolveAttack(attacker,target){
  const attack=Math.max(1,Number(attacker.attack||1));
  const defense=Math.max(0,Number(target.defense||0));
  const damage=Math.max(1,attack-defense);
  return {damage,defeated:Number(target.hp||1)<=damage};
}
