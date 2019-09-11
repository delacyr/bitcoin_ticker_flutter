import 'networking.dart';

const url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CurrencyModel {
  Future<dynamic> getCurrency(String crypto, String fiat) async {
    NetworkHelper networkHelper = NetworkHelper('$url/$crypto$fiat');

    var currency = await networkHelper.getData();

    return currency;
  }
}
