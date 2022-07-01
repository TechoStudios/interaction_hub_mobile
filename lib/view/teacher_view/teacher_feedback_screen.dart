import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/Constants.dart';

class TeacherFeedbackPage extends StatefulWidget {
  const TeacherFeedbackPage({Key? key}) : super(key: key);

  @override
  State<TeacherFeedbackPage> createState() => _TeacherFeedbackPageState();
}

class _TeacherFeedbackPageState extends State<TeacherFeedbackPage> {
  ScrollController scollBarController = ScrollController();
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
                    "Feedbacks",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Feedbacks')
                        .where("teacherID",
                            isEqualTo: Constants.loginTeacher[0].id)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? Scrollbar(
                              controller: scollBarController,
                              isAlwaysShown: true,
                              child: ListView.builder(
                                  controller: scollBarController,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.transparent,
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ///fb1
                                            Text(
                                              snapshot.data!.docs[index]
                                                  .data()["fb1"][0],
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              color: Colors.grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  snapshot.data!.docs[index]
                                                      .data()["fb1"][1]
                                                      .toString()
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),

                                            ///fb2
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  .data()["fb2"][0],
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              color: Colors.grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  snapshot.data!.docs[index]
                                                      .data()["fb2"][1]
                                                      .toString()
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),

                                            ///fb3
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  .data()["fb3"][0],
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              color: Colors.grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  snapshot.data!.docs[index]
                                                      .data()["fb3"][1]
                                                      .toString()
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),

                                            ///fb4
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  .data()["fb4"][0],
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              color: Colors.grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  snapshot.data!.docs[index]
                                                      .data()["fb4"][1]
                                                      .toString()
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),

                                            ///fb5
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  .data()["fb5"][0],
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              color: Colors.grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  snapshot.data!.docs[index]
                                                      .data()["fb5"][1]
                                                      .toString()
                                                      .toUpperCase(),
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : const Card(
                              color: Colors.transparent,
                              elevation: 2,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "Feedback not available",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
