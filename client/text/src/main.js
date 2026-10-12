import net from "node:net";
const socket=net.createConnection({host:process.env.RPGMUD_HOST||"127.0.0.1",port:Number(process.env.RPGMUD_PORT||4000)},()=>process.stdout.write("Connected to RPGMUD\n> "));
socket.setEncoding("utf8"); socket.on("data",d=>{process.stdout.write(d+"\n> ");}); process.stdin.setEncoding("utf8"); process.stdin.on("data",d=>socket.write(d));
