import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';
import 'package:untitled1/styles/colors.dart';

class AddToCard extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  final String name;
  final String imageURL;
  final int price;

  AddToCard({super.key,
    required this.name,
    required this.imageURL,
    required this.price

  });
  
  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    // double  width= MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: double.infinity,
            height: height*0.3,
            child: Image.network(imageURL, fit: BoxFit.cover,)),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(
            name,
            style: const TextStyle(
                color: blackColor,
                fontFamily: 'Frankgoic',
                fontSize: 25
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Text(
            '$price SP',
            style: const TextStyle(
                color: blackColor,
                fontFamily: 'Frankgolight',
                fontSize: 20
            ),
          ),
        ),
        Obx(()=> Row(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed:(){ dataController.min();}, icon: const Icon(Icons.exposure_minus_1, size: 30,)),
              Text('${dataController.num.value}',
                style: const TextStyle(
                  color: blackColor,
                  fontFamily: 'Frankgoic',
                  fontSize: 25
              ),),
              IconButton(onPressed:(){dataController.plus();}, icon:
              const Icon(
                Icons.exposure_plus_1,
                size: 30,

              )),

            ],
          ),
        ),
        OutlinedButton(onPressed: (){
          Get.back();
          Get.snackbar('Successfully ', 'Your Item added Successfully ');
        }, child: const Text(
          'Add To My Card',
          style: TextStyle(
            color: Colors.green
          ),
        ))
      ],
    );
  
  }
}
