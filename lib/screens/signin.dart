import 'package:client/screens/otp.dart';
import 'package:client/theme/theme_style.dart';
import 'package:client/theme/themedataprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/mkcl.png'),
            height: 100,
            color: Colors.indigo,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  'Mkcl School',
                  style: TextStyle(
                    color: Colors.indigo.shade600,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Creating a Knowledge Lit World',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(
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
              decoration: InputDecoration(

                  // focusColor: Colors.amber,
                  fillColor: Theme.of(context).colorScheme.onSurface,
                  filled: true,
                  labelText: 'Enter an Email',
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
            child: Material(
              color: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.indigo)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OTPScreen()));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.indigo.shade500
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'SIGN IN WITH OTP',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
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
