import 'package:flutter/material.dart';
import 'package:untitled1/styles/colors.dart';

class CategoriesWidget2  extends StatelessWidget {
  final String name;
  final String imageURL;
  const CategoriesWidget2({super.key,
    required this.name,
    required this.imageURL
  });

  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    double  width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
          left: 80,
          top: 18),
      child: Container(
        width: width*0.25,
        height: height*0.15,
        decoration: const BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.only(
              bottomLeft:  Radius.circular(50),
              topLeft: Radius.circular(50),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Center(
                child: Text(
                  ' $name',
                  style:  TextStyle(
                      color: whiteColor,
                      fontFamily: 'Frankgoic',
                    fontSize: width*0.044

                  ),
                ),
              ),
            ),


            AspectRatio(

              aspectRatio: 4.4/ 4,
              child: Image.network(imageURL, fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
