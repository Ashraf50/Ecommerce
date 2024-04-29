import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          final user =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          CollectionReference users =
              FirebaseFirestore.instance.collection("Users");
          users
              .doc(user.user!.uid)
              .set(
                {
                  'Username': event.username,
                  'phone': event.phoneNumber,
                  'email': event.email,
                  'password': event.password,
                },
              )
              .then(
                (value) => print("User Added"),
              )
              .catchError((error) => print("Failed to add user: $error"));
          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFailure(messageError: 'weak-password'));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailure(messageError: 'email-already-in-use'));
          } else {
            emit(RegisterFailure(messageError: e.code));
          }
        } on Exception {
          emit(RegisterFailure(messageError: "something went wrong"));
        }
      } else if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(message: "user-not-found"));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(message: 'wrong-password'));
          } else {
            emit(LoginFailure(message: e.code));
          }
        } on Exception {
          emit(LoginFailure(message: "something went wrong"));
        }
      } else if (event is ResetEvent) {
        emit(ResetLoading());
        try {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: event.email);
          emit(ResetSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(ResetFailure(messageError: "user-not-found"));
          } else if (e.code == 'wrong-password') {
            emit(ResetFailure(messageError: 'wrong-password'));
          } else {
            emit(ResetFailure(messageError: e.code));
          }
        } on Exception {
          emit(ResetFailure(messageError: "something went wrong"));
        }
      } else if (event is GoogleSignEvent) {
        emit(GooglSIgnLoading());
        try {
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          final GoogleSignInAuthentication? googleAuth =
              await googleUser?.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          final user =
              await FirebaseAuth.instance.signInWithCredential(credential);
          CollectionReference users =
              FirebaseFirestore.instance.collection("Users");
          users
              .doc(user.user!.uid)
              .set(
                {
                  'Username': googleUser!.displayName,
                  'email': googleUser.email,
                  'photoUrl': googleUser.photoUrl,
                },
              )
              .then(
                // ignore: avoid_print
                (value) => print("User Added"),
              )
              // ignore: avoid_print
              .catchError((error) => print("Failed to add user: $error"));
          emit(GooglSIgnSuccess());
        } on Exception {
          emit(GooglSIgnFailure(messageError: "something went wrong"));
        }
      }
    });
  }
}
