import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:night_movie/core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserCredential>> loginUser(
      {required String email, required String pass});
  Future<Either<Failure, UserCredential>> signUser(
      {required String name, required String email, required String pass});
}
