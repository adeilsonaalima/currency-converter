class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;

  CurrencyModel({
    required this.name,
    required this.real,
    required this.dolar,
    required this.euro,
  });

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(name: "Real", real: 1.0, dolar: 5.26, euro: 5.59),
      CurrencyModel(name: "Dolar", real: 5.26, dolar: 1.0, euro: 0.94),
      CurrencyModel(name: "Euro", real: 5.59, dolar: 1.06, euro: 1.0),
    ];
  }
}
