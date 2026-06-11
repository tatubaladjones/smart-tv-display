import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String mediaBoxName = 'media';
  static const String configBoxName = 'config';
  static const String authBoxName = 'auth';

  late Box<dynamic> _mediaBox;
  late Box<dynamic> _configBox;
  late Box<dynamic> _authBox;

  Future<void> init() async {
    _mediaBox = await Hive.openBox(mediaBoxName);
    _configBox = await Hive.openBox(configBoxName);
    _authBox = await Hive.openBox(authBoxName);
  }

  Future<void> saveMediaList(List<Map<String, dynamic>> medias) async {
    await _mediaBox.clear();
    for (int i = 0; i < medias.length; i++) {
      await _mediaBox.put(medias[i]['id'], medias[i]);
    }
  }

  Future<void> addMedia(Map<String, dynamic> media) async {
    await _mediaBox.put(media['id'], media);
  }

  Future<void> updateMedia(Map<String, dynamic> media) async {
    await _mediaBox.put(media['id'], media);
  }

  Future<void> deleteMedia(String mediaId) async {
    await _mediaBox.delete(mediaId);
  }

  List<Map<String, dynamic>> getAllMedia() {
    return _mediaBox.values.cast<Map<String, dynamic>>().toList();
  }

  Map<String, dynamic>? getMedia(String mediaId) {
    return _mediaBox.get(mediaId);
  }

  List<String> getAllMediaIds() {
    return _mediaBox.keys.cast<String>().toList();
  }

  Future<void> clearMedia() async {
    await _mediaBox.clear();
  }

  Future<void> saveConfig(Map<String, dynamic> config) async {
    await _configBox.put('config', config);
  }

  Map<String, dynamic>? getConfig() {
    return _configBox.get('config');
  }

  Future<void> clearConfig() async {
    await _configBox.clear();
  }

  Future<void> saveAuthToken(String token) async {
    await _authBox.put('token', token);
  }

  String? getAuthToken() {
    return _authBox.get('token');
  }

  Future<void> clearAuth() async {
    await _authBox.clear();
  }

  Future<void> clear() async {
    await _mediaBox.clear();
    await _configBox.clear();
    await _authBox.clear();
  }

  Future<void> deleteAllBoxes() async {
    await _mediaBox.deleteFromDisk();
    await _configBox.deleteFromDisk();
    await _authBox.deleteFromDisk();
  }
}
