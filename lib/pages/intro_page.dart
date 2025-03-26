import 'package:flutter/material.dart';
import 'package:web_kicks/pages/home_page.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        //logo
        Padding(
          padding: const EdgeInsets.only(left: 80.0, right: 80, bottom: 40, top: 160),
           child: Image.asset('lib/images/logo1.png'),

        ),
       

        // Step into Confidence, One Shoe at a Time.
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Step into Confidence, One Shoe at a Time.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
          ),
        ),
      ),
        
        const SizedBox(height: 24),

        // New Kicks
        Text("New Kicks",
        style: TextStyle(color: Colors.grey[600]),),

        const Spacer(),


        // Get Started button
        GestureDetector(
          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          },)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
               ),
               padding: EdgeInsets.all(24),
               child: Text("Get Started", style: TextStyle(color: Colors.white),)
            ),
        ),

          const Spacer(),
        ],
      )
    );
  }
}