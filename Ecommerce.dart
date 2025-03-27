import 'dart:io';

class Product {
  String _name;
  String _description;
  double _price;
  Product(
          {
            required String name,
            required String description,
            required double price
          }
       )
      : _name = name,
        _description = description,
        _price = price;
  String get name => _name;
  String get description => _description;
  double get price => _price;

  set name(String name) => _name = name;
  set description(String description) => _description = description;
  set price(double price) => _price = price;

  @override
  String toString() {
    return 'Name: $_name\nDescription: $_description\nPrice: \$$_price\n';
  }
}

class ProductManager {
  final List<Product> _products = [];

  void addProduct(String name, String description, double price) {
    _products.add(Product(name: name, description: description, price: price));
    print('Product added successfully!');
  }
  void viewAllProducts() {
    if (_products.isEmpty) {
      print('No products available.');
      return;
    }
    print('All Products:');
    for (var i = 0; i < _products.length; i++) {
      print('Product ID: $i');
      print(_products[i]);
    }
  }
  void viewSingleProduct(int id) {
    if (_isValidId(id)) {
      print('Product Details:');
      print(_products[id]);
    } else {
      print('Invalid Product ID.');
    }
  }
  void editProduct(int id, {String? name, String? description, double? price}) {
    if (_isValidId(id)) {
      var product = _products[id];
      if (name != null && name.isNotEmpty) product.name = name;
      if (description != null && description.isNotEmpty)
        product.description = description;
      if (price != null && price > 0) product.price = price;
      print('Product updated successfully!');
    } else {
      print('Invalid Product ID.');
    }
  }
  void deleteProduct(int id) {
    if (_isValidId(id)) {
      _products.removeAt(id);
      print('Product deleted successfully!');
    } else {
      print('Invalid Product ID.');
    }
  }
  bool _isValidId(int id) => id >= 0 && id < _products.length;
}
void main() {
  final productManager = ProductManager();
  while (true) {
    print('''
        Menu:
        1. Add Product
        2. View All Products
        3. View Single Product
        4. Edit Product
        5. Delete Product
        6. Exit
        Choose an option:''');
    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        print('Enter product name:');
        String name = stdin.readLineSync()!;
        print('Enter product description:');
        String description = stdin.readLineSync()!;
        print('Enter product price:');
        double price = double.parse(stdin.readLineSync()!);
        productManager.addProduct(name, description, price);
        break;
      case '2':
        productManager.viewAllProducts();
        break;
      case '3':
        print('Enter Product ID to view:');
        int id = int.parse(stdin.readLineSync()!);
        productManager.viewSingleProduct(id);
        break;
      case '4':
        print('Enter Product ID to edit:');
        int id = int.parse(stdin.readLineSync()!);
        print('Enter new product name (leave blank to keep current):');
        String? name = stdin.readLineSync();
        print('Enter new product description (leave blank to keep current):');
        String? description = stdin.readLineSync();
        print('Enter new product price (leave blank to keep current):');
        String? priceInput = stdin.readLineSync();
        double? price = priceInput != null && priceInput.isNotEmpty
            ? double.parse(priceInput)
            : null;
        productManager.editProduct(id,
            name: name, description: description, price: price);
        break;
      case '5':
        print('Enter Product ID to delete:');
        int id = int.parse(stdin.readLineSync()!);
        productManager.deleteProduct(id);
        break;
      case '6':
        print('Exiting the application. Goodbye!');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}
