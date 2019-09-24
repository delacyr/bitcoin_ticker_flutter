import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency;
  String valueBTC = '?';
  String valueETH = '?';
  String valueLTC = '?';
  String actualFiat = 'USD';

  @override
  void initState() {
    super.initState();
    getCurrencyData(actualFiat);
  }

  void getCurrencyData(String fiat) async {
    List<dynamic> currency = await CoinData().getCurrency(fiat);
    updateUI(currency);
  }

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(item);
    }

    return dropdownItems;
  }

  List<Text> getCurrencyList() {
    List<Text> currencyList = [];
    for (String currency in currenciesList) {
      currencyList.add(Text(currency));
    }
    return currencyList;
  }

  void updateUI(List<dynamic> currency) {
    setState(() {
      valueBTC = currency[0] == null ? '?' : currency[0]['ask'].toString();
      valueETH = currency[1] == null ? '?' : currency[1]['ask'].toString();
      valueLTC = currency[2] == null ? '?' : currency[2]['ask'].toString();
      print('BTC $valueBTC)');
      print('ETH $valueETH)');
      print('LTC $valueLTC)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $valueBTC $actualFiat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $valueETH $actualFiat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $valueLTC $actualFiat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex) {
                setState(() {
                  actualFiat = currenciesList[selectedIndex];
                  getCurrencyData(actualFiat);
                });
              },
              children: getCurrencyList(),
            ),
          ),
        ],
      ),
    );
  }
}

//DropdownButton<String>(
//value: selectedCurrency,
//items: getDropdownItems(),
//onChanged: (value) {
//setState(() {
//selectedCurrency = value;
//});
//})
