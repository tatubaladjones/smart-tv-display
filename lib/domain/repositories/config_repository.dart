import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/config_entity.dart';

abstract class ConfigRepository {
  Future<Either<Failure, ConfigEntity>> getConfig();
  Future<Either<Failure, ConfigEntity>> updateConfig(ConfigEntity config);
  Future<Either<Failure, void>> deleteConfig();
}
