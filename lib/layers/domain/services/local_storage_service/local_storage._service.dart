abstract class LocalStorageService {
  Future<bool?> get(String key);
  Future set(String key, bool value);
}
