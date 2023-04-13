// Future<void> createProjectService(String userId) async {
//   final db = FirebaseFirestore.instance;
//   await db.collection('projects').add();
//   await db.collection('users').doc(userId).set({
//     "lastUpdatedOn": FieldValue.serverTimestamp(),
//   });
// }
