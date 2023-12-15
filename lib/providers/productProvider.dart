import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shopify_app/models/product.model.dart';
import 'package:shopify_app/seeder/data.seeder.dart';

class ProductProvider {
 


  Future<List> getProducts() async {
        List <Product> products = [];
       Map _data = {};
    await Future.delayed(const Duration(seconds: 3));
    var response = await rootBundle.loadString('assets/data/data.json');
    _data = jsonDecode(response);
   products =
        (_data['products'] as List).map((e) => Product.fromJson(e)).toList();
            return products;
  }
}
