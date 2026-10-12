import { createServer } from "node:net";
import { GameWorld } from "./world.js";
const world=new GameWorld();
const server=createServer(socket=>{ socket.setEncoding("utf8"); socket.write("RPGMUD/1 READY\\n"); socket.on("data",data=>{ for(const line of data.split(/\\r?\\n/).map(s=>s.trim()).filter(Boolean)) socket.write(world.handle(line)+"\\n"); }); });
const port=Number(process.env.PORT||4000); server.listen(port,"0.0.0.0",()=>console.log(`RPGMUD listening on ${port}`));
