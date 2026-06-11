import '../../core/error/exceptions.dart';
import '../../core/storage/hive_service.dart';

abstract class LocalAuthDataSource {
  Future<void> saveAuthToken(String token);
  String? getAuthToken();
  Future<void> clearAuth();
}

class LocalAuthDataSourceImpl implements LocalAuthDataSource {
  final HiveService hiveService;

  LocalAuthDataSourceImpl(this.hiveService);

  @override
  Future<void> saveAuthToken(String token) async {
    try {
      await hiveService.saveAuthToken(token);
    } catch (e) {
      throw CacheException('Failed to save auth token: $e');
    }
  }

  @override
  String? getAuthToken() {
    try {
      return hiveService.getAuthToken();
    } catch (e) {
      throw CacheException('Failed to get auth token: $e');
    }
  }

  @override
  Future<void> clearAuth() async {
    try {
      await hiveService.clearAuth();
    } catch (e) {
      throw CacheException('Failed to clear auth: $e');
    }
  }
}
