import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signupUser({required String email,
    required String password}) async {
    emit(SignupLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignupSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(const SignupFailure(errMessage: 'Weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(const SignupFailure(errMessage: 'Email already in use'));
      }
    } catch (ex) {
      emit(const SignupFailure(errMessage: 'Something went wrong, try again!'));
    }
  }
}
