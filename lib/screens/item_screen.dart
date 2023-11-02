import 'package:flutter/material.dart';
import '../model/cat_model.dart';
import 'package:untitled1/styles/colors.dart';
import '../widget/item_widget.dart';
import '../widget/header_widget_2.dart';
import 'package:get/get.dart';

import '../controller.dart';

class ItemScreen extends StatelessWidget {
  final Category category;
  final String title;

  ItemScreen({super.key,
    required this.category,
   required this.title
  });

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {

    double  height= MediaQuery.of(context).size.height;
    double  width= MediaQuery.of(context).size.width;
    // Determine the number of columns and aspect ratio based on screen width
    int crossAxisCount = width > 600 ? 3 : 2; // Use 3 columns on larger screens
    double childAspectRatio = width > 600 ? 0.7 : 0.6;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget2(
              title:title
            ),


            Stack(
              children: [
                Container(
                  color: blackColor,
                  width: double.infinity,
                  height: height*0.75,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(topLeft:Radius.circular(40)),
                      border: Border.all(
                          color: whiteColor
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       SizedBox(
                        height: height*0.001,
                      ),

                      SizedBox(
                        height: 700,
                        child: Obx(
                              () {
                            if (dataController.categories.isEmpty) {
                              return const Center(child: CircularProgressIndicator());
                            } else {

                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),

                                  itemCount: category.subCategories?.length ?? 0,

                                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing:2,
                                    childAspectRatio:childAspectRatio,
                                  ),

                                  itemBuilder: (context, index) {

                                    final subCategory = category.subCategories![index];

                                    return ItemWidget(

                                      name:subCategory.name,
                                      imageURL: subCategory.imageUrl,
                                      price:subCategory.price,
                                    );
                                  },

                                ),
                              );
                            }
                          },
                        ),
                      )

                    ],
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int columns = (screenWidth / 150).floor(); // Adjust the item width as needed
    return columns > 0 ? columns : 1;
  }

  double calculateChildAspectRatio(BuildContext context) {
    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = (MediaQuery.of(context).size.width / 2) / (MediaQuery.of(context).size.height * 0.75);
    return aspectRatio;
  }
}
