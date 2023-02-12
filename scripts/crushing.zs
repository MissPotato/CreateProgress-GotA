import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.ListData;
import crafttweaker.api.util.random.Percentaged;


function addCreateCrushing(name as string, itemIn as IIngredient, itemsOut as Percentaged<IItemStack>[]) as void {
  // deal with percentaged item stacks
  var results = new ListData();
  for output in itemsOut {
    results.add({
      item: output.data.registryName,
      count: output.data.amount,
      chance: output.percentage
    });
  }

  <recipetype:create:crushing>.addJsonRecipe(name, {
    "type": "create:crushing",
    "ingredients": [
      itemIn as IData,
    ],
    "processingTime": 400,
    "results": results,
  }
  );
}

var coal = <item:minecraft:coal>;
var coal_dust = <item:indrev:coal_dust>;
var diamond = <item:minecraft:diamond>;
var diamond_dust = <item:indrev:diamond_dust>;



addCreateCrushing("crush_coal_dust", coal, [coal_dust, coal_dust % 15, diamond_dust % 0.5]);
addCreateCrushing("crush_diamond_dust", diamond, [diamond_dust, diamond_dust % 5]);
addCreateCrushing("crush_nikolite", <tag:items:c:nikolite_ores>, [<item:indrev:nikolite_dust> * 6, <item:indrev:nikolite_dust> % 25]);
addCreateCrushing("crush_iron",<item:minecraft:iron_ingot>, [<item:indrev:iron_dust>]);

addCreateCrushing("crush_topaz_blocks", <item:spectrum:topaz_block>, [<item:spectrum:topaz_shard>, <item:spectrum:topaz_shard> % 25]);
addCreateCrushing("crush_citrine_blocks", <item:spectrum:citrine_block>, [<item:spectrum:citrine_shard>, <item:spectrum:citrine_shard> % 25]);
addCreateCrushing("crush_emerald_blocks", <item:geodes:emerald_geode>, [<item:minecraft:emerald> % 50]);
addCreateCrushing("crush_diamond_blocks", <item:geodes:diamond_geode>, [<item:minecraft:diamond> % 50]);

addCreateCrushing("crush_certus", <item:ae2:certus_quartz_crystal>, [<item:ae2:certus_quartz_dust>, <item:ae2:certus_quartz_dust> % 10]);
addCreateCrushing("crush_charged_certus", <item:ae2:charged_certus_quartz_crystal>, [<item:ae2:certus_quartz_dust>, <item:ae2:certus_quartz_dust> % 10]);