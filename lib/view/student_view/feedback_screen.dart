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
  final _formKey = GlobalKey<FormState>();

  final feedbackControllers = TextEditingController();

  final passwordController = TextEditingController();

  String? id;
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: size.width / 2.5,
                      height: size.height / 2.5,
                      child: Image.asset(
                        "assets/logo.png",
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
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
                              items: Constants.teacherList
                                  .map((TeacherModel value) {
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
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Card(
                        elevation: 20,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              maxLines: 6,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                              validator: (String? val) =>
                                  val!.isEmpty ? 'Please enter message' : null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Feedback Message",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                              ),
                              controller: feedbackControllers,
                            ),
                          ),
                        ),
                      ),
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
                          if (_formKey.currentState!.validate() &&
                              id.toString().isNotEmpty) {
                            feedbackController.setFeedback(
                                id.toString(), feedbackControllers.text);
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
      ),
    );
  }
}
