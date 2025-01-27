import 'package:eshop_app/components/bottom_navbar.dart';
import 'package:eshop_app/pages/cart_page.dart';
import 'package:eshop_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), const CartPage()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                child: Icon(Icons.menu),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, 
            );
          }
        ),

        actions: [
          Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 15),
            child: Image.asset('lib/assets/images/logo.png', height: 70,),
          )
        ],
        
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            )
          ],
        ),
      ),

      bottomNavigationBar: MyBottomNavbar(onTabChange:(index) => navigateBottomBar(index)),
      body: _pages[_selectedIndex],
      
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
            Column(
              children: [
                DrawerHeader(child: Image.asset('lib/assets/images/logo.png', color: Colors.white)),
          
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.grey,),
                    title: Text('SHOP', style: TextStyle(color: Colors.white),),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.grey,),
                    title: Text('ABOUT', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.grey,),
                title: Text('LOGOUT', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}