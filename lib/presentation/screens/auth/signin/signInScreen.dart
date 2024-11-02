import 'package:client/presentation/screens/auth/signup/signUpScreen.dart';
import 'package:client/presentation/widgets/common/focusChangeUtils.dart';
import 'package:client/presentation/widgets/common/buttons/customBtn.Widget.dart';
import 'package:client/routes/routes.dart';
import 'package:client/routes/routesName.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

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
          title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sign In',
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
                                fontWeight: FontWeight.w500),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'forgetPasswordScreen');
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Colors.indigo.shade500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              CustombtnWidget(
                buttonText: 'Sign In',
                onTap: () async {
                  try {
                    UserCredential userCredential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    // Navigate to another screen upon successful sign-in
                    Navigator.of(context).pushReplacementNamed(Routesname
                        .home); // Replace '/home' with your home route
                  } catch (e) {
                    print("Error signing in: $e");
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Sign In Failed',
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
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have any Account? ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.indigo.shade600,
                            ),
                          ))
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 50,
                  child: Text.rich(
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w700),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
