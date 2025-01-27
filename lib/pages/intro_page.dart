import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  'lib/assets/images/logo.png',
                  height: 240,
                ),
              ),
          
              const SizedBox(height: 48,),
          
              Text(
                'Just Do It',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
          
              const SizedBox(height: 24,),
          
              Text(
                'Brand new sneakers with premium quality',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600]
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 80,),

              GestureDetector(
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                  builder: (context) => HomePage()
                  )
                ),

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(15),
                  width: 250,
                  child: Center(
                    child: Text(
                      'Shop now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}