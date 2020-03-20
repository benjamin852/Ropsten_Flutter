import 'package:web3dart/web3dart.dart';

class NumberFormatter {
  final BigInt amount;
  NumberFormatter(this.amount);

  String format({fromUint = EtherUnit.wei, toUint = EtherUnit.ether}) {
    if (amount == null) {
      return '-';
    }

    return EtherAmount.fromUnitAndValue(fromUint, amount)
        .getValueInUnit(toUint)
        .toString();
  }
}
