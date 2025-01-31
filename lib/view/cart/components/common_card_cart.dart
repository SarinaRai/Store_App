import 'package:flutter/material.dart';

class CommonCardCart extends StatefulWidget {
  final String title;
  final String price;
  const CommonCardCart({super.key, required this.title, required this.price});
  @override
  State<CommonCardCart> createState() => _CommonCardCartState();
}

class _CommonCardCartState extends State<CommonCardCart> {
  int quntity = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.shopping_cart, color: Colors.red),
        title: Text(widget.title),
        subtitle: Text(widget.price),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    quntity++;
                  });
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (quntity > 1) {
                      quntity--;
                    }
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
