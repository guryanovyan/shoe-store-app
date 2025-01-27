import 'dart:developer';
import 'package:eshop_app/models/cart_model.dart';
import 'package:eshop_app/models/shoe_model.dart';
import 'package:eshop_app/services/shoe_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Shoe> shoes = [];
  List<Shoe> filteredShoes = [];
  bool isLoading = true;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() { 
    loadShoes();
    searchController.addListener(searchShoes);
    
    super.initState();
  }

  Future<void> loadShoes() async {
    try {
      final loadedShoes = await ShoeService.loadShoesFromJson();
      setState(() {
        shoes = loadedShoes;
        filteredShoes = loadedShoes;
        isLoading = false;
      });
    } catch (e) {
      log("Error during loading shoes data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void toggleCartItem(Shoe shoe) {
    final cart = Provider.of<Cart>(context, listen: false);
    
    if (cart.userCart.contains(shoe)) {
      cart.removeItemFromCart(shoe);
    } else {
      cart.addItemToCart(shoe);
    }
  }
  
  void searchShoes() {
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredShoes = shoes.where((shoe) {
        return shoe.name.toLowerCase().contains(query)
          || shoe.gender.toLowerCase().contains(query)
          || shoe.category.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder:(context, value, child) => 
      Center(
        child: Column(
          children: [
            const SizedBox(height: 25,),
            
            Text("Just Do It", style: TextStyle(fontWeight: FontWeight.bold),),

            const SizedBox(height: 10,),
            
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade400)
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none
                ),
              ),
            ),
          
            const SizedBox(height: 25,),

            Expanded(
              child: isLoading
                ? const Center(child: CircularProgressIndicator(),)
                : filteredShoes.isEmpty
                  ? const Center(
                    child: Text('No matching items'),
                  )
                  : ListView.builder(
                    itemCount: filteredShoes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ShoeTile(
                        shoe: filteredShoes[index],
                        onTap: () => toggleCartItem(filteredShoes[index]),
                      );
                    },
                  )
            )
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    searchController.dispose(); // Освобождаем ресурсы контроллера
    super.dispose();
  }
}