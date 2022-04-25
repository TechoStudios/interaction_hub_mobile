import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:interaction_hub/view/teacher_view/send_push_notification_screen.dart';
import 'package:interaction_hub/view/teacher_view/teacher_feedback_screen.dart';
import '../../constants/Constants.dart';
import '../../model/teacher_model.dart';
import '../student_view/global_dailog.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                  height: 30,
                ),

                ///feedback row
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TeacherFeedbackPage()));
                            },
                            child: Card(
                              color: Colors.transparent,
                              elevation: 2,
                              child: Container(
                                width: size.width / 2.5,
                                height: 140,
                                decoration: const BoxDecoration(
                                    // border: Border.all(width: 3, color: Colors.white),
                                    ),
                                child: const Icon(
                                  Icons.reviews,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Feedback",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),

                      ///courses
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SendNotificationPage()));
                            },
                            child: Card(
                              color: Colors.transparent,
                              elevation: 2,
                              child: Container(
                                width: size.width / 2.5,
                                height: 140,
                                decoration: const BoxDecoration(
                                    //border: Border.all(width: 3, color: Colors.white),
                                    ),
                                child: const Icon(
                                  Icons.book,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Send Message",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                ///chatroam row
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              color: Colors.transparent,
                              elevation: 2,
                              child: Container(
                                width: size.width / 2.5,
                                height: 140,
                                decoration: const BoxDecoration(
                                    //border: Border.all(width: 3, color: Colors.white),
                                    ),
                                child: const Icon(
                                  Icons.chat,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Chatroom",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              color: Colors.transparent,
                              elevation: 2,
                              child: Container(
                                width: size.width / 2.5,
                                height: 140,
                                // decoration: BoxDecoration(
                                //     // border: Border.all(width: 3, color: Colors.white),
                                //     ),
                                child: const Icon(
                                  Icons.schedule_outlined,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Timetable",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
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
