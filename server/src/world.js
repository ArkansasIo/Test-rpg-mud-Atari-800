export class GameWorld {
  constructor(){ this.rooms=new Map([[1,{id:1,title:"The Starting Room",desc:"A quiet stone chamber.",exits:{north:2}}],[2,{id:2,title:"North Hall",desc:"A torch-lit hall.",exits:{south:1}}]]); this.playerRoom=1; }
  handle(line){ const [cmd,...args]=line.trim().split(/\\s+/); switch(cmd?.toUpperCase()){
    case "LOOK": { const r=this.rooms.get(this.playerRoom); return `ROOM ${r.id}\\nTITLE ${r.title}\\nDESC ${r.desc}`; }
    case "MOVE": { const r=this.rooms.get(this.playerRoom); const next=r.exits[(args[0]||"").toLowerCase()]; if(!next)return "ERR NO_EXIT No exit that way"; this.playerRoom=next; return `OK MOVE ${next}`; }
    case "SAY": return `EVENT SAY ${args.join(" ")}`;
    case "WHO": return "WHO 1";
    case "QUIT": return "OK QUIT";
    default:return "ERR UNKNOWN Unknown command"; }
  }
}
