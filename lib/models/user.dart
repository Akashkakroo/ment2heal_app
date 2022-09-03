import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final String gender;
  final String age;
  // final String affirmation;

  const User({
    required this.username,
    required this.email,
    required this.uid,
    required this.age,
    required this.gender,
    // required this.affirmation,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      age: snapshot['age'],
      gender: snapshot['gender'],
      // affirmation: snapshot['affirmation'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "age": age,
        "gender": gender,
        // "affirmation": affirmation,
      };
}
