import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Text(
          "Your Cart is empty",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
