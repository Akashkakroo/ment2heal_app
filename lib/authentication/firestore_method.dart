import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ment2heal/models/post.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadPost(
      String description, String uid, String username) async {
    //asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      // String photoUrl =
      //     await StorageMethods().uploadImageToStorage('posts', description, true);
      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
      );
      _firestore.collection('Affirmaitions').doc(postId).set(post.toJson());
      res = "success"; // creates unique id based on time
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
