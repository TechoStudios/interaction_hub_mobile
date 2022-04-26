import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/Constants.dart';
import '../student_view/chat.dart';
import 'chat_screen.dart';

class GroupChatPage extends StatefulWidget {
  const GroupChatPage({Key? key}) : super(key: key);

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Groups"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Courses')
              .where("teacherID", isEqualTo: Constants.loginTeacher[0].id)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeacherGroupChat(
                                          snapshot.data!.docs[index]
                                                  .data()["title"]
                                                  .toString()
                                                  .replaceAll(" ", "") +
                                              snapshot.data!.docs[index]
                                                  .data()["semester"]
                                                  .toString(),
                                          snapshot.data!.docs[index]
                                                  .data()["title"]
                                                  .toString()
                                                  .replaceAll(" ", "") +
                                              snapshot.data!.docs[index]
                                                  .data()["semester"]
                                                  .toString(),
                                        )));
                          },
                          child: Card(
                            color: Colors.blueGrey,
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.docs[index].data()["title"],
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "Semester " +
                                        snapshot.data!.docs[index]
                                            .data()["semester"],
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : const Card(
                    color: Colors.transparent,
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Groups does not available",
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
    );
  }
}
