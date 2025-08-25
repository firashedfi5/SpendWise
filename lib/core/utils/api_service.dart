import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/utils/service_locator.dart';

class ApiService {
  //* Sign up
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return getIt.get<FirebaseAuth>().createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //* Log in
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return getIt.get<FirebaseAuth>().signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
