import '../../../../core/error/error.dart';
import '../entities/profile.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<Profile>>> getAllUsers(int page);
  Future<Either<Failure, Profile>> getUser(int id);
}
