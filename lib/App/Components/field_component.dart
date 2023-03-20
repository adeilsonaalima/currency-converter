import 'package:flutter/material.dart';
import 'package:currency_converter/App/Models/currency_model.dart';
import 'package:flutter/services.dart';

class FieldComponent extends StatefulWidget {
  const FieldComponent(
      {super.key,
      required this.onChanged,
      required this.controller,
      required this.items,
      required this.selectedItem});

  final TextEditingController controller;
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final void Function(CurrencyModel? model) onChanged;

  @override
  State<FieldComponent> createState() => _FieldComponentState();
}

class _FieldComponentState extends State<FieldComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton<CurrencyModel>(
            value: widget.selectedItem,
            items: widget.items
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ))
                .toList(),
            onChanged: widget.onChanged,
          ),
          const SizedBox(width: 30),
          Expanded(
              child: TextField(
            controller: widget.controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            decoration: const InputDecoration(
              isDense: true,
            ),
          ))
        ],
      ),
    );
  }
}
