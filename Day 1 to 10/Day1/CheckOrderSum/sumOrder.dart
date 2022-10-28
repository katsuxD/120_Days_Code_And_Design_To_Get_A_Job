void main() {
  const pizzaPrices = <String,dynamic>{
    'margherita' : 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };
  const orderFood = ['margherita','vegetarian','yup'];
  dynamic total =0;
  for (var value in orderFood){
    final prices = pizzaPrices[value];
    if(prices!=null)
    total += prices;
    else{
      print('$value are not in the menu!');
    }
  }
  print(total);
  // var có thể khai báo 0.0 khỏi sài dynamic
}