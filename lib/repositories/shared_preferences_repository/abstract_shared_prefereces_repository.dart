abstract class AbstractSharedPreferenceRepository {
  Future<void> saveTovarSharedPreference();

  Future<void> loadTovarSharedPreference();
}
