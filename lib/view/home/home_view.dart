import 'package:flutter/material.dart';
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/view/home/components/common_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: 'Store App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.5,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CommonCard(
            image: Image.asset('assets/bag.png'),
            title: 'Title',
            description: 'This is the Water proof bag',
            price: 'Rs 500',
            buttonText: 'Add to Cart',
            onPressed: () {},
          );
        },
      ),
    );
  }
}
