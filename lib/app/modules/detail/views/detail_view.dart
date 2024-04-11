import 'package:e_commerse/app/modules/data/colors.dart';
import 'package:e_commerse/app/modules/widgets/commmon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Product Details',
              style: GoogleFonts.grenze(
                color: AppColor.green,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ) // You can set the color of the text
              ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageSlideshow(
                      /// Width of the [ImageSlideshow].
                      width: double.infinity,

                      /// Height of the [ImageSlideshow].
                      height: 200,

                      /// The page to show when first creating the [ImageSlideshow].
                      initialPage: 0,

                      /// The color to paint the indicator.
                      indicatorColor: AppColor.green,

                      /// The color to paint behind th indicator.
                      indicatorBackgroundColor: Colors.grey,

                      /// The widgets to display in the [ImageSlideshow].
                      /// Add the sample image file into the images folder
                      children: [
                        // for (var i in snapshot.data!.product!.image!)
                        //   Image.network(i),

                        Image.network(
                            'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                      ],

                      /// Called whenever the page in the center of the viewport changes.
                      onPageChanged: (value) {
                        print('Page changed: $value');
                      },

                      /// Auto scroll interval.
                      /// Do not auto scroll with null or 0.

                      /// Loops back to first slide.
                      isLoop: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Product Name',
                      style: GoogleFonts.grenze(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '₹ 222',
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColor.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '₹ 444',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 20,
                            color: AppColor.darkGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'About',
                      style: GoogleFonts.grenze(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "lorim ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: GoogleFonts.lindenHill(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 155, 150, 146),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width * 0.4,
                          //   child: CommonButton(
                          //     btnButtonWidth: double.infinity,
                          //     btnText: 'Buy Now',
                          //     btnHeight: 50,
                          //     btnOnPressed: () {
                          //       controller.buyNow(double.parse(
                          //           snapshot.data!.product!.discount!));
                          //     },
                          //   ),
                          // ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: CommonButton(
                              btnButtonWidth: double.infinity,
                              btnText: 'Add to Cart',
                              btnHeight: 50,
                              btnOnPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
