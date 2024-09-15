import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class CustomEmailWidget extends StatelessWidget {
  final controller;
  final name;
  final focusNode;
  final onPress;
  final validator;
  const CustomEmailWidget(
      {super.key,
      this.controller,
      this.focusNode,
      this.onPress,
      this.validator,
      this.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: focusNode,
      controller: controller,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      // validator: (value) {
      //   if (value!.isEmpty ||
      //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      //           .hasMatch(value)) {
      //     return 'Enter a valid email!';
      //   }
      //   return null;
      // },
      validator: validator,
      // obscureText: passwordText.value,
      decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.onSurface,
          filled: true,
          labelText: name,
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w400),
          prefixIcon: Icon(
            CupertinoIcons.lock,
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
