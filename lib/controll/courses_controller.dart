import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/model/course_model.dart';
import '../view/student_view/global_dailog.dart';

class CoursesControllers {
  static Future getCourses(
      String department, semester, BuildContext context) async {
    if (Constants.courses.isNotEmpty) {
      Constants.courses.clear();
    }
    EasyLoading.show(status: "Please Wait...");
    await FirebaseFirestore.instance
        .collection('Courses')
        .where("department", isEqualTo: department)
        .where("semester", isEqualTo: semester)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var data in value.docs) {
          Constants.courses.add(courseModel(
            data.id,
            data['code'].toString(),
            data['creditHours'].toString(),
            data['department'].toString(),
            data['semester'].toString(),
            data['teacherID'].toString(),
            data['title'].toString(),
          ));
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
