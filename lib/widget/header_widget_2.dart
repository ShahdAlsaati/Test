
import 'package:flutter/material.dart';
import 'package:untitled1/styles/colors.dart';
import 'package:get/get.dart';

class HeaderWidget2 extends StatelessWidget {
  final String title;
  const HeaderWidget2({super.key,
    required this.title
  });
  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    double  width= MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight:Radius.circular(40)),
        color: blackColor,

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height:height *0.06,

          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const ImageIcon(
                    AssetImage('assets/icons/back icon.png'),
                    color: whiteColor,
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  width:width *0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),

                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(
                          AssetImage('assets/icons/search icon.png'),
                        ),


                        ImageIcon(
                          AssetImage('assets/icons/menu icon.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height*0.04,
          ),
          Text(
            title,
            style:  TextStyle(
              fontSize: width*0.14,
              color: whiteColor,
              fontFamily: 'Frankgo1',

            ),

          ),
          SizedBox(
            height: height*0.04,
          ),
        ],
      ),
    );

  }
}
