import 'package:flutter/material.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/controll/courses_controller.dart';
import 'package:interaction_hub/controll/feedback_Controller.dart';
import 'package:interaction_hub/controll/login_controller.dart';
import 'package:interaction_hub/controll/news_controller.dart';
import 'package:interaction_hub/controll/timetable_controller.dart';
import 'package:interaction_hub/view/student_view/chat.dart';
import 'package:interaction_hub/view/student_view/feedback_screen.dart';
import 'package:interaction_hub/view/student_view/my_courses_screen.dart';
import 'package:interaction_hub/view/student_view/student_chat_groups_screen.dart';
import 'package:interaction_hub/view/timetable_screen.dart';
import 'package:marquee/marquee.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StudentHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    feedbackController.getAllTeacher();
    Controllers.getUserCourse();
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

                ///detail section
                Card(
                  color: Colors.transparent,
                  elevation: 2,
                  child: Container(
                    width: size.width - 30,
                    height: 140,
                    decoration: const BoxDecoration(
                        // border: Border.all(width: 3, color: Colors.white),
                        ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Row(
                            children: [
                              const Text(
                                "Name : ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                Constants.loginStudent[0].name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Row(
                            children: [
                              const Text(
                                "Semester : ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                Constants.loginStudent[0].semester,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Row(
                            children: [
                              const Text(
                                "Section : ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                Constants.loginStudent[0].section,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Row(
                            children: [
                              const Text(
                                "Department : ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                Constants.loginStudent[0].department,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                ///news section
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Latest News",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ),
                      Card(
                        color: Colors.transparent,
                        elevation: 2,
                        child: Container(
                            width: size.width,
                            height: 50,
                            decoration: const BoxDecoration(
                                // border: Border.all(width: 3, color: Colors.white),
                                ),
                            child: Marquee(
                              text: Constants.news[0].news,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                              scrollAxis: Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              blankSpace: 15.0,
                              velocity: 100.0,
                              pauseAfterRound: const Duration(seconds: 1),
                              startPadding: 10.0,
                              accelerationDuration: const Duration(seconds: 1),
                              accelerationCurve: Curves.linear,
                              decelerationDuration:
                                  const Duration(milliseconds: 500),
                              decelerationCurve: Curves.easeOut,
                            )),
                      ),
                    ],
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
                                          const FeedBackPage()));
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
                              CoursesControllers.getCourses(
                                      Constants.loginStudent[0].department,
                                      Constants.loginStudent[0].semester,
                                      context)
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyCourses()));
                              });
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
                            "My Courses",
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StudentGroupPage()));
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
                            onTap: () {
                              TimetableControllers.getStudentTimetable(
                                  Constants.loginStudent[0].department,
                                  Constants.loginStudent[0].semester,
                                  Constants.loginStudent[0].section,
                                  context);
                            },
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
