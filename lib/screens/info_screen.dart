import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {

  final String name;
  final String imageUlr;

  const InfoScreen({super.key, required this.name,required this.imageUlr});


  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    double  width= MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [

              Container(
                width: width *0.35,
                height: height *0.35,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40)
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left:8.0 , right: 8.0, ),
                child: Column(
                  children: [
                    Container(
                        width: width *0.32,
                        height: height *0.25,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40)
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        name,
                        style: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [

              Container(
                width:width *0.35,
                height: height *0.35,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40)
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left:8.0 , right: 8.0, ),
                child: Column(
                  children: [
                    Container(
                        width: width *0.32,
                        height:  height *0.25,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40)
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Image.network(
                        imageUlr
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );

  }
}
