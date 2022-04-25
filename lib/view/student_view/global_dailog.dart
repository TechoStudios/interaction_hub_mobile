import 'package:flutter/material.dart';

class showPopUpDailog extends StatelessWidget {
  GestureTapCallback function;
  String title;
  String contaxt;
  showPopUpDailog(
      {Key? key,
      required this.function,
      required this.title,
      required this.contaxt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      content: Text(
        contaxt,
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        FlatButton(
            onPressed: function,
            child: Container(
              //width: 40,
              //height: 30,
              decoration: BoxDecoration(
                  color: const Color(0xFFacaee0).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5)),
              child: const Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 6, right: 6, top: 7, bottom: 7),
                  child: Center(
                    child: Text(
                      "Ok",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
