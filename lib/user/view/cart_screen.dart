import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: 500,
                color: Colors.blue,
              ),
            ),
            // ListView.builder(
            //   itemBuilder: (context,index){
            //     return ListTile();
            //   }
            // )
          ],
        ),
      ),
    );
  }
}