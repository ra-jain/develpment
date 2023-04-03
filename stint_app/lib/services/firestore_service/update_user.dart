import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stint_app/model/user_model.dart';

Future<void> updateUser(CustomUser user) async {
  final db = FirebaseFirestore.instance;
  final userDoc = await db.collection('users').doc(user.id).update(
    {"lastUpdatedOn": FieldValue.serverTimestamp(), ...user.toJSON()},
  );
}
