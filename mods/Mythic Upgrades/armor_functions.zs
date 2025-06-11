#priority 100

import crafttweaker.api.recipe.SmithingRecipeManager;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.entity.attribute.AttributeOperation;
import crafttweaker.api.entity.equipment.EquipmentSlot;
import crafttweaker.api.entity.attribute.AttributeModifier;
import stdlib.List;


public class MYTHIC_UPGRADES {
    private static val script_name as string = "armor_functions";
    private static val armor_pieces as string[string] = {
        "helmet" : "2ad3f246-fee1-4e67-b886-69fd380bb150", 
        "chestplate" : "9f3d476d-c118-4544-8365-64846904b48e", 
        "leggings" : "d8499b04-0e66-4726-ab29-64469d734e0d", 
        "boots" : "845db27c-c624-495f-8c9f-6020a9a58b6b"
    };

    public static armor_craft(material as string) as void {
        var func_string = script_name + " : armor_craft : " + material;
        Logger.printStart(func_string);
        for armor_piece in armor_pieces {
            var armor as string = material + "_" + armor_piece;
            println("Removing: "+<item:mythicupgrades:${armor}>.registryName);
            smithing.remove(<item:mythicupgrades:${armor}>);
            println("Adding: "+<item:mythicupgrades:${armor}>.registryName);
            <recipetype:minecraft:smithing>.addJsonRecipe( armor + "_smithing", {
                "type": "minecraft:smithing_transform",
                "addition": {
                "item": "mythicupgrades:" + material + "_ingot"
                },
                "base": {
                "item": "advancednetherite:netherite_diamond_" + armor_piece
                },
                "result": {
                "item": "mythicupgrades:" + armor
                },
                "template": {
                "item": "mythicupgrades:"+ material +"_upgrade_smithing_template"
                }
            });
        }
        
        Logger.printEnd(func_string);
    }

    public static armor_attributes(material as string) as void {
        var func_string = script_name + " : armor_attributes : " + material;

        //initializing with placeholders
        var armor_value = 0;
        var armor_value_bonus = 0;
        var equipmentslot = <constant:minecraft:equipmentslot:head>;

        //durability mults
        var durabilityMult = 2;
        if (material == "topaz") {
            //topaz has more durability and +1 more prot
            durabilityMult = 3;
            armor_value_bonus = 1;
        }

        Logger.printStart(func_string);

        for armor_piece, uuid in armor_pieces {
            var armor as string = material + "_" + armor_piece;
            var armor_item as IItemStack = <item:mythicupgrades:${armor}>;

            switch (armor_piece) {
                case "helmet":
                    equipmentslot = <constant:minecraft:equipmentslot:head>;
                    armor_value = 5;
                    break;
                case "chestplate":
                    equipmentslot = <constant:minecraft:equipmentslot:chest>;
                    armor_value = 9;
                    break;
                case "leggings":
                    equipmentslot = <constant:minecraft:equipmentslot:legs>;
                    armor_value = 7;
                    break;
                case "boots":
                    equipmentslot = <constant:minecraft:equipmentslot:feet>;
                    armor_value = 5;
                    break;
            }
            armor_value = armor_value + armor_value_bonus;
            
            armor_item.anyDamage().addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, uuid, "Armor modifier", armor_value, AttributeOperation.ADDITION, [equipmentslot]);
            armor_item.anyDamage().addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, uuid, "Armor toughness", 4.0, AttributeOperation.ADDITION, [equipmentslot]);
            
            
            armor_item.maxDamage = <item:advancednetherite:netherite_diamond_${armor_piece}>.maxDamage * durabilityMult;

            println("ARMOR: " + armor);
            println("ARMOR_VALUE: " + armor_value);
            println("ARMOR DURABILITY: " + armor_item.maxDamage);
        }
        #smithing.remove(armor_piece);
        
        Logger.printEnd(func_string);
    }

    public static tagProper(material as string) as void {
        var func_string = script_name + " : tagProper : " + material;
        Logger.printStart(func_string);
        for armor_piece in armor_pieces {
            var armor as string = material + "_" + armor_piece;
            var armor_item as IItemStack = <item:mythicupgrades:${armor}>;
            switch (armor_piece) {
            case "helmet":
                <tag:items:c:helmets>.add(armor_item);
                <tag:items:bookshelf:helmets>.add(armor_item);
                break;
            case "chestplate":
                <tag:items:c:chestplates>.add(armor_item);
                <tag:items:bookshelf:chestplates>.add(armor_item);
                break;
            case "leggings":
                <tag:items:c:leggings>.add(armor_item);
                <tag:items:bookshelf:leggings>.add(armor_item);
                break;
            case "boots":
                <tag:items:c:boots>.add(armor_item);
                <tag:items:bookshelf:boots>.add(armor_item);
                break;
            }
            <tag:items:bookshelf:armor>.add(armor_item);
            <tag:items:c:armors>.add(armor_item);
            //pass over advanced netherite pacification bonuses
            <tag:items:advancednetherite:config/pacify_phantoms>.add(armor_item);
            <tag:items:advancednetherite:config/pacify_endermen>.add(armor_item);
            <tag:items:advancednetherite:config/pacify_piglins>.add(armor_item);
        }
        Logger.printEnd(func_string);
    }
}

