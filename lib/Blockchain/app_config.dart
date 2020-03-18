class AppConfig {
  AppConfig() {
    params['dev'] = AppConfigParams(
        web3HttpUrl: "http://192.168.182.2:7546",
        web3RdpUrl: "ws://192.168.182.2:7546",
        contractAddress: "0x59FFB6Ea7bb59DAa2aC480D862d375F49F73915d");

    params['ropsten'] = AppConfigParams(
        web3HttpUrl:
            "https://ropsten.infura.io/v3/628074215a2449eb960b4fe9e95feb09",
        web3RdpUrl:
            "wss://ropsten.infura.io/ws/v3/628074215a2449eb960b4fe9e95feb09",
        contractAddress: "0x5060b60cb8Bd1C94B7ADEF4134555CDa7B45c461");
  }
  Map<String, AppConfigParams> params = Map<String, AppConfigParams>();
}

class AppConfigParams {
  AppConfigParams({this.web3HttpUrl, this.web3RdpUrl, this.contractAddress});
  final String web3RdpUrl;
  final String web3HttpUrl;
  final String contractAddress;
}
