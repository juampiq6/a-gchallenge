import 'package:dotenv/dotenv.dart';

abstract class EnvVars {
  static final env = DotEnv(includePlatformEnvironment: false)..load();

  static String get baseUrl =>
      env['BASE_URL'] ?? 'https://api.dictionaryapi.dev/api/v2/entries/';
  static String get lang => env['LANG'] ?? 'en';
}
