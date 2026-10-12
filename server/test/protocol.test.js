import test from "node:test";
import assert from "node:assert/strict";
import {parseCommand,COMMANDS} from "../src/commands.js";
test("commands are normalized",()=>{const x=parseCommand(" move north ");assert.equal(x.name,"MOVE");assert.deepEqual(x.args,["north"]);assert.equal(COMMANDS.has(x.name),true);});
