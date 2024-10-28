import 'dart:math';

import 'package:client/data/api/authApi.dart';
import 'package:client/data/model/userModel.dart';
import 'package:client/presentation/screens/home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/screens/loadingScreen.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final passwordController = TextEditingController();
    ValueNotifier<bool> passwordText = ValueNotifier<bool>(true);

    GlobalKey<FormState> form = GlobalKey<FormState>();
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Colors.grey,
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.indigo.shade500),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: form,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Text(
                    'Mkcl School',
                    style: TextStyle(
                      color: Colors.indigo.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                  const Text(
                    'Creating a Knowledge Lit World',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  validator: ValidationBuilder(
                          requiredMessage: 'Name must be required')
                      .build(),
                  decoration: InputDecoration(
                      helperText: 'Ex. Mkcl Amt',
                      helperStyle: const TextStyle(color: Colors.grey),

                      // focusColor: Colors.amber,
                      fillColor: Theme.of(context).colorScheme.onSurface,
                      filled: true,
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        Icons.school_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  validator: ValidationBuilder(
                          requiredMessage: 'Email must be required')
                      .email('Email must be Valid')
                      .build(),
                  decoration: InputDecoration(
                      helperText: 'Ex. amt@mkcl.com',
                      helperStyle: const TextStyle(color: Colors.grey),
                      fillColor: Theme.of(context).colorScheme.onSurface,
                      filled: true,
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  validator: ValidationBuilder(
                          requiredMessage: 'Email must be required')
                      .phone('Email must be Valid')
                      .build(),
                  decoration: InputDecoration(
                      helperText: 'Ex. +91 1234567890',
                      helperStyle: const TextStyle(color: Colors.grey),
                      fillColor: Theme.of(context).colorScheme.onSurface,
                      filled: true,
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        CupertinoIcons.phone,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder(
                    valueListenable: passwordText,
                    builder: (BuildContext context, value, child) {
                      return TextFormField(
                        obscureText: passwordText.value,
                        controller: passwordController,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        validator: ValidationBuilder(
                                requiredMessage: 'Password must be required')
                            .minLength(8,
                                'The password must contain at least 8 characters')
                            .build(),
                        decoration: InputDecoration(
                            helperText: 'Min length: 8',
                            helperStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: IconButton(
                                  onPressed: () {
                                    passwordText.value = !passwordText.value;
                                  },
                                  icon: Icon(
                                    passwordText.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.grey.shade700,
                                  )),
                            ),

                            // focusColor: Colors.amber,
                            fillColor: Theme.of(context).colorScheme.onSurface,
                            filled: true,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w400),
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                                borderRadius: BorderRadius.circular(5))),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: Colors.indigo)),
                  child: InkWell(
                    onTap: () async {
                      if (form.currentState?.validate() == true) {
                        userModel data = userModel(
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            password: passwordController.text);
                        print(data);

                        try {
                          final res = await apiService.signUpUser(data);
                          print(res);

                          if (res.statusCode == 200) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                              ModalRoute.withName('/'),
                            );
                          } else if (res.statusCode == 204) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                'Error: ${e.toString()}',
                                style: TextStyle(color: Colors.red),
                              )), // Catch and display any error
                            );
                          } else if (res.statusCode == 204) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                'Error: ${e.toString()}',
                                style: TextStyle(color: Colors.red),
                              )), // Catch and display any error
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                              'Error: ${e.toString()}',
                              style: TextStyle(color: Colors.red),
                            )), // Catch and display any error
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          // color: Colors.indigo.shade500
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have any Account? ",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.indigo.shade600,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 50,
                  child: Text.rich(
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.center,
                    TextSpan(
                        text: 'By Siginin You Accepts our ',
                        // style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        children: [
                          TextSpan(
                              text: 'Terma of Use',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decorationColor: Colors.indigo,
                                  decoration: TextDecoration.underline),
                              children: [
                                TextSpan(
                                    text: ' and ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.none),
                                    children: [
                                      TextSpan(
                                        text: 'Privacy Polices',
                                        style: TextStyle(
                                            color: Colors.indigo,
                                            decorationColor: Colors.indigo,
                                            decoration:
                                                TextDecoration.underline),
                                      )
                                    ])
                              ])
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
