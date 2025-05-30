import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:tekio_app/core/database/local_database.dart';
import 'package:tekio_app/models/app_config/app_config_model.dart';

class AppConfig {
  static Future<AppConfigModel> getStartUpAppConfig() async {
    return await getAppConfig();
  }

  static Future<AppConfigModel> forceAppConfigUpdate() async {
    return await _getRemoteAppConfig();
  }

  static Future<AppConfigModel> getAppConfig() async {
    if (await DB().recordExistsAndNotEmpty('appConfig')) {
      return AppConfigModel.fromJson(await DB().get('appConfig'));
    } else {
      return _getRemoteAppConfig();
    }
  }

  static Future<AppConfigModel> _getRemoteAppConfig() async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    AppConfigModel appConfig = AppConfigModel.fromRawJson(
        FirebaseRemoteConfig.instance.getString('appConfig'));
    await DB().update('appConfig', appConfig.toJson());
    return appConfig;
  }
}
