import 'package:flutter/material.dart';

class CommonCardCart extends StatelessWidget {
  final String title;
  final String price;
  final int quantity;
  final Function(int) onQuantityChanged;

  const CommonCardCart({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
    required Image image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(price),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    onQuantityChanged(quantity - 1);
                  },
                ),
                Text('$quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    onQuantityChanged(quantity + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
