import 'package:currency_converter/App/Controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  final homeController = HomeController(toText: toText, fromText: fromText);

  test("Converte valores monetários de Real para Dólar", () {
    toText.text = ' 1.0';
    homeController.convert();
    expect(fromText.text, '5.26');
  });
}
