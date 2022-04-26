import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import '../../constants/Constants.dart';
import '../../model/teacher_model.dart';
import '../student_view/global_dailog.dart';

class SendNotificationPage extends StatefulWidget {
  const SendNotificationPage({Key? key}) : super(key: key);

  @override
  State<SendNotificationPage> createState() => _SendNotificationPageState();
}

class _SendNotificationPageState extends State<SendNotificationPage> {
  final messageBodyControllers = TextEditingController();
  final messageTitleControllers = TextEditingController();

  final passwordController = TextEditingController();
  String? department;
  String? semester;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final ids = Constants.allStudents.map((e) => e.department).toSet();
    Constants.allStudents.retainWhere((x) => ids.remove(x.department));
    requestPermission();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void sendPushMessage(
      String title, String body, String semester, String department) async {
    EasyLoading.show(status: "Please wait...");
    QuerySnapshot ref = await FirebaseFirestore.instance
        .collection('Accounts')
        .where("semester", isEqualTo: semester)
        .where("department", isEqualTo: department)
        .get();
    for (var snapshot in ref.docs) {
      try {
        await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAAF4F1kbI:APA91bEnWKS9bMDjHtOv9uao7uHssmPiIe8SJUSXrk5_1fiQBBelropw9Igc0UG3d-4j7HRj4q0mnhEWSLQBiVKaC3gp-cQysjkhMiSn3dQ0Bs1ixC_RXFkSUDrQZFPilLAaAbeYvlAT',
          },
          body: jsonEncode(
            <String, dynamic>{
              'notification': <String, dynamic>{'body': body, 'title': title},
              'priority': 'high',
              'data': <String, dynamic>{
                'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                'id': '1',
                'status': 'done'
              },
              "to": snapshot['udid'],
            },
          ),
        );
        EasyLoading.showSuccess("Message send successfully.");
      } catch (e) {
        EasyLoading.showError("Some thing went wrong ! try again.");

        print("error push notification");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"),
                colorFilter: ColorFilter.mode(
                  Colors.pinkAccent,
                  BlendMode.darken,
                ),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Image.asset(
                    "assets/logo.png",
                    color: Colors.white,
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Send BroadCost Message",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Target Receivers",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Card(
                        elevation: 20,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: department,
                              isExpanded: true,
                              hint: const Text("Select Department",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  maxLines: 1),
                              items: Constants.allStudents
                                  .map((StudentModel value) {
                                return DropdownMenuItem<String>(
                                  value: value.department,
                                  child: Text(
                                    value.department.isEmpty
                                        ? ""
                                        : value.department,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w400),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  department = value.toString();
                                });
                                print("hi = " + department.toString());
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 20,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: semester,
                              isExpanded: true,
                              hint: const Text("Select Semester",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  maxLines: 1),
                              items: ["1", "2", "3", "4", "5", "6", "7", "8"]
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value.isEmpty ? "" : value,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w400),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  semester = value.toString();
                                });
                                print("hi = " + semester.toString());
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Type Message",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Card(
                    elevation: 20,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400),
                          validator: (String? val) =>
                              val!.isEmpty ? 'Please enter title' : null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message Title",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w400),
                          ),
                          controller: messageTitleControllers,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Card(
                    elevation: 20,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400),
                          validator: (String? val) =>
                              val!.isEmpty ? 'Please enter message' : null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message body",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w400),
                          ),
                          controller: messageBodyControllers,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      side: const BorderSide(width: 2, color: Colors.brown),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0),
                    ),
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      sendPushMessage(
                          messageTitleControllers.text,
                          messageBodyControllers.text,
                          semester.toString(),
                          department.toString());
                      // }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Send Message",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
