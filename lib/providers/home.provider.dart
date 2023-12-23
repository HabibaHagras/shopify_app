import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/models/adv.model.dart';
import 'package:shopify_app/utils/collections.utils.dart';

class HomeProvider extends ChangeNotifier {
  List<Adv>? adList;

  void initHomeProvider() async {
    await getAds();
  }

  Future<void> getAds() async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(CollectionsUtils.ads.name)
        .get();
    adList =
        List<Adv>.from(result.docs.map((e) => Adv.fromJson(e.data(), e.id)));
    notifyListeners();
  }
}