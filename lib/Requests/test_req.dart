import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUser({
  required String Jname,
  required String email,
  required int Jnumber,
  required String favClub,
}) async {
  final firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection('users').add({
      'Jname': Jname,
      'email': email,
      'Jnumber': Jnumber,
      'favClub': favClub,
    });

    print("User added successfully");
  } catch (e){
    print("failed to add user $e");
  }
}
