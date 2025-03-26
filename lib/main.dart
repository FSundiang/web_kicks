import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_kicks/model/cart_model.dart';
import 'pages/intro_page.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build (BuildContext context){
    return ChangeNotifierProvider(create: (context) => CartModel(),
    child:  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    ),
    );
  }
}
