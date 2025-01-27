import 'dart:convert';
import 'package:eshop_app/models/shoe_model.dart';
import 'package:flutter/services.dart';

class ShoeService {
  static Future<List<Shoe>> loadShoesFromJson() async {
    final String jsonString = await rootBundle.loadString('lib/assets/data/shoes.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.values.map((item) => Shoe.fromJson(item)).toList();
  }
}