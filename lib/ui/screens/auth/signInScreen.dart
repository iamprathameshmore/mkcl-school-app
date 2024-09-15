import 'package:client/core/theme/theme_style.dart';
import 'package:client/core/theme/themedataprovider.dart';
import 'package:client/ui/screens/auth/signUpScreen.dart';
import 'package:client/ui/widgets/components/customEmail.Widget.dart';

import 'package:client/ui/widgets/components/focusChangeUtils.dart';
import 'package:client/ui/widgets/components/customBtn.Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();

    final formKey = GlobalKey<FormState>();

    ValueNotifier<bool> passwordText = ValueNotifier<bool>(false);
    bool isLoading = false;

    void handleButtonPress() async {
      setState(() {
        isLoading = false;
      });

      // Simulate a delay for demonstration (e.g., making an API call)
      await Future.delayed(const Duration(seconds: 10));

      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Sign In',
          style: TextStyle(
              color: Colors.indigo.shade500, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.changeTheme();
            },
            icon: Icon(
              themeProvider.themeDataStyle == ThemeDataStyle.dark
                  ? Icons.sunny
                  : Icons.nightlight,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
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
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                validator: ValidationBuilder(optional: true)
                    .email()
                    .maxLength(50)
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
            CustomEmailWidget(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder(
                    valueListenable: passwordText,
                    builder: (context, value, child) {
                      return Form(
                        key: formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                          obscureText: passwordText.value,
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
                              fillColor:
                                  Theme.of(context).colorScheme.onSurface,
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
                        ),
                      );
                    })),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Material(
            //     color: Colors.indigo,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //         side: const BorderSide(color: Colors.indigo)),
            //     child: InkWell(
            //       onTap: isLoading
            //           ? null
            //           : () {
            //               // Validate returns true if the form is valid, or false otherwise.
            //               if (_formKey.currentState!.validate()) {
            //                 // If the form is valid, display a snackbar. In the real world,
            //                 // you'd often call a server or save the information in a database.
            //                 ScaffoldMessenger.of(context).showSnackBar(
            //                   const SnackBar(content: Text('Processing Data')),
            //                 );
            //               }
            //             },
            //       child: isLoading
            //           ? SizedBox(
            //               width: 20,
            //               height: 20,
            //               child: CircularProgressIndicator(
            //                 color: Colors.white,
            //                 strokeWidth: 2,
            //               ),
            //             )
            //           : Container(
            //               height: 50,
            //               width: double.infinity,
            //               alignment: Alignment.center,
            //               decoration: BoxDecoration(
            //                   // color: Colors.indigo.shade500
            //                   borderRadius: BorderRadius.circular(5)),
            //               child: const Text(
            //                 'SIGN IN',
            //                 style: TextStyle(
            //                     fontSize: 17,
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.w500),
            //               ),
            //             ),
            //     ),
            //   ),
            // ),

            CustombtnWidget(
              nameBTN: 'SIGN IN',
              OnTap: () {
                print("print on CustomBtn");
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
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        "Sign Up",
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
      bottomNavigationBar: const Padding(
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
                                    decoration: TextDecoration.underline),
                              )
                            ])
                      ])
                ]),
          ),
        ),
      ),
    );
  }
}