import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = Get.arguments;
    final Map<String, dynamic> userMap = args['userMap'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: CircleAvatar(radius: 20, backgroundColor: Colors.white),
                title: Text(
                  userMap['name'],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text("Last seen today at ${DateFormat.Hm().format(DateTime.now())}", style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ),
            Positioned(
              top: 10,
              left: -16,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.add_call,
              size: 30,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert, size: 30, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Your chat page content here
            ],
          ),
        ),
      ),
    );
  }
}
