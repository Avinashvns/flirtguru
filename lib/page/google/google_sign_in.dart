
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GoogleSignInClass{

 static final FirebaseAuth auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn=GoogleSignIn();

 static Future<dynamic> SignIn()async{
   final GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();
   final GoogleSignInAuthentication? googleSignInAuthentication=await googleSignInAccount!.authentication;
   final AuthCredential credential=GoogleAuthProvider.credential(
     accessToken: googleSignInAuthentication!.accessToken,
     idToken: googleSignInAuthentication.idToken,
   );
   await auth.signInWithCredential(credential);
}

// Sign Out
static Future signOut()async{
   try{
     await auth.signOut();
   }catch(e){
     print(e);
   }
}

// User
static User getUser(){
   User user=auth.currentUser!;
   return user;
  }


}
