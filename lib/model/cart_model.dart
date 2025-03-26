import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  // List of items 

  final List _shopItems=[
    // [ itemName, itemPrice, imagePath, color ]
    ["Sabrina 2 EP", "8095", "lib/images/sabrina.png", Colors.green],
    ["Nike Air Max", "11895", "lib/images/nikeair.png", Colors.red],
    ["Nike Pegasus", "11995", "lib/images/pegasus.png", Colors.yellow],
    ["Lebron XXII EP", "10295", "lib/images/leb.png", Colors.brown],
    ["Ja 2 'Foundation' Ep", "6895", "lib/images/Ja.png", Colors.red],
    ["Tatum 3 PF 'Zen'", "7095", "lib/images/tatum.png", Colors.green],
    ["Luka 3 PF", "10295", "lib/images/luka.png", Colors.brown],
    ["Sabrina 2 'Stronger Than Gold' EP", "7895", "lib/images/sabrina2.png", Colors.yellow],
    ["Kobe IX ", "5795", "lib/images/kobe.png", Colors.green],
    ["Giannis Immortality 4", "3595", "lib/images/gian.png", Colors.brown],
    ["Tatum 3 PF' Ep", "6895", "lib/images/tatum3.png", Colors.red],
    ["Jordan Heir Series PF", "11995", "lib/images/jordan.png", Colors.yellow],
  ];

  // list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal(){
    double totalPrice = 0;
    for(int i=0; i < cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}