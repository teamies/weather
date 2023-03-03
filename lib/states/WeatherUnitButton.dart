import 'package:flutter/material.dart';

class TemperatureUnitButton extends StatefulWidget {
  final String currentUnit;
  final Function(String) onUnitChanged;

  TemperatureUnitButton({
    required this.currentUnit,
    required this.onUnitChanged,
  });

  @override
  _TemperatureUnitButtonState createState() => _TemperatureUnitButtonState();
}

class _TemperatureUnitButtonState extends State<TemperatureUnitButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final newUnit = widget.currentUnit == 'Celsius' ? 'Fahrenheit' : 'Celsius';
        widget.onUnitChanged(newUnit);
      },
      child: Text(
        'Switch to ${widget.currentUnit == 'Celsius' ? 'Fahrenheit' : 'Celsius'}',
      ),
    );
  }
}
