import test from "node:test";
import assert from "node:assert/strict";
import {hashPassword,verifyPassword} from "../src/auth.js";
import {Inventory} from "../src/inventory.js";
import {resolveAttack} from "../src/combat.js";
test("password hashing verifies",()=>{const h=hashPassword("secret");assert.equal(verifyPassword("secret",h),true);assert.equal(verifyPassword("wrong",h),false);});
test("inventory adds and removes",()=>{const i=new Inventory();i.add(7,3);assert.equal(i.remove(7,2),true);assert.deepEqual(i.list(),[{itemId:7,quantity:1}]);});
test("combat applies minimum damage",()=>assert.deepEqual(resolveAttack({attack:10},{defense:3,hp:10}),{damage:7,defeated:false}));
