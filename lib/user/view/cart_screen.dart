
// import 'package:comic_world/controller/cart_controller.dart';
// import 'package:comic_world/model/cart_model.dart';
// import 'package:comic_world/user/view/bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart'; 

// class CartScreen extends StatelessWidget {
//    CartScreen({super.key,});
//     final List<CartModel>cartItems=[];
//      String? totalPrice;

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider=Provider.of<CartController>(context,listen: false);
//     final user= Supabase.instance.client;
//     if(user !=null){
//         cartProvider.loadCart(user);

//     }
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFFE7F1FF), 
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           centerTitle: true,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//             onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar())),
//           ),
//           title: const Text(
//             "Shopping Cart",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           actions: const [
//             Padding(
//               padding: EdgeInsets.only(right: 16),
//               child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
//             ),
//           ],
//         ),
//       body: Consumer<CartController>(
//           builder: (context, cart, child) {
//             if (cart.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
      
//             if (cart.cartItems.isEmpty) {
//               return custom_empty_cart_card();
//             }
      
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ListView.separated(
//                       itemCount: cart.cartItems.length,
//                       separatorBuilder: (_, __) => const SizedBox(height: 15),
//                       itemBuilder: (context, index) {
//                         CartModel item = cart.cartItems[index];
//                         return
              
//                         Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.2),
//                                 blurRadius: 6,
//                                 offset: const Offset(0, 1),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               // Container(
//                               //   height: 90,
//                               //   width: 90,
//                               //   color: Colors.yellow,
//                               // ),
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(12),
//                                 child: item.imageUrl != null &&item.imageUrl!.isNotEmpty
//                                     ? Image.network(
//                                         item.imageUrl!,
//                                         height: 90,
//                                         width: 90,
//                                         fit: BoxFit.contain,
//                                       )
//                                     : Icon(Icons.broken_image,size: 90,)
//                               ),
//                               const SizedBox(width: 15),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       item.title,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16),
//                                     ),
//                                     const SizedBox(height: 6),
//                                     Text(
//                                       "\$${item.price.toStringAsFixed(2)}",
//                                       style: const TextStyle(
//                                           color: Colors.orange,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Row(
//                                       children: [
//                                         quantityButton(Icons.remove, () {
//                                           if (item.quantity > 1) {
//                                             cart.addToCart(CartItem(
//                                               id: item.id,
//                                               productId: item.id,
//                                               userId: item.id,
//                                               name: item.title,
//                                               price: item.price,
//                                               quantity: -1, 
//                                             ));
//                                           } else {
//                                             cart.removeFromCart(item.id);
//                                           }
//                                         }),
//                                         const SizedBox(width: 8),
//                                         Text(
//                                           item.quantity.toString(),
//                                           style: const TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         quantityButton(Icons.add, () {
//                                           cart.addToCart(CartItem(
//                                             id: item.id,
//                                             productId: item.id,
//                                             userId: item.id,
//                                             name: item.title,
//                                             price: item.price,
//                                             quantity: 1,
//                                           ));
//                                         }),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete_outline,
//                                     color: Colors.orange),
//                                 onPressed: () => cart.removeFromCart(item.id),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Center(
//                           child: Text(
//                             "Order Summary",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                         ),
//                         const Divider(),
//                         const SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text("Subtotal"),
//                        Text(
//                        "${cartProvider.totalPrice.toStringAsFixed(2)}",
//                        style: const TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 18,
//                      ),
//                      ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             Text("Tax"),
//                             Text("\$0"), 
//                           ],
//                         ),
//                         const Divider(),
//                         const SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               "Total",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                            Text(
//                                "${cartProvider.totalPrice.toStringAsFixed(2)}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 12),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.black,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               padding: const EdgeInsets.symmetric(vertical: 14),
//                             ),
//                             onPressed: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutScreen()));
//                             },
//                             child: const Text(
//                               "Checkout",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//   Widget quantityButton(IconData icon, VoidCallback onTap) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFFF2F2F2),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: IconButton(
//         icon: Icon(icon, size: 18),
//         onPressed: onTap,
//       ),
//     );
//   }

// }





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