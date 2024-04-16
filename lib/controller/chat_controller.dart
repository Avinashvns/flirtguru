
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatController extends GetxController{

  FirebaseAuth auth=FirebaseAuth.instance;

  final TextEditingController messageController=TextEditingController();
  RxString date=DateFormat.Hm().format(DateTime.now()).obs;
  RxString chatRoomId="".obs;
  Rx<Map<String, dynamic>> userMap = Rx<Map<String, dynamic>>({});

  void sendMessage() async{
    final String message=messageController.text.trim();
    if(message.isNotEmpty){
      final Map<String, dynamic> messageData = {
        "sendBy": auth.currentUser!.displayName,
        "message": message,
        "time": FieldValue.serverTimestamp(),
      };
      await FirebaseFirestore.instance
          .collection('chatroom')
          .doc(chatRoomId.value)
          .collection('chats')
          .add(messageData);
      // Clear the message input field after sending
      messageController.clear();
    }else {
      print("Enter Some Text");
    }
  }


}