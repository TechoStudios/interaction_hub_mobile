import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/model/loginUserModel.dart';
import 'package:interaction_hub/model/new_model.dart';

import '../view/global_dailog.dart';

class NewsControllers {
  static Future getNews() async {
    if (Constants.news.isNotEmpty) {
      Constants.news.clear();
    }
    await FirebaseFirestore.instance.collection('News').get().then((value) {
      if (value.docs.isNotEmpty) {
        for (var data in value.docs) {
          Constants.news.add(newsModel(
            data.id,
            data['dateTime'].toString(),
            data['news'].toString(),
          ));
        }
      }
    });
  }
}
