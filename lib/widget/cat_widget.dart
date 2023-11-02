import 'package:flutter/material.dart';
import 'package:untitled1/styles/colors.dart';

class CategoriesWidget extends StatelessWidget {
  final String name;
  final String imageURL;
   const CategoriesWidget({super.key,
    required this.name,
    required this.imageURL
});

  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    double  width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left:8.0 , right: 24.0, bottom: 7 ),
      child: Stack(

        children: [
          Container(
            width: width *0.50,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(25)
            ),
          ),

          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height*0.01,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40), // Image border
                  child: SizedBox.fromSize(
                    size:  Size.fromRadius(width*0.17), // Image radius
                    child: Image.network(imageURL, fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    name,
                    style:  TextStyle(
                        color: whiteColor,
                      fontFamily: 'Frankgoic',
                      fontSize: width*0.064
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

  }
}
