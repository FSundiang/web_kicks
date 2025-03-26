import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Convert itemPrice to double to convert the amount, call out as a double for the price even though it is a final String itemPrice type value
    double price = double.tryParse(itemPrice) ?? 0.0;

    // Format the price with currency
    final formattedPrice = NumberFormat.currency(
      locale: 'en_PH',
      symbol: '₱',
      decimalDigits: 2,
    ).format(price);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[300],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[300]!, // Border color
            width: 1.5,
          ),
          // Shadow effect
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image and item name with one border
            Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white, // White background inside border
                border: Border.all(
                  color: Colors.grey[400]!, // Border around image + text
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  // Image
                  Image.asset(
                    imagePath,
                    height: 64,
                  ),
                  SizedBox(height: 8),
                  // Item name
                  Text(
                    itemName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Price + button
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                formattedPrice,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
