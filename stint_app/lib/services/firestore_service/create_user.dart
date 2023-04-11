import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stint_app/model/user_model.dart';

Future<void> createUserService(CustomUser user) async {
  final db = FirebaseFirestore.instance;
  await db.collection('users').doc(user.id).set({
    "lastUpdatedOn": FieldValue.serverTimestamp(),
    "createdOn": FieldValue.serverTimestamp(),
    ...user.toJSON()
  });
}
