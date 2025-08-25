import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/utils/service_locator.dart';

class ApiService {
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return getIt.get<FirebaseAuth>().createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
