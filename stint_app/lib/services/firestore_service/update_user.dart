import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stint_app/model/user_model.dart';

Future<void> updateUserService(CustomUser user) async {
  final db = FirebaseFirestore.instance;
  await db.collection('users').doc(user.id).update(
    {"lastUpdatedOn": FieldValue.serverTimestamp(), ...user.toJSON()},
  );
}
