import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/widget/cat_2.dart';
import '../controller.dart';
import 'package:untitled1/styles/colors.dart';
import '../widget/header_widget.dart';

class HomeScreen2 extends StatelessWidget {

  final DataController dataController = Get.put(DataController());

   HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    // double  width= MediaQuery.of(context).size.width;

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
                      color:whiteColor,
                      borderRadius: const BorderRadius.only(topLeft:Radius.circular(40)),
                      border: Border.all(
                          color:whiteColor
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 30, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Explore Categories',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                      fontFamily: 'FrankgoMedium'


                                  ),


                                ),
                              ),
                              ImageIcon(
                                AssetImage('assets/icons/show icon.png'),
                              ),
                            ],
                          ),
                        ),



                        SizedBox(
                          height: 600,
                          child: Obx(
                                () {
                              if (dataController.categories.isEmpty) {
                                return const Center(child: CircularProgressIndicator());
                              } else {
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: dataController.categories.length,
                                  itemBuilder: (context, index) {
                                    final category = dataController.categories[index];

                                    return CategoriesWidget2(
                                      name:category.name,
                                      imageURL: category.imageUrl,
                                    );
                                  },

                                );
                              }
                            },
                          ),
                        )

                      ],
                    ),
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
