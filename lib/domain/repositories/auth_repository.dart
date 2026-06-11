import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/admin_user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, AdminUserEntity>> getCurrentUser();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> isAdmin();
  Future<Either<Failure, void>> validateAdminAccess();
}
