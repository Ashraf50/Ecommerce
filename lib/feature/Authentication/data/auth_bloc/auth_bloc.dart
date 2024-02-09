import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          // ignore: unused_local_variable
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
                  'username': event.userName,
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
          }
        } on Exception {
          emit(LoginFailure(message: "something went wrong"));
        }
      }
    });
  }
}
