void main() {
  const bananas = 5;
  const apples = 6;
  const grains = {
    'pasta': '500g',
    'rice': '1kg',
  };
  const addGrains = true;
  var shoppingList = {
    if(bananas>0)
      'bananas' : 5,  
    if(apples>0)
       'apple' : 6,
    if(addGrains)
      ...grains
  };
  // if (bananas > 0) {
  //   shoppingList['bananas'] = bananas;
  // }
  // if (apples > 0) {
  //   shoppingList['apples'] = apples;
  // }
  // if (addGrains) {
  //   shoppingList.addAll(grains);
  // }
  print(shoppingList);
  // prints {bananas: 5, apples: 6, pasta: 500g, rice: 1kg}
  
}