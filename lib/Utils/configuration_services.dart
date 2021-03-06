import 'package:shared_preferences/shared_preferences.dart';

abstract class IConfigurationService {
  Future<void> setMnemonic(String value);
  Future<void> setPrivateKey(String value);
  Future<void> setUpDone(bool value);
  String getMnemonic();
  String getPrivateKey();
  bool didSetupWallet();
}

class ConfigurationService implements IConfigurationService {
  SharedPreferences _preferences;
  ConfigurationService(this._preferences);

  @override
  Future<void> setMnemonic(String value) {
    return _preferences.setString("mnemonic", value);
  }

  @override
  Future<void> setPrivateKey(String value) {
    return _preferences.setString('privateKey', value);
  }

  @override
  Future<void> setUpDone(bool value) {
    return _preferences.setBool("didSetupWallet", value);
  }

  @override
  String getMnemonic() {
    return _preferences.getString('mnemonic');
  }

  @override
  String getPrivateKey() {
    return _preferences.getString('privateKey');
  }

  @override
  bool didSetupWallet() {
    return _preferences.getBool('didSetupWallet') ?? false;
  }
}
