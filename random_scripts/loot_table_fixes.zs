import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.BlockStatePropertyLootCondition;
import crafttweaker.api.loot.condition.MatchToolLootCondition;
import crafttweaker.api.loot.modifier.CommonLootModifiers;
import crafttweaker.api.block.Block;
import stdlib.List;

loot.modifiers.register(
  "barred_glass_drop",
  LootConditions.allOf([
    BlockStatePropertyLootCondition.create(<block:hearth_and_home:barred_glass>)
  ]),
  CommonLootModifiers.removeAll(<item:minecraft:iron_nugget>)
);

val appleLeaves = new List<Block>();
appleLeaves.add(<block:vinery:apple_leaves>);
appleLeaves.add(<block:regions_unexplored:apple_oak_leaves>);
appleLeaves.add(<block:biomeswevegone:ripe_orchard_leaves>);
var i = 0;
for block in appleLeaves {
  i++;
  println("apple_leaves_fix_" + i);
  loot.modifiers.register(
  "apple_leaves_fix_" + i ,
  LootConditions.allOf([
    BlockStatePropertyLootCondition.create(block)
  ]),
  CommonLootModifiers.addWithChance(<item:minecraft:apple> % 50)
);
}
