import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flirtguru/page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  Map<String, dynamic> userMap= {};

  bool isLoading = false;
  final TextEditingController _search = TextEditingController();

  String chatRoomId(String user1, String user2){
    if(user1[0].toLowerCase().codeUnits[0] > user2.toLowerCase().codeUnits[0]){
      return "$user1$user2";
    }else{
      return "$user2$user1";
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   onSearch();
  // }

  void onSearch() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await firestore
        .collection("users")
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "FLIRT GURU Example",
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.camera_alt_outlined,
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
        child: Column(
          children: [
            SizedBox(
              height: size.height / 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  controller: _search,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          print("clicked");
                          onSearch();
                        },
                      )),
                ),
              ),
            ),
            isLoading ? CircularProgressIndicator()
                : userMap !=null && userMap.isNotEmpty ?
                ListTile(title: Text(userMap['name'],style: TextStyle(color: Colors.white),),
                onTap: (){
                  String roomId=chatRoomId(
                    FirebaseAuth.instance.currentUser!.displayName.toString(),
                    userMap['name']
                  );
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatPage(chatRoomId: roomId, userMap: userMap)));
                },)
                : Container(),

          ],
        ),
      ),
    );
  }
}
