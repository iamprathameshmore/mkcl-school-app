import 'package:client/routes/routesName.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Image(
                image: AssetImage('assets/mkcl.png'),
                height: 100,
                color: Colors.indigo,
              ),
              Column(
                children: [
                  Text(
                    'Mkcl School',
                    style: TextStyle(
                      color: Colors.indigo.shade600,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  const Text(
                    'Creating a Knowledge Lit World',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 25,
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
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        // Redirect to another screen upon successful sign-up
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Routesname.home,
                            ModalRoute.withName(
                                '/')); // Replace '/home' with your desired route
                      } catch (e) {
                        print("Error signing up: $e");
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Sign Up Failed'),
                              content: Text(e.toString()),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
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
            ],
          ),
        ),
      ),
    );
  }
}
