//meadow wooden milk bucket
<recipetype:create:emptying>.addJsonRecipe("wooden_milk_empty_compat", {
  "type": "create:emptying",
  "ingredients": [
    {
      "item": "meadow:wooden_milk_bucket"
    }
  ],
  "results": [
    {
      "item": "meadow:wooden_bucket"
    },
    {
      "amount": 81000,
      "fluid": "milk:still_milk"
    }
  ]
}
);

<recipetype:create:filling>.addJsonRecipe("wooden_milk_fill_compat", {
  "type": "create:filling",
  "ingredients": [
    {
      "item": "meadow:wooden_bucket"
    },
    {
      "amount": 81000,
      "fluid": "milk:still_milk"
    }
  ],
  "results": [
    {
      "item": "meadow:wooden_milk_bucket"
    }
  ]
}
);
//limestone alpine salt compat
// <tag:items:create:stone_types/limestone>.add(<item:meadow:limestone>);
// <recipetype:meadow:cooking>.addJsonRecipe("create_limestone_alpine_salt", {
//   "ingredients": [
//     {
//       "item": "create:limestone"
//     }
//   ],
//   "fluid_amount": 50,
//   "crafting_duration": 150,
//   "result": {
//     "item": "meadow:alpine_salt",
//     "count": 4
//   }
// }
// );
// <recipetype:create:mixing>.addJsonRecipe("create_limestone_alpine_salt_heated_mixing", {
//   "type": "create:mixing",
//   "heatRequirement": "heated",
//   "ingredients": [
//     {
//       "tag": "create:stone_types/limestone"
//     },
//     {
//       "amount": 40500,
//       "fluidTag": "forge:milk"
//     }
//   ],
//   "results": [
//     {
//       "count": 4,
//       "item": "meadow:alpine_salt"
//     }
//   ]
// }
// );