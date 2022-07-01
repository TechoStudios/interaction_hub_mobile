import 'package:flutter/material.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/controll/feedback_Controller.dart';
import 'package:interaction_hub/model/teacher_model.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  String? id;
  String ans1 = '';
  String ans2 = '';
  String ans3 = '';
  String ans4 = '';
  String ans5 = '';
  bool excellent = false;
  bool excellent2 = false;
  bool excellent3 = false;
  bool excellent4 = false;
  bool excellent5 = false;
  bool good = false;
  bool good2 = false;
  bool good3 = false;
  bool good4 = false;
  bool good5 = false;
  bool average = false;
  bool average2 = false;
  bool average3 = false;
  bool average4 = false;
  bool average5 = false;
  bool unsatisfactory = false;
  bool unsatisfactory2 = false;
  bool unsatisfactory3 = false;
  bool unsatisfactory4 = false;
  bool unsatisfactory5 = false;
  List<String> questions = [
    "The Teacher start and finishes the class on time.",
    "The Teacher come duly prepared for the lecture in each class.",
    "The Teacher communicates Learning Outcomes at the beginning of lectures.",
    "The Teacher communicates the subject matter clearly and effectively.",
    "The Teacher ensures and encourages equitable participation of the students in the class.",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init = " + id.toString());
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
            child: SizedBox(
              child: Column(
                children: <Widget>[
                  // Container(
                  //   width: size.width / 2.5,
                  //   height: size.height / 2.5,
                  //   child: Image.asset(
                  //     "assets/logo.png",
                  //     color: Colors.white,
                  //   ),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Card(
                      elevation: 20,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: id,
                            isExpanded: true,
                            hint: const Text("Select Teacher",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                                maxLines: 1),
                            items:
                                Constants.teacherList.map((TeacherModel value) {
                              return DropdownMenuItem<String>(
                                value: value.id,
                                child: Text(
                                  value.name.isEmpty ? "" : value.name,
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
                                id = value.toString();
                              });
                              print("hi = " + id.toString());
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.035),

                  ///1
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      Text(
                        questions[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///ex
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory = false;
                                    excellent = true;
                                    good = false;
                                    average = false;
                                    ans1 = "excellent";
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: excellent
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Excellent",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///good
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory = false;
                                    excellent = false;
                                    good = true;
                                    average = false;
                                    ans1 = "good";
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: good ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Good",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///average
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory = false;
                                    excellent = false;
                                    good = false;
                                    average = true;
                                    ans1 = "average";
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          average ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Average",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///unsatisfied
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory = true;
                                    excellent = false;
                                    good = false;
                                    average = false;
                                    ans1 = "unsatisfactory";
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: unsatisfactory
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Unsatisfactory",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  SizedBox(height: size.height * 0.02),

                  ///2
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      Text(
                        questions[1],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///ex
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory2 = false;
                                    excellent2 = true;
                                    good2 = false;
                                    average2 = false;
                                    ans2 = "excellent";
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: excellent2
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Excellent",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///good
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory2 = false;
                                    excellent2 = false;
                                    good2 = true;
                                    average2 = false;
                                    ans2 = "good";
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: good2 ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Good",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///average
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory2 = false;
                                    excellent2 = false;
                                    good2 = false;
                                    average2 = true;
                                    ans2 = "average";
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          average2 ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Average",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///unsatisfied
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory2 = true;
                                    excellent2 = false;
                                    good2 = false;
                                    average2 = false;
                                    ans2 = "unsatisfactory";
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: unsatisfactory2
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Unsatisfactory",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  SizedBox(height: size.height * 0.02),

                  ///3
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      Text(
                        questions[3],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///ex
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory3 = false;
                                    excellent3 = true;
                                    good3 = false;
                                    average3 = false;
                                    ans3 = 'excellent';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: excellent3
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Excellent",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///good
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory3 = false;
                                    excellent3 = false;
                                    good3 = true;
                                    average3 = false;
                                    ans3 = 'good';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: good3 ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Good",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///average
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory3 = false;
                                    excellent3 = false;
                                    good3 = false;
                                    average3 = true;
                                    ans3 = 'average';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          average3 ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Average",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///unsatisfied
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory3 = true;
                                    excellent3 = false;
                                    good3 = false;
                                    average3 = false;
                                    ans3 = 'unsatisfactory';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: unsatisfactory3
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Unsatisfactory",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  SizedBox(height: size.height * 0.02),

                  ///4
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      Text(
                        questions[3],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///ex
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory4 = false;
                                    excellent4 = true;
                                    good4 = false;
                                    average4 = false;
                                    ans4 = 'excellent';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: excellent4
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Excellent",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///good
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory4 = false;
                                    excellent4 = false;
                                    good4 = true;
                                    average4 = false;
                                    ans4 = 'good';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: good4 ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Good",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///average
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory4 = false;
                                    excellent4 = false;
                                    good4 = false;
                                    average4 = true;
                                    ans4 = 'average';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          average4 ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Average",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///unsatisfied
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory4 = true;
                                    excellent4 = false;
                                    good4 = false;
                                    average4 = false;
                                    ans4 = 'unsatisfactory';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: unsatisfactory4
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Unsatisfactory",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  SizedBox(height: size.height * 0.02),

                  ///5
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      Text(
                        questions[4],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///ex
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    excellent5 = true;
                                    good5 = false;
                                    average5 = false;
                                    unsatisfactory5 = false;
                                    ans5 = 'excellent';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: excellent5
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Excellent",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///good
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    good5 = true;
                                    excellent5 = false;
                                    average5 = false;
                                    unsatisfactory5 = false;
                                    ans5 = 'good';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: good5 ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Good",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///average
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    average5 = true;
                                    excellent5 = false;
                                    good5 = false;
                                    unsatisfactory5 = false;
                                    ans5 = 'average';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          average5 ? Colors.blue : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Average",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),

                          ///unsatisfied
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unsatisfactory5 = true;
                                    excellent5 = false;
                                    good5 = false;
                                    average5 = false;
                                    ans5 = 'unsatisfactory';
                                  });
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: unsatisfactory5
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text("Unsatisfactory",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),

                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: const BorderSide(width: 2, color: Colors.brown),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: () async {
                        print(id);
                        if (id.toString().isNotEmpty) {
                          feedbackController.setFeedback(
                            id.toString(),
                            questions[0],
                            ans1,
                            questions[1],
                            ans2,
                            questions[2],
                            ans3,
                            questions[3],
                            ans4,
                            questions[4],
                            ans5,
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
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
      ),
    );
  }
}
