import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/model/loginUserModel.dart';
import 'package:interaction_hub/view/teacher_home_screen.dart';

import '../view/student_home_screen.dart';
import '../view/global_dailog.dart';

class Controllers {
  static Future loginController(
      String userName, password, udid, BuildContext context) async {
    if (Constants.loginStudent.isNotEmpty ||
        Constants.loginTeacher.isNotEmpty) {
      Constants.loginStudent.clear();
      Constants.loginTeacher.clear();
    }
    EasyLoading.show(status: "Please Wait...");
    await FirebaseFirestore.instance
        .collection('Accounts')
        .where("username", isEqualTo: userName)
        .where("password", isEqualTo: password)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var data in value.docs) {
          FirebaseFirestore.instance
              .collection("Accounts")
              .doc(data.id)
              .update({"udid": udid});
          data['role'].toString() == "student"
              ? Constants.loginStudent.add(loginStudentModel(
                  data.id,
                  data['name'].toString(),
                  data['username'].toString(),
                  data['courseID'].toString(),
                  data['password'].toString(),
                  data['role'].toString(),
                  data['semester'].toString(),
                  data['department'].toString(),
                  data['section'].toString()))
              : Constants.loginTeacher.add(loginTeacherModel(
                  data.id,
                  data['name'].toString(),
                  data['username'].toString(),
                  data['semester'].toString(),
                  data['password'].toString(),
                  data['role'].toString(),
                  data['department'].toString(),
                ));
          Constants.box.write("login", "true");
          Constants.box.write("username", userName);
          Constants.box.write("password", password);

          data['role'].toString() == "student"
              ? Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => StudentHomePage()))
              : Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => TeacherHomePage()));
          EasyLoading.showSuccess("Login success.");
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
                  contaxt:
                      'You enter wrong credentials, Please try again with correct credentials.',
                ));
      }
    });
  }

  static Future login(
    String userName,
    password,
  ) async {
    if (Constants.loginStudent.isNotEmpty ||
        Constants.loginTeacher.isNotEmpty) {
      Constants.loginStudent.clear();
      Constants.loginTeacher.clear();
    }
    await FirebaseFirestore.instance
        .collection('Accounts')
        .where("username", isEqualTo: userName)
        .where("password", isEqualTo: password)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var data in value.docs) {
          data['role'].toString() == "student"
              ? Constants.loginStudent.add(loginStudentModel(
                  data.id,
                  data['name'].toString(),
                  data['username'].toString(),
                  data['courseID'].toString(),
                  data['password'].toString(),
                  data['role'].toString(),
                  data['semester'].toString(),
                  data['department'].toString(),
                  data['section'].toString()))
              : Constants.loginTeacher.add(loginTeacherModel(
                  data.id,
                  data['name'].toString(),
                  data['username'].toString(),
                  data['semester'].toString(),
                  data['password'].toString(),
                  data['role'].toString(),
                  data['department'].toString(),
                ));
        }
      }
    });
  }

  static Future getUserCourse() async {
    await FirebaseFirestore.instance
        .collection("Courses")
        .doc(Constants.loginStudent[0].courseID)
        .get()
        .then((value) {
      if (value.data().toString().isNotEmpty) {
        Constants.courseName = value["title"];
      }
    });
  }
}
