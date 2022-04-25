import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController {
  static getGroupChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("groupChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  static Future addGroupMessage(String chatRoomId, chatMessageData) async {
    await FirebaseFirestore.instance
        .collection("groupChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }
}
