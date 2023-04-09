import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:night_movie/core/error/failure.dart';
import 'package:night_movie/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserCredential>> loginUser(
      {required String email, required String pass}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print(credential.user!.uid);
      return right(credential);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseSideError.fromLogin(e));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUser(
      {required String name,
      required String email,
      required String pass}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      return right(credential);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseSideError.fromSignIn(e));
    }
  }
}
