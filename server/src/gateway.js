export function normalizeConnection(socket){
  socket.setEncoding("utf8");
  socket.setNoDelay(true);
  return socket;
}
export function safeLine(line,max=512){return String(line).slice(0,max);}
