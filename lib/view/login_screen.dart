import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:interaction_hub/controll/login_controller.dart';
import 'package:interaction_hub/view/student_view/student_home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? udid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firebaseMessaging.getToken().then((token) {
      assert(token != null);
      print("TOKEN::::::" + token.toString());
      setState(() {
        udid = token.toString();
      });
    });
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
                          width: MediaQuery.of(context).size.width - 50,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                              validator: (String? val) =>
                                  val!.isEmpty ? 'Please enter email' : null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "username",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                              ),
                              controller: emailController,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Card(
                        elevation: 20,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                              validator: (String? val) =>
                                  val!.isEmpty ? 'Please enter password' : null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "password",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                              ),
                              controller: passwordController,
                              obscureText: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.035),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(width: 3, color: Colors.brown),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Controllers.loginController(emailController.text,
                                passwordController.text, udid, context);
                          }
                        },
                        child: const Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400),
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
