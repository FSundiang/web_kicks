import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_kicks/model/cart_model.dart';
import 'package:intl/intl.dart'; 

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart')),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "My Cart",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            // List of cart items
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  // Format individual item price
                  final itemPrice = NumberFormat.currency(
                    locale: 'en_PH',
                    symbol: '₱',
                    decimalDigits: 2,
                  ).format(double.tryParse(value.cartItems[index][1]) ?? 0.0);

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 36,
                        ),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text(itemPrice), // Use formatted item price
                        trailing: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () => Provider.of<CartModel>(context,
                                  listen: false)
                              .removeItemFromCart(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Total Price + Pay Now
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(color: Colors.green[300]),
                        ),
                        const SizedBox(height: 24),
                        // Format total price here *ITO ANG NADAGDAGAN PARA SA FORMATTED AMOUNT*
                        Text(
                          NumberFormat.currency(
                            locale: 'en_PH', // Format the price with currency
                            symbol: '₱',
                            decimalDigits: 2,
                          ).format(double.tryParse(value.calculateTotal()) ?? 0.0),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // Pay Now
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade100),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            "Pay Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
