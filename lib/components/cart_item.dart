import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../models/shoe_model.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;

  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.network(widget.shoe.imageURL),
        title: Text(widget.shoe.name),
        subtitle: Text("${widget.shoe.price.toStringAsFixed(2)} €"),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart, 
        )
      ),
    );
  }
}