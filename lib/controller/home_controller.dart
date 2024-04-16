import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class homeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;
  Rx<Map<String, dynamic>> userMap = Rx<Map<String, dynamic>>({});

//   Method Search
  void onSearch(String text) async {
    try {
      isLoading(true);
      var quesrySnapshot = await firestore
          .collection('users')
          .where("email", isEqualTo: text)
          .get();

      if (quesrySnapshot.docs.isNotEmpty) {
        userMap(quesrySnapshot.docs[0].data());
      } else {
        userMap(null);
      }
    } finally {
      isLoading(false);
    }
  }

//   chat Room Id
String chatRoomId(String user1,String user2){
    if(user1[0].toLowerCase().codeUnits[0] > user2.toLowerCase().codeUnits[0]){
      return "$user1$user2";
    }else{
      return"$user2$user1";
    }
}

}
