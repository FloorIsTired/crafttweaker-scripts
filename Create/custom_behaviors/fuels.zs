import crafttweaker.api.item.IItemStack;
import stdlib.List;

var blazecakeBurn = <item:create:blaze_cake>.burnTime;

val fuelblocks = new List<IItemStack>();
println("Blazecake burntime is: " + <item:create:blaze_cake>.burnTime);
<item:spelunkery:saltpeter_block>.burnTime = blazecakeBurn / 8;
<item:spelunkery:sulfur_block>.burnTime = blazecakeBurn / 4;
fuelblocks.add(<item:spelunkery:saltpeter_block>);
fuelblocks.add(<item:spelunkery:sulfur_block>);

<tag:items:create:blaze_burner_fuel/normal>.add(fuelblocks);
