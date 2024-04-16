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

}
