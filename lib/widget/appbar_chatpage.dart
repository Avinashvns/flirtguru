
import 'package:flirtguru/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Widget ChatAppBar(){

  final homeController controller= Get.put(homeController());
  String date =DateFormat.Hm().format(DateTime.now());

  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.grey,
    title: Obx(() {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: ListTile(
              leading: CircleAvatar(radius: 20,backgroundColor: Colors.white,),
              title: Text(controller.userMap.value['name'],style: TextStyle(color: Colors.white,fontSize: 20),),
              subtitle: Text("Last seen today at ${date}",style: TextStyle(color: Colors.white,fontSize: 15)),
            ),
          ),
          Positioned(
            top: 10,
            left: -16,
            child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){},),
          ),
        ],

      );
    }),
    // Text("FLIRT GURU",style: TextStyle(fontSize: 26,color: Colors.white),),
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
  );
}