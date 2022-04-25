import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/model/timetable_model.dart';

import '../view/global_dailog.dart';

class TimetableControllers {
  static Future getTimetable(
      String department, semester, section, BuildContext context) async {
    if (Constants.timetable.isNotEmpty) {
      Constants.timetable.clear();
    }
    EasyLoading.show(status: "Please Wait...");
    await FirebaseFirestore.instance
        .collection('TimeTable')
        .where('department', isEqualTo: department)
        .where("semester", isEqualTo: semester)
        .where('section', isEqualTo: section)
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        for (var data in value.docs) {
          await FirebaseFirestore.instance
              .collection("Courses")
              .doc(data['courseID'])
              .get()
              .then((value2) async {
            await FirebaseFirestore.instance
                .collection("Accounts")
                .doc(data["teacherID"])
                .get()
                .then((value3) {
              Constants.timetable.add(timetableModel(
                data.id,
                data['Day'].toString(),
                value2['title'].toString(),
                data['department'].toString(),
                data['lectureHall'].toString(),
                data['section'].toString(),
                data['semester'].toString(),
                value3['name'].toString(),
                data['timeEnd'].toString(),
                data['timeStart'].toString(),
              ));
            });
          });
          EasyLoading.showSuccess("success.");
        }
      } else {
        EasyLoading.dismiss();
        showDialog(
            context: context,
            builder: (BuildContext context) => showPopUpDailog(
                  function: () {
                    Navigator.pop(context);
                  },
                  title: "Alert",
                  contaxt: 'SomeThing went Wrong',
                ));
      }
    });
  }
}
