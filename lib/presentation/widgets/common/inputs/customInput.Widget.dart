import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final inputController = TextEditingController();
  final inputValidator;
  final labalName;
  final prefixIcon;
  CustomInputWidget(
      {super.key, this.inputValidator, this.labalName, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      validator: inputValidator,
      decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.onSurface,
          filled: true,
          labelText: labalName,
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w400),
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).colorScheme.primary,
          ),
          enabled: true,
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSurface),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSurface),
              borderRadius: BorderRadius.circular(5))),
    );
  }
}
