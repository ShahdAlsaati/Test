import 'package:flutter/material.dart';
import 'package:untitled1/styles/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height:height *0.06,

          ),
          Center(
            child: Container(
              width:width *0.85,
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
          ),
          SizedBox(
            height: height*0.04,
          ),
           Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Text(
              'Welcome To \n'
                  'Shopping Shop',
              style: TextStyle(
                fontSize: width*0.12,
                fontWeight: FontWeight.bold,
                color: whiteColor,
                fontFamily: 'Frankgo1',

              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Text(
              'enjoy your trip',
              style: TextStyle(
                  fontSize: 30,
                  color:whiteColor
              ),
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
