export class ClusterRouter {
  constructor(){this.nodes=new Map();}
  heartbeat(id,address,load=0){this.nodes.set(id,{id,address,load,seen:Date.now()});}
  prune(maxAgeMs=30000){const now=Date.now(); for(const [id,node] of this.nodes) if(now-node.seen>maxAgeMs)this.nodes.delete(id);}
  choose(){return [...this.nodes.values()].sort((a,b)=>a.load-b.load)[0]||null;}
}
