import 'package:client/presentation/providers/signInProviders.dart';
import 'package:client/presentation/screens/auth/signUpScreen.dart';
import 'package:client/presentation/widgets/common/focusChangeUtils.dart';
import 'package:client/presentation/widgets/common/buttons/customBtn.Widget.dart';
import 'package:client/presentation/widgets/screens/loadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final siginProvider = ref.watch(userDataProvider);

    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();

    final formKey = GlobalKey<FormState>();

    ValueNotifier<bool> passwordText = ValueNotifier<bool>(false);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          title: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.titleLarge,
              )),
          centerTitle: true),
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
                  style: GoogleFonts.syne(
                    color: Colors.indigo.shade600,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Creating a Knowledge Lit World',
                  style: GoogleFonts.syne(color: Colors.grey),
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
                style: GoogleFonts.syne(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary),
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
                    labelStyle: GoogleFonts.syne(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700),
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
            // const CustomEmailWidget(
            //   name: "Email",
            // ),
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
                          style: GoogleFonts.syne(
                              fontWeight: FontWeight.w700,
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
                              labelStyle: GoogleFonts.syne(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w700),
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
              isLoading: false,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Loadingwidget(
                              msg: 'jellp',
                            )));

                if (kDebugMode) {
                  print("print on CustomBtn");
                }
              },
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
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
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.indigo.shade600,
                          ),
                        ))
                  ],
                )),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 50,
                child: Text.rich(
                  style: GoogleFonts.syne(
                      color: Colors.grey, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                  const TextSpan(
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
            )
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //   child: SizedBox(
      //     height: 50,
      //     child: Text.rich(
      //       style: GoogleFonts.syne(
      //           color: Colors.grey, fontWeight: FontWeight.w700),
      //       textAlign: TextAlign.center,
      //       const TextSpan(
      //           text: 'By Siginin You Accepts our ',
      //           // style: TextStyle(color: Theme.of(context).colorScheme.primary),
      //           children: [
      //             TextSpan(
      //                 text: 'Terma of Use',
      //                 style: TextStyle(
      //                     color: Colors.indigo,
      //                     decorationColor: Colors.indigo,
      //                     decoration: TextDecoration.underline),
      //                 children: [
      //                   TextSpan(
      //                       text: ' and ',
      //                       style: TextStyle(
      //                           color: Colors.grey,
      //                           decoration: TextDecoration.none),
      //                       children: [
      //                         TextSpan(
      //                           text: 'Privacy Polices',
      //                           style: TextStyle(
      //                               color: Colors.indigo,
      //                               decorationColor: Colors.indigo,
      //                               decoration: TextDecoration.underline),
      //                         )
      //                       ])
      //                 ])
      //           ]),
      //     ),
      //   ),
      // ),
    );
  }
}
