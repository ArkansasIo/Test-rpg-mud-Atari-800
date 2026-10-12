export class Inventory {
  constructor(){this.items=new Map();}
  add(itemId,quantity=1){this.items.set(itemId,(this.items.get(itemId)||0)+quantity);}
  remove(itemId,quantity=1){const n=(this.items.get(itemId)||0)-quantity;if(n<0)return false;if(n===0)this.items.delete(itemId);else this.items.set(itemId,n);return true;}
  list(){return [...this.items.entries()].map(([itemId,quantity])=>({itemId,quantity}));}
}
