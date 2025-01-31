import 'package:flutter/material.dart';
import 'package:store_app/res/space.dart';

class CommonCard extends StatelessWidget {
  final Widget image;
  final String title;
  // final String description;
  final String price;
  final String buttonText;
  final void Function() onPressed;
  const CommonCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    // required this.description,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      semanticContainer: true,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            Column(
              children: [
                Text(
                  maxLines: 2,
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SpaceH12(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onPressed,
                child: Text(buttonText, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
