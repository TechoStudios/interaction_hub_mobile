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

  static Future setFeedback(
      String id, q1, ans1, q2, ans2, q3, ans3, q4, ans4, q5, ans5) async {
    EasyLoading.show(status: "Please Wait...");
    await FirebaseFirestore.instance.collection("Feedbacks").add({
      "teacherID": id,
      "fb1": FieldValue.arrayUnion([q1, ans1]),
      "fb2": FieldValue.arrayUnion([q2, ans2]),
      "fb3": FieldValue.arrayUnion([q3, ans3]),
      "fb4": FieldValue.arrayUnion([q4, ans4]),
      "fb5": FieldValue.arrayUnion([q5, ans5]),
      "dateTime": DateTime.now()
    });
    EasyLoading.showSuccess("Feedback submitted.");
  }

  static Future getAllTeacher() async {
    await FirebaseFirestore.instance
        .collection("Accounts")
        .where("role", isEqualTo: "teacher")
        .where("department", isEqualTo: Constants.loginStudent[0].department)
        .where("semester", isEqualTo: Constants.loginStudent[0].semester)
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
