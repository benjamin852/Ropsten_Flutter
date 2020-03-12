import 'package:shared_preferences/shared_preferences.dart';

abstract class IConfigurationService {
  Future<void> setMnemonic(String value);
  Future<void> setUpDone(bool value);
  Future<void> setPrivateKey(String value);
}
