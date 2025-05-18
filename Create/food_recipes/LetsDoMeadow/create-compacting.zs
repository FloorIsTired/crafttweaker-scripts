import crafttweaker.api.item.IItemStack;

val cheese_recipes as IItemStack[IItemStack] = {
    <item:meadow:wooden_milk_bucket> : <item:meadow:cheese_block>,
    <item:meadow:wooden_sheep_milk_bucket> : <item:meadow:sheep_cheese_block>,
    <item:meadow:wooden_buffalo_milk_bucket> : <item:meadow:buffalo_cheese_block>,
    <item:meadow:wooden_goat_milk_bucket> : <item:meadow:goat_cheese_block>,
    <item:meadow:wooden_warped_milk_bucket> : <item:meadow:warped_cheese_block>,
    <item:meadow:wooden_grain_milk_bucket> : <item:meadow:grain_cheese_block>,
    <item:meadow:wooden_amethyst_milk_bucket> : <item:meadow:amethyst_cheese_block>
};

var i = 0;
for milk_bucket, cheese_wheel in cheese_recipes {
    i++;
    val cheeseWheelName = cheese_wheel.registryName.namespace + "_compacting_recipe_" + i;
    <recipetype:create:compacting>.addJsonRecipe(cheeseWheelName, {
        "type" : "create:compacting",
        "heatRequirement": "heated",
        "ingredients" : [
            {
                "item": milk_bucket.registryName.toString()
            },
            {
                "item": "meadow:rennet"
            }
        ],
        "results": [
            {
                "item": cheese_wheel.registryName.toString()
            },
            {
                "item": "meadow:wooden_bucket"
            },
            {
                "item": "minecraft:glass_bottle"
            }
        ]
    });
}
