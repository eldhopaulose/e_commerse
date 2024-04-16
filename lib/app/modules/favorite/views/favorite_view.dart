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
    Get.put(FavoriteController(), permanent: true);
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
          child: StreamBuilder(
        stream: controller.fetchCustomerProductLikede,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              shrinkWrap: true,
              childAspectRatio:
                  MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(snapshot.data!.likes!.length, (index) {
                final data = snapshot.data!.likes![index];
                // Your code here
                return Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                          onTap: () {
                            Get.to(DetailView(),
                                arguments: data.productId!.sId);
                          },
                          child: StreamBuilder(
                            stream: controller.fetchCustomerProductLikedeById,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else if (snapshot.hasData) {
                                final likedId = snapshot.data!.likes;
                                return ProductCard(
                                  name: data.productId!.name.toString(),
                                  price: data.productId!.price.toString(),
                                  disprice: data.productId!.discount.toString(),
                                  image: data.productId!.thumbnail.toString(),
                                  onPressed: () async {},
                                  productId: data.productId!.sId ?? '',
                                  likedId: likedId as List,
                                );
                              } else {
                                return Container();
                              }
                            },
                          )),
                    ),
                  ],
                );
                // Replace Container() with your desired widget
              }),
            );
          }
          return Container();
        },
      )),
    );
  }
}
