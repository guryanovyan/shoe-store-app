import 'package:eshop_app/models/shoe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartDatabase {
  List<Shoe> cartList = [];

  final Box<Shoe> _myBox = Hive.box<Shoe>('myBox');

  void createInitialData() {
    cartList = [];
  }

  void loadData() {
    cartList = _myBox.values.toList();
  }

  void updateDatabase() {
    _myBox.clear(); // Очищаем бокс перед записью
    for (var shoe in cartList) {
      _myBox.add(shoe); // Сохраняем каждый объект
    }
  }
}