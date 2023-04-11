import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stint_app/model/user_model.dart';

Future<CustomUser> getUserService(String id) async {
  final db = FirebaseFirestore.instance;
  final userDoc = await db.collection('users').doc(id).get();
  if (!userDoc.exists) {
    return Future.error("User Document does not exist");
  }
  final data = userDoc.data();
  return CustomUser(
    id: id,
    firstName: data!['firstName'],
    lastName: data['lastName'],
    email: data['email'],
  );
}
