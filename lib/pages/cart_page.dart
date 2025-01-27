import 'package:eshop_app/models/cart_model.dart';
import 'package:eshop_app/models/shoe_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assets/data/database.dart';
import '../components/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder:(context, cart, child) => 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My cart", 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
            ),

            const SizedBox(height: 20,),

            if (cart.userCart.isEmpty) 
              Center(
                child: Text("Your cart is empty"),
              )
            else 
              Expanded(
                child: ListView.builder(
                  itemCount: cart.userCart.length,
                  itemBuilder:(context, index) {
                    final Shoe shoe = cart.userCart[index];
                    
                    return CartItem(shoe: shoe);
                  }
                )
              )
          ],
        ),
      ),
    );
  }
}