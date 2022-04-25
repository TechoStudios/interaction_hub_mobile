import 'package:flutter/material.dart';
import 'package:interaction_hub/constants/Constants.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.timetable.sort((a, b) {
      return a.timeStart.compareTo(b.timeStart);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("My Timetable"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                ///monday
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 115,
                        color: Colors.grey,
                        child: const Text("Monday"),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Constants.timetable.length,
                            itemBuilder: (context, index) {
                              return Constants.timetable[index].day
                                          .toUpperCase() ==
                                      "MONDAY"
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Time Start  " +
                                                  Constants.timetable[index]
                                                      .timeStart),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Time End  " +
                                                  Constants.timetable[index]
                                                      .timeENd),
                                            ],
                                          ),
                                          Text(Constants
                                              .timetable[index].courseTitle),
                                          Text("Teacher Name  " +
                                              Constants.timetable[index]
                                                  .teacherName),
                                          Text("Room No  " +
                                              Constants.timetable[index]
                                                  .lectureHall),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///tuesday
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 115,
                        height: 70,
                        color: Colors.grey,
                        child: const Text("Tuesday"),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Constants.timetable.length,
                            itemBuilder: (context, index) {
                              return Constants.timetable[index].day
                                          .toUpperCase() ==
                                      "TUESDAY"
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Time Start  " +
                                                  Constants.timetable[index]
                                                      .timeStart),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Time End  " +
                                                  Constants.timetable[index]
                                                      .timeENd),
                                            ],
                                          ),
                                          Text(Constants
                                              .timetable[index].courseTitle),
                                          Text("Teacher Name  " +
                                              Constants.timetable[index]
                                                  .teacherName),
                                          Text("Room No  " +
                                              Constants.timetable[index]
                                                  .lectureHall),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///wednesday
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 115,
                        color: Colors.grey,
                        child: const Text("Wednesday"),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Constants.timetable.length,
                            itemBuilder: (context, index) {
                              return Constants.timetable[index].day
                                          .toUpperCase() ==
                                      "WEDNESDAY"
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Time Start  " +
                                                  Constants.timetable[index]
                                                      .timeStart),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Time End  " +
                                                  Constants.timetable[index]
                                                      .timeENd),
                                            ],
                                          ),
                                          Text(Constants
                                              .timetable[index].courseTitle
                                              .toUpperCase()),
                                          Text("Teacher Name  " +
                                              Constants.timetable[index]
                                                  .teacherName),
                                          Text("Room No  " +
                                              Constants.timetable[index]
                                                  .lectureHall),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///thursday
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 115,
                        height: 70,
                        color: Colors.grey,
                        child: const Text("Thursday"),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Constants.timetable.length,
                            itemBuilder: (context, index) {
                              return Constants.timetable[index].day
                                          .toUpperCase() ==
                                      "THURSDAY"
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Time Start  " +
                                                  Constants.timetable[index]
                                                      .timeStart),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Time End  " +
                                                  Constants.timetable[index]
                                                      .timeENd),
                                            ],
                                          ),
                                          Text(Constants
                                              .timetable[index].courseTitle
                                              .toUpperCase()),
                                          Text("Teacher Name  " +
                                              Constants.timetable[index]
                                                  .teacherName),
                                          Text("Room No  " +
                                              Constants.timetable[index]
                                                  .lectureHall),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///friday
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 115,
                        height: 70,
                        color: Colors.grey,
                        child: const Text("Friday"),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Constants.timetable.length,
                            itemBuilder: (context, index) {
                              return Constants.timetable[index].day
                                          .toUpperCase() ==
                                      "FRIDAY"
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Time Start  " +
                                                  Constants.timetable[index]
                                                      .timeStart),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Time End  " +
                                                  Constants.timetable[index]
                                                      .timeENd),
                                            ],
                                          ),
                                          Text(Constants
                                              .timetable[index].courseTitle
                                              .toUpperCase()),
                                          Text("Teacher Name  " +
                                              Constants.timetable[index]
                                                  .teacherName),
                                          Text("Room No  " +
                                              Constants.timetable[index]
                                                  .lectureHall),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///saturday
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: Colors.grey,
                        width: 115,
                        height: 70,
                        child: const Text("Saturday"),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Constants.timetable.length,
                            itemBuilder: (context, index) {
                              return Constants.timetable[index].day
                                          .toUpperCase() ==
                                      "SATURDAY"
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Time Start  " +
                                                  Constants.timetable[index]
                                                      .timeStart),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Time End  " +
                                                  Constants.timetable[index]
                                                      .timeENd),
                                            ],
                                          ),
                                          Text(Constants
                                              .timetable[index].courseTitle
                                              .toUpperCase()),
                                          Text("Teacher Name  " +
                                              Constants.timetable[index]
                                                  .teacherName),
                                          Text("Room No  " +
                                              Constants.timetable[index]
                                                  .lectureHall),
                                        ],
                                      ),
                                    )
                                  : const Text("");
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
