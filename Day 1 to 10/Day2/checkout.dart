import 'dart:io';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
  });
  final int id;
  final String name;
  final double price;

  String get displayName => '($initial)${name.substring(1)}: \$$price';
  String get initial => name.substring(0, 1);
}

class Item {
  final Product product;
  final int quantity;
  Item({
    required this.product,
    this.quantity = 1,
  });
  double get price => quantity * product.price;

  @override
  String toString() => '$quantity x ${product.name}: \$$price';
}

class Cart {
  //items is mutablestate
  final Map<int, Item> _items = {};

  void addProduct(Product product) {
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  bool get isEmpty => _items.isEmpty;

  double total() => _items.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);

  @override
  String toString() {
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    final itemizedList =
        _items.values.map((item) => item.toString()).join('\n');
    return '-------\n$itemizedList\nTotal: \$${total()}';
  }
}

const allProducts = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'bananas', price: 0.70),
  Product(id: 3, name: 'courgrettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.00),
  Product(id: 5, name: 'mushrooms', price: 0.80),
  Product(id: 6, name: 'potatoes', price: 1.50),
];

void main() {
  final cart = Cart();
  while (true) {
    stdout.write(
        "What do you want to do? press (v)iew items, (a)dd item, (c)heckout: ");
    final line = stdin.readLineSync();
    if (line == 'a') {
      final product = chooseProduct();
      if (product != null) {
        cart.addProduct(product);
        print(cart);
      }
    } else if (line == 'v') {
    } else if (line == 'c') {
      if (checkout(cart)) {
        break;
      }
    }
  }
}

Product? chooseProduct() {
  final productList = allProducts.map((p) => p.displayName).join('\n');
  stdout.write("Available products:\n$productList\n Your choice: ");
  final line = stdin.readLineSync();
  for (var product in allProducts) {
    if (product.initial == line) {
      return product;
    }
  }
  print('Not found');
  return null;
}

bool checkout(Cart cart) {
  if (cart.isEmpty) {
    print("Cart is empty");
    return false;
  }
  final total = cart.total();
  print('Total: \$total');
  stdout.write('Payment in cash');
  final line = stdin.readLineSync();
  if (line == null || line.isEmpty) {
    return false;
  }
  final paid = double.tryParse(line);
  if (paid == null) {
    return false;
  }
  if (paid >= total) {
    final change = paid - total;
    print("Change: \$${change.toStringAsFixed(2)}");
    return true;
  } else {
    print("not enough cash");
    return false;
  }
}
