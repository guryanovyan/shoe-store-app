import 'package:eshop_app/models/shoe_model.dart';
import 'package:flutter/material.dart';

class ShoeTile extends StatefulWidget {
  final Shoe shoe;
  final void Function()? onTap;
  
  const ShoeTile({super.key, required this.shoe, required this.onTap});
  
  @override
  _ShoeTileState createState() => _ShoeTileState();
}

class _ShoeTileState extends State<ShoeTile> {
  bool isAdded = false;
    
  String capitalize(String text) {
    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }

  void toggleAddToCart() {
    setState(() {
      isAdded = !isAdded;
    });

    widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.05, top: 10, bottom: 10), // Используем процент от ширины
      width: screenWidth * 0.8, // Задаем ширину как процент от ширины экрана
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(3, 1))]
      ),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.shoe.imageURL, 
                width: screenWidth * 0.8, // Используем процент от ширины экрана
                height: screenWidth * 0.8, // Используем процент от ширины экрана
                fit: BoxFit.cover,
              )
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(),
          ),

          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: double.infinity,
              child: Text(
                widget.shoe.name, 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), 
                textAlign: TextAlign.start,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: double.infinity,
              child: Text(
                "${capitalize(widget.shoe.gender)}'s ${capitalize(widget.shoe.category)} shoes",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: Colors.grey[600],
                  fontSize: 17
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Container(
              width: double.infinity,
              child: Text(
                "${widget.shoe.price.toStringAsFixed(2)} €", 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), 
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: toggleAddToCart,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isAdded ? Colors.grey[400] : Colors.grey[900],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), bottomRight: Radius.circular(12)
                    )
                  ),
                  child: Icon(
                    isAdded ? Icons.done : Icons.add, 
                    color: isAdded ? Colors.grey[900] : Colors.white ,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
