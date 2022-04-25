import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interaction_hub/constants/Constants.dart';
import 'package:interaction_hub/controll/chat_cotroller.dart';

class GroupChat extends StatefulWidget {
  final String groupChatRoomId;
  final String groupName;

  GroupChat(this.groupChatRoomId, this.groupName);

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  ScrollController controller = new ScrollController();
  Stream<QuerySnapshot>? chats;
  TextEditingController messageEditingController = new TextEditingController();
  late AudioPlayer advancedPlayer;
  late AudioCache audioCache;

  Widget chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.docs.length,
                controller: controller,
                reverse: false,
                itemBuilder: (context, index) {
                  return MessageTile(
                    message: snapshot.data!.docs[index].data()["message"],
                    sendByMe: Constants.loginStudent[0].name ==
                        snapshot.data!.docs[index].data()["sendBy"],
                    sendBy: snapshot.data!.docs[index].data()["sendBy"],
                    time: snapshot.data!.docs[index].data()["dateTime"],
                  );
                })
            : Container();
      },
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": Constants.loginStudent[0].name,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
        'dateTime': DateTime.now().toUtc().toString()
      };
      audioCache.play('Music/message_tone.mp3');
      setState(() {
        ChatController.addGroupMessage(
          widget.groupChatRoomId,
          chatMessageMap,
        );
        messageEditingController.text = "";
      });
      Timer(const Duration(milliseconds: 500),
          () => controller.jumpTo(controller.position.maxScrollExtent));
    }
  }

  @override
  void initState() {
    initPlayer();
    ChatController.getGroupChats(widget.groupChatRoomId).then((val) {
      setState(() {
        chats = val;
        // Timer(Duration(milliseconds: 500),
        //         () => controller.jumpTo(controller.position.maxScrollExtent));
      });
    });
    super.initState();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.groupName),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  chatMessages(),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    child: TextField(
                      maxLines: 10,
                      minLines: 1,
                      style: const TextStyle(color: Colors.black),
                      controller: messageEditingController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.indigo),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.indigo),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Message ...",
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          border: InputBorder.none),
                    ),
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      addMessage();

                      Timer(
                          const Duration(milliseconds: 300),
                          () => controller
                              .jumpTo(controller.position.maxScrollExtent));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(40)),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatefulWidget {
  String message;
  bool sendByMe;
  String time;
  String sendBy;

  MessageTile(
      {required this.message,
      required this.sendByMe,
      required this.time,
      required this.sendBy});

  @override
  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  late DateTime localTimes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localTimes = DateTime.parse(widget.time);
    localTimes.toLocal();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: const Duration(milliseconds: 400),
      data: Theme.of(context),
      child: Column(
        children: [
          Bubble(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 212, 234, 244),
            elevation: 1,
            margin: const BubbleEdges.only(top: 8.0),
            child: Text("" +
                DateTime.parse(localTimes.toLocal().toString()).day.toString() +
                "-" +
                DateTime.parse(localTimes.toLocal().toString())
                    .month
                    .toString() +
                "-" +
                DateTime.parse(localTimes.toLocal().toString())
                    .year
                    .toString()),
          ),
          widget.sendByMe
              ? Padding(
                  padding: const EdgeInsets.only(left: 60, bottom: 8),
                  child: Bubble(
                    margin: const BubbleEdges.only(top: 10, right: 10),
                    alignment: Alignment.topRight,
                    nipWidth: 3,
                    nipHeight: 10,
                    nip: BubbleNip.rightTop,
                    radius: const Radius.circular(8),
                    color: Colors.green.withOpacity(0.4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.message,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Poppins-Light"),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            DateTime.parse(localTimes.toLocal().toString())
                                    .hour
                                    .toString() +
                                ":" +
                                DateTime.parse(localTimes.toLocal().toString())
                                    .minute
                                    .toString(),
                            style: const TextStyle(
                                fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 60, bottom: 10),
                  child: Bubble(
                    margin: const BubbleEdges.only(top: 10, left: 10),
                    alignment: Alignment.topLeft,
                    nipWidth: 6,
                    nipHeight: 10,
                    radius: const Radius.circular(8),
                    nip: BubbleNip.leftTop,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.sendBy.toString()),
                          Text(
                            widget.message,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            DateTime.parse(localTimes.toLocal().toString())
                                    .hour
                                    .toString() +
                                ":" +
                                DateTime.parse(localTimes.toLocal().toString())
                                    .minute
                                    .toString(),
                            style: const TextStyle(
                                fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
