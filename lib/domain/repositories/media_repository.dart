import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/media_entity.dart';

abstract class MediaRepository {
  Future<Either<Failure, List<MediaEntity>>> getMediaList();
  Future<Either<Failure, MediaEntity>> getMediaById(String id);
  Future<Either<Failure, MediaEntity>> uploadMedia(
    String filePath,
    String title,
    String description,
    MediaType type,
  );
  Future<Either<Failure, MediaEntity>> updateMedia(MediaEntity media);
  Future<Either<Failure, void>> deleteMedia(String id);
  Future<Either<Failure, MediaEntity>> toggleMediaStatus(String id);
  Future<Either<Failure, MediaEntity>> scheduleMediaEnd(
    String id,
    DateTime endDate,
  );
}
