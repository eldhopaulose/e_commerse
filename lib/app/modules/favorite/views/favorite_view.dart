import 'package:e_commerse/app/modules/detail/views/detail_view.dart';
import 'package:e_commerse/app/modules/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white, // Added this line
        elevation: 0.0, // Added this line
        title: Center(
          child: Text('Favorite',
              style: GoogleFonts.castoro(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // You can set the color of the text
              )),
        ),
      ),
      body: SingleChildScrollView(
          child: InkWell(
              onTap: () {
                Get.to(DetailView());
              },
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 90, left: 10, right: 10),
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  shrinkWrap: true,
                  childAspectRatio:
                      MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(10, (index) {
                    // Your code here
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                              onTap: () {
                                Get.to(
                                  () => DetailView(),
                                );
                              },
                              child: ProductCard(
                                name: "jjjggjgj?? ''",
                                price: "3343 ",
                                disprice: "2323",
                                image:
                                    "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                                onPressed: () async {
                                  print('aaaaaaaaa');
                                },
                                productId: "12123123",
                                likedId: ["123123", "123123", "123123"],
                              )),
                        ),
                      ],
                    );
                    // Replace Container() with your desired widget
                  }),
                ),
              ))),
    );
  }
}
