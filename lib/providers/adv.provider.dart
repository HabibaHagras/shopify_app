import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shopify_app/models/adv.model.dart';
import 'package:shopify_app/models/category.model.dart';

class AdvProvider {
  Future<List<Adv>?> getAdv(BuildContext context,
      {int? limit}) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection('ads')
            .limit(limit)
            .get();
      } else {
        result =
            await FirebaseFirestore.instance.collection('ads').get();
      }

      if (result.docs.isNotEmpty) {
        var AdvList = List<Adv>.from(
                result.docs.map((e) => CategoryData.fromJson(e.data(), e.id)))
            .toList();

        return AdvList;
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