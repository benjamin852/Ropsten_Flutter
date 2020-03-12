import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:web3dart/web3dart.dart';
import 'package:hex/hex.dart';

abstract class IAddressService {
  String generateMnemonic();
  String getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicAddress(String privateKey);
  Future<bool> setupFromMnemonic(String mnemonic);
  Future<bool> setupFromPrivateKey(String privateKey);
  String entropyToMnemonic(String entropyToMnemonic);
}

class AddressService implements IAddressService {
  // IConfigurationService _configService;
  // AddressService({this._configService});

  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  @override
  String getPrivateKey(String mnemonic) {
    String seedHex = bip39.mnemonicToSeedHex(mnemonic);
    KeyData master = ED25519_HD_KEY.getMasterKeyFromSeed(seedHex);
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicAddress(String privateKey) async {
    final privateInstance = EthPrivateKey.fromHex(privateKey);
    final address = await privateInstance.extractAddress();
    print('address: $address');
    return address;
  }

  @override
  String entropyToMnemonic(String entropyToMnemonic) {
    return bip39.entropyToMnemonic(entropyToMnemonic);
  }

  @override
  Future<bool> setupFromMnemonic(String mnemonic) {
    return null;
  }

  @override
  Future<bool> setupFromPrivateKey(String privateKey) {
    // TODO: implement setupFromPrivateKey
    return null;
  }
}
