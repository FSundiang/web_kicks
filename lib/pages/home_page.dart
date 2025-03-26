import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_kicks/model/cart_model.dart';
import 'package:web_kicks/pages/cart_page.dart';
import '../components/grocery_item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
          return CartPage();
          },
        )),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag, color: Colors.white),
      ),
      body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(height: 48),
          // Web Kicks
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Welcome to Web Kicks"),
          ),

          const SizedBox(height: 4),

          // Step into Confidence, One Shoe at a Time.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Step into Confidence, One Shoe at a Time.",
              style: TextStyle(
              fontSize: 36, 
              fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(height: 24),

          // divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(),
          ),

          const SizedBox(height: 24),


          // shop items + grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text("New Kicks", 
            style: TextStyle(fontSize: 16),
            ),
          ),

            Expanded(
              child: Consumer<CartModel>(builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1/1.3,
                    ), 
                itemBuilder: (context, index) {
                  return GroceryItemTile(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false).
                      addItemToCart(index);
                      },
                    );
                  },
                );
              },)
            ),
          ],
        ),
      ),
    );
  }
}