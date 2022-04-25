import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/controll/login_controller.dart';
import 'package:interaction_hub/controll/news_controller.dart';
import 'package:interaction_hub/view/student_home_screen.dart';
import 'package:interaction_hub/view/login_screen.dart';
import 'package:interaction_hub/view/teacher_home_screen.dart';

import 'model/loginUserModel.dart';
import 'model/teacher_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NewsControllers.getNews();
  await GetStorage.init();
  await getAllStudents();
  Constants.login = Constants.box.read("login").toString();
  Constants.username = Constants.box.read("username").toString();
  Constants.password = Constants.box.read("password").toString();
  await Controllers.login(Constants.username, Constants.password);
  runApp(const MyApp());
}

Future getAllStudents() async {
  if (Constants.allStudents.isNotEmpty) {
    Constants.allStudents.clear();
  }
  await FirebaseFirestore.instance
      .collection("Accounts")
      .where("role", isEqualTo: "student")
      .get()
      .then((value) {
    if (value.docs.isNotEmpty) {
      for (var data in value.docs) {
        Constants.allStudents.add(StudentModel(
          data['department'],
          data['semester'],
        ));
      }
    }
  });
  print(Constants.allStudents[0].department);
  print(Constants.allStudents[1].department);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Constants.login == "true"
          ? Constants.loginStudent.isNotEmpty
              ? StudentHomePage()
              : TeacherHomePage()
          : LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}
