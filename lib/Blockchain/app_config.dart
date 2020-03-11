class AppConfig {
  Map<String, AppConfigParams> params = Map<String, AppConfigParams>();
  AppConfig() {
    params['dev'] = AppConfigParams(
      contractAddress: "0x59FFB6Ea7bb59DAa2aC480D862d375F49F73915d",
      web3HttpURL: "http://192.168.182.2:7546",
      web3RdpURL: "ws://192.168.182.2:7546",
    );

    params['ropsten'] = AppConfigParams(
      contractAddress: "0x5060b60cb8Bd1C94B7ADEF4134555CDa7B45c461",
      web3HttpURL:
          "https://ropsten.infura.io/v3/628074215a2449eb960b4fe9e95feb09",
      web3RdpURL:
          "wss://ropsten.infura.io/ws/v3/628074215a2449eb960b4fe9e95feb09",
    );
  }
}

class AppConfigParams {
  final String contractAddress;
  final String web3HttpURL;
  final String web3RdpURL;

  AppConfigParams({
    this.contractAddress,
    this.web3RdpURL,
    this.web3HttpURL,
  });
}
