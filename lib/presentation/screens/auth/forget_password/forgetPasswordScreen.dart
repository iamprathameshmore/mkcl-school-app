import 'package:client/presentation/screens/auth/signup/signUpScreen.dart';
import 'package:client/presentation/widgets/common/focusChangeUtils.dart';
import 'package:client/presentation/widgets/common/buttons/customBtn.Widget.dart';
import 'package:client/routes/routes.dart';
import 'package:client/routes/routesName.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();

    final formKey = GlobalKey<FormState>();

    ValueNotifier<bool> passwordText = ValueNotifier<bool>(true);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Colors.grey,
          title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Forget Password',
                  style: TextStyle(color: Colors.indigo.shade600))),
          centerTitle: true),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary),
                  validator: ValidationBuilder(
                          requiredMessage: 'Email must be required')
                      .email('Email must be Valid')
                      .build(),
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (value) {
                    Focuschangeutils.focuschange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                      // focusColor: Colors.amber,
                      fillColor: Theme.of(context).colorScheme.onSurface,
                      filled: true,
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500),
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
              // CustombtnWidget(
              //   buttonText: 'Forget Password',
              //   onTap: () async {
              //     try {
              //       UserCredential userCredential =
              //           await FirebaseAuth.instance.signInWithEmailAndPassword(
              //         email: emailController.text.trim(),
              //         password: passwordController.text.trim(),
              //       );
              //       // Navigate to another screen upon successful sign-in
              //       Navigator.of(context).pushReplacementNamed(Routesname
              //           .home); // Replace '/home' with your home route
              //     } catch (e) {
              //       print("Error signing in: $e");
              //       showDialog(
              //         context: context,
              //         builder: (context) {
              //           return AlertDialog(
              //             title: Text(
              //               'Sign In Failed',
              //               style: TextStyle(color: Colors.red),
              //             ),
              //             content: Text(
              //               e.toString(),
              //               style: TextStyle(color: Colors.grey),
              //             ),
              //             actions: [
              //               TextButton(
              //                 onPressed: () {
              //                   Navigator.of(context).pop();
              //                 },
              //                 child: Text('OK'),
              //               ),
              //             ],
              //           );
              //         },
              //       );
              //     }
              //   },
              // ),

              CustombtnWidget(
                buttonText: 'Forgot Password',
                onTap: () async {
                  if (emailController.text.trim().isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Email Required',
                            style: TextStyle(color: Colors.red),
                          ),
                          content: const Text(
                            'Please enter your email address to reset your password.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }

                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: emailController.text.trim(),
                    );
                    // Show a dialog indicating the email was sent successfully
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Password Reset Email Sent',
                            style: TextStyle(color: Colors.green),
                          ),
                          content: const Text(
                            'Please check your email for instructions to reset your password.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                      // ignore: use_build_context_synchronously
                    ).then((_) {
                      Navigator.pop(context);
                    });
                  } catch (e) {
                    print("Error sending password reset email: $e");
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Error',
                            style: TextStyle(color: Colors.red),
                          ),
                          content: Text(
                            e.toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
