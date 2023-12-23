import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shopify_app/models/product.model.dart';

class ProductProvider {
  Future<List<Product>?> getProducts(BuildContext context, {int? limit}) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection('products')
            .limit(limit)
            .get();
      } else {
        result = await FirebaseFirestore.instance.collection('products').get();
      }

      if (result.docs.isNotEmpty) {
        var productsList = List<Product>.from(
            result.docs.map((e) => Product.fromJson(e.data(), e.id))).toList();

        return productsList;
      } else {
        return [];
      }
    } catch (e) {
      if (!context.mounted) return null;
      await QuickAlert.show(
          context: context, type: QuickAlertType.error, title: e.toString());
      return null;
    }
  }
}
/*
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
*/