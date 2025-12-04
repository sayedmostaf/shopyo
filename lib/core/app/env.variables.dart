import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();
  static final EnvVariable instance = EnvVariable._();

  late EnvTypeEnum _envType;
  late String _notificationBaseUrl;
  late String _firebaseServiceAccountPath;
  late String _firebaseProjectId;

  Future<void> init({required EnvTypeEnum envType}) async {
    // حمّل ملف البيئة المناسب
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: ".env.dev");
        break;
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: ".env.prod");
        break;
    }

    // قراءة المتغيرات
    final envTypeStr = dotenv.get('ENV_TYPE');
    _envType = _mapEnvType(envTypeStr);

    _notificationBaseUrl = dotenv.get('NOTIFICATION_BASEURL');
    _firebaseServiceAccountPath = dotenv.get('FIREBASE_SERVICE_ACCOUNT_PATH');
    _firebaseProjectId = dotenv.get('FIREBASE_PROJECT_ID');
  }

  // تحويل String → Enum
  EnvTypeEnum _mapEnvType(String value) {
    switch (value.toLowerCase()) {
      case "dev":
        return EnvTypeEnum.dev;
      case "prod":
        return EnvTypeEnum.prod;
      default:
        throw Exception("Invalid ENV_TYPE value: $value");
    }
  }

  // Getters
  bool get debugMode => _envType == EnvTypeEnum.dev;

  String get notificationBaseUrl => _notificationBaseUrl;

  String get firebaseServiceAccountPath => _firebaseServiceAccountPath;

  String get firebaseProjectId => _firebaseProjectId;
}
