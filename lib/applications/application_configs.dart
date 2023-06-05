import 'package:dotenv/dotenv.dart';
class ApplicationConfig {
  void loadConfigApplication() async {
    await _loadEnv();
  }

  Future<void> _loadEnv() async {
    var env = DotEnv(includePlatformEnvironment: true)..load();
  }
}
