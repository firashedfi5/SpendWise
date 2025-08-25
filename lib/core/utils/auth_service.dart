import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendwise/core/utils/service_locator.dart';

class AuthService {
  //* Log in
  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      throw Exception('Google sign-in was cancelled');
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await getIt.get<FirebaseAuth>().signInWithCredential(credential);
  }
}
