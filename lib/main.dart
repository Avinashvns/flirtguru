import 'package:firebase_auth/firebase_auth.dart';
import 'package:flirtguru/page/example.dart';
import 'package:flirtguru/page/homepage.dart';
import 'package:flirtguru/page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCYgiHhUZf1HTquHo1F8_zCmRgY9GVkV_0",
        appId: "1:970023506628:android:ff9858864c2161654b2f91",
        messagingSenderId: "970023506628",
        projectId: "flirtguru-f339d"
    ),
  );
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "first",
        getPages: [
          GetPage(
              name: "/first",
              page: ()=> MyApp()
          ),

        ],
      )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).set(
                {
                  'name' : FirebaseAuth.instance.currentUser?.displayName,
                  'email': FirebaseAuth.instance.currentUser?.email,
                  "status":"Unavailable",
                });
            return
              HomePage();
            // Example();
          }else{
            return SignUpPage();
          }
        },
    );
  }
}
