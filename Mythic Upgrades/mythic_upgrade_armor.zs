//requires ARMOR_CRAFTING class from armor_functions.zs

var types as string[] = ["topaz", "ruby", "peridot", "jade", "aquamarine", "sapphire", "ametrine"];

for mat in types {
    MYTHIC_UPGRADES.armor_craft(mat);
    MYTHIC_UPGRADES.armor_attributes(mat);
    MYTHIC_UPGRADES.tagProper(mat);
}