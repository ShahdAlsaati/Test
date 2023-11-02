import 'package:untitled1/styles/colors.dart';
import 'add_card.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String name;
  final String imageURL;
  final int price;

  const ItemWidget({key,
    required this.name,
    required this.imageURL,
    required this.price}): super(key: key);

  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    double  width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 15, left:8.0 , right: 24.0, bottom: 15 ),
      child: Stack(
        alignment:AlignmentDirectional.bottomCenter ,

        fit: StackFit.loose,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: <Widget>[
          SizedBox(
            width: width *0.50,
            height:height*0.50,
          ),
          Align(
            alignment: Alignment.bottomCenter,

            child: Container(
              width: width *0.4,
              height:height*0.21,
              decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(25)
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,

            child: Center(
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
                      size:  Size.fromRadius(width*0.18), // Image radius
                      child: Image.network(imageURL, fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 18.0),
                    child: Text(
                      name,
                      style:  TextStyle(
                          color: whiteColor,
                          fontFamily: 'Frankgoic',
                          fontSize: width*0.06
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      '$price SP',
                      style:  TextStyle(
                          color: whiteColor,
                          fontFamily: 'Frankgolight',
                          fontSize: width*0.055
                      ),
                    ),
                  ),
                  IconButton(onPressed:(){
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return AddToCard(
                          name: name,
                          price: price,
                          imageURL: imageURL,
                        );
                      },
                    );
                  }, icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,

                  )),

                ],
              ),
            ),

          ),

        ],

      ),
    );

  }
}
