import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black, // set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Added this line
        elevation: 0.0, // Added this line
        title: Center(
          child: Text(
            'My Cart',
            style: GoogleFonts.castoro(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              // You can set the color of the text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(index.toString()), // unique key for Dismissible
                  onDismissed: (direction) {},
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: 10), // add some space below each item
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                          255, 240, 245, 247), // light gray background color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Product Name",
                          style: GoogleFonts.grenze(
                            // Set the font size to 20
                            fontSize: 18,
                          )),
                      subtitle: Text('₹ 1212 ',
                          style: GoogleFonts.grenze(
                            fontSize: 15,
                          )),
                      leading: Image.network('https://via.placeholder.com/150',
                          width: 100),
                      trailing: Container(
                        padding: EdgeInsets.all(8.0), // Add some padding
                        decoration: BoxDecoration(
                          color: Colors.white, // Set the color of the box
                          borderRadius: BorderRadius.circular(
                              10), // Set the border radius
                          boxShadow: [
                            // Add a shadow effect
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                icon: Icon(Icons.remove,
                                    color: Colors.green, size: 15.0),
                                onPressed: () {}),
                            Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight
                                      .bold), // Increase the font size to 24 and make it bold
                            ),
                            IconButton(
                              icon: Icon(Icons.add,
                                  color: Colors.green, size: 15.0),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    '₹ 1212 ?? "0"}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 40, 167, 45),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 192, 243, 194),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed to Pay  ',
                      style: TextStyle(
                        color:
                            Colors.black, // Set the color of the text to black
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 15.0),
                  ],
                ),
                onPressed: () {
                  Get.to(() => CartView());
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
