import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/model/feedback_model.dart';
import 'package:interaction_hub/model/teacher_model.dart';
import '../view/student_view/global_dailog.dart';

// ignore: camel_case_types
class feedbackController {
  static Future getFeedback(BuildContext context) async {
    if (Constants.feedback.isNotEmpty) {
      Constants.feedback.clear();
    }
    EasyLoading.show(status: "Please Wait...");
    await FirebaseFirestore.instance
        .collection('Feedbacks')
        .where("teacherID", isEqualTo: Constants.loginTeacher[0].id)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var data in value.docs) {
          Constants.feedback.add(feedbackModel(
            data.id,
            data['dateTime'].toString(),
            data['message'].toString(),
            data['teacherID'].toString(),
          ));
        }
      }
    });
  }

  static Future setFeedback(String id, message) async {
    EasyLoading.show(status: "Please Wait...");
    await FirebaseFirestore.instance
        .collection("Feedbacks")
        .add({"teacherID": id, "message": message, "dateTime": DateTime.now()});
    EasyLoading.showSuccess("Feedback submitted.");
  }

  static Future getAllTeacher() async {
    await FirebaseFirestore.instance
        .collection("Accounts")
        .where("role", isEqualTo: "teacher")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var data in value.docs) {
          Constants.teacherList.add(TeacherModel(data.id, data['name']));
        }
      }
    });
  }
}
