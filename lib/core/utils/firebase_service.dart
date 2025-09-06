import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:spendwise/core/utils/service_locator.dart';

class FirebaseService {
  final FirebaseStorage _firebaseStorage = getIt.get<FirebaseStorage>();

  Future<String> uploadImageToFirebaseStorage(File imageFile) async {
    final User user = getIt.get<FirebaseAuth>().currentUser!;
    final storageRef = _firebaseStorage
        .ref()
        // .child(user.uid)
        .child('${user.uid}.jpg'); // *ficher
    await storageRef.putFile(imageFile);
    final imageUrl = await storageRef.getDownloadURL();
    return imageUrl;
  }
}
