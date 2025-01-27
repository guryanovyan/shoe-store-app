import 'package:eshop_app/models/shoe_model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
  List<Shoe> userCart = [];

  List<Shoe> getUserCart() {
    return userCart;
  } 

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}