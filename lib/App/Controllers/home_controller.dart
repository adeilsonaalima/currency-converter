import 'package:currency_converter/App/Models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    switch (fromCurrency.name) {
      case "Real":
        returnValue = value * toCurrency.real;
        break;
      case "Dolar":
        returnValue = value * toCurrency.dolar;
        break;
      case "Euro":
        returnValue = value * toCurrency.euro;
        break;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
