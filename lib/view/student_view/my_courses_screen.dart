import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:interaction_hub/constants/Constants.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("My Courses"),
      ),
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
        child: ListView.builder(
            itemCount: Constants.courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: ExpansionTileCard(
                  baseColor: Colors.blueGrey.withOpacity(0.4),
                  initiallyExpanded: true,
                  leading: CircleAvatar(
                      backgroundColor: const Color(0xFF000080),
                      child: Text(
                        Constants.courses[index].title
                            .substring(0, 2)
                            .toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  title: Text(
                    Constants.courses[index].title.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  children: <Widget>[
                    const Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Semester : ",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  Constants.courses[index].semester,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Course Code : ",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                Constants.courses[index].couseCode,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Cdt Hours : ",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  Constants.courses[index].creditHours,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Dep: ",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                Constants.courses[index].department,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
