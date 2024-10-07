import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetUser {
  final ProfileRepository profileRepo;

  GetUser(this.profileRepo);
  Future<Either<Failure, Profile>> execute(int id) async =>
      await profileRepo.getUser(id);
}
