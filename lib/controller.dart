// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'model/cat_model.dart';

List<Category> parseJsonData(String json) {
  final parsed = jsonDecode(json);

  if (parsed['C1'] != null) {
    return List<Category>.from(parsed['C1'].map((category) {
      if (category['C2'] != null) {
        return Category(
          name: category['name'] ?? '',
          imageUrl: category['image_url'] ?? '',
          subCategories: List<SubCategory>.from(category['C2'].map((subCategory) {
            return SubCategory(
              name: subCategory['name'] ?? '',
              price: subCategory['price'] ?? 0,
              imageUrl: subCategory['image_url'] ?? '',
            );
          })),
        );
      }
      return Category(name: category['name'] ?? '', imageUrl: category['image_url'] ?? '');
    }));
  }

  return [];
}

class DataController extends GetxController {

  RxInt num =0.obs;

  plus()
  {
    num++;
  }
  min()
  {
    if(num>0) {
      num--;
    }
  }

  final categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load and parse JSON data here and update the categories list.
    loadAndParseJsonData() ;
  }
  Future<void> loadAndParseJsonData() async {
    try {
      final jsonData = await rootBundle.loadString('assets/data.json');
      final parsedData = parseJsonData(jsonData);
      categories.assignAll(parsedData);
      // print(parsedData);
    } catch (e) {
      throw('Error');
    }
  }
}

