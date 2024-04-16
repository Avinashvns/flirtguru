

import 'package:flirtguru/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController controller=Get.put(homeController());
  String date =DateFormat.Hm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("FLIRT GURU",style: TextStyle(fontSize: 26,color: Colors.white),),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.camera_alt_outlined,size: 30,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert,size: 30,color: Colors.white),
          ),
        ],

      ),
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height/50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50)
                ),

                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  onChanged: (value)=>controller.onSearch(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                    prefixIcon: Icon(Icons.search,color: Colors.white)
                  ),
                ),
              ),
            ),

            Obx(() {
              return controller.isLoading.value ? SizedBox():
                  controller.userMap.value !=null && controller.userMap.value.isNotEmpty ?
                      ListTile(
                        title: Text(controller.userMap.value['name'],
                        style: TextStyle(color: Colors.white),),
                        subtitle: Text(controller.userMap.value['email'],
                          style: TextStyle(color: Colors.white),),
                        trailing: Text(date,
                          style: TextStyle(color: Colors.white,fontSize: 16),),
                      )
                      : Container();
            }),

          ],
        ),
      ),
    );
  }
}
