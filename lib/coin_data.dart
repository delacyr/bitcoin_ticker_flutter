import 'services/networking.dart';

const url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getCurrency(String fiat) async {
    NetworkHelper networkHelperBTC = NetworkHelper('$url/BTC$fiat');
    NetworkHelper networkHelperETH = NetworkHelper('$url/ETH$fiat');
    NetworkHelper networkHelperLTC = NetworkHelper('$url/LTC$fiat');

    List<dynamic> currency = [];
    currency.add(await networkHelperBTC.getData());
    currency.add(await networkHelperETH.getData());
    currency.add(await networkHelperLTC.getData());

    return currency;
  }
}
