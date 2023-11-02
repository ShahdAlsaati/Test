import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/screens/item_screen.dart';
import 'package:untitled1/widget/cat_widget.dart';

import '../controller.dart';
import 'package:untitled1/styles/colors.dart';
import '../widget/header_widget.dart';
import 'home_screen_2.dart';

class HomeScreen extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    double  width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const HeaderWidget(),


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

                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 30, top: 20),
                        child: InkWell(
                          onTap: (){
                            Get.to(HomeScreen2());
                          },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Explore Categories',
                                  style: TextStyle(
                                    fontSize: width*0.071,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                      fontFamily: 'FrankgoMedium'


                                  ),


                                ),
                              ),
                              ImageIcon(
                                AssetImage('assets/icons/show icon.png'),
                              ),                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: height*0.65,
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
                                  itemCount: dataController.categories.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing:2,
                                    childAspectRatio: 0.8,
                                  ),

                                  itemBuilder: (context, index) {
                                    final category = dataController.categories[index];

                                    return InkWell(
                                      onTap: (){
                                        Get.to(ItemScreen(category: category, title: category.name,));
                                      },
                                      child: CategoriesWidget(
                                        name:category.name,
                                        imageURL: category.imageUrl,
                                      ),
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


}
