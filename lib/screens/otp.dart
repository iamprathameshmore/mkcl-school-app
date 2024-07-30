import 'package:client/screens/home.dart';
import 'package:client/theme/theme_style.dart';
import 'package:client/theme/themedataprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'OTP Verification',
        //   style: TextStyle(
        //       color: Colors.indigo.shade500, fontWeight: FontWeight.w500),
        // ),
        // centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image(
          //   image: AssetImage('assets/mkcl.png'),
          //   height: 100,
          //   color: Colors.indigo,
          // ),
          // Container(
          //   child: Column(
          //     children: [
          //       Text(
          //         'Mkcl School',
          //         style: TextStyle(
          //           color: Colors.indigo.shade600,
          //           fontWeight: FontWeight.w500,
          //           fontSize: 30,
          //         ),
          //       ),
          //       Text(
          //         'Creating a Knowledge Lit World',
          //         style: TextStyle(color: Colors.grey),
          //       )
          //     ],
          //   ),
          // ),

          Text(
            'OTP Verification',
            style: TextStyle(
                color: Colors.indigo.shade500,
                fontWeight: FontWeight.w500,
                fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          OtpTextField(
            numberOfFields: 4,
            clearText: true,
            textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),

            // borderColor: Theme.of(context).colorScheme.onSurface,
            enabledBorderColor: Theme.of(context).colorScheme.onSurface,
            focusedBorderColor: Theme.of(context).colorScheme.surface,
            fillColor: Theme.of(context).colorScheme.onSurface,
            filled: true,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in

            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              if (verificationCode == 0000) {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    dividerColor: Colors.grey,
                    padding: EdgeInsets.all(10),
                    content: Text(
                      'Hello, username@gmail.com \nplese enter a vaild oTP.',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    leading: Icon(Icons.error_outline),
                    backgroundColor: Colors.red,
                    actions: <Widget>[
                      TextButton(
                        onPressed: ScaffoldMessenger.of(context)
                            .removeCurrentMaterialBanner,
                        child: Text('DISMISS'),
                      ),
                    ],
                  ),
                );
              } else {
                print(verificationCode);
              }
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         title: Text("Verification Code"),
              //         content: Text('Code entered is $verificationCode'),
              //       );
              //     });
            }, // end onSubmit
          ),

          SizedBox(
            height: 20,
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(text: 'OTP is send on your ', children: [
              TextSpan(
                  text: 'username@gmail.com',
                  style: TextStyle(color: Colors.indigo))
            ]),
            style: TextStyle(color: Colors.grey),
          ),

          SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.home))
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          //   child: Material(
          //     color: Colors.indigo,
          //     child: InkWell(
          //       onTap: () => ScaffoldMessenger.of(context).showMaterialBanner(
          //         MaterialBanner(
          //           dividerColor: Colors.grey,
          //           padding: EdgeInsets.all(10),
          //           content: Text(
          //             'Hello, username@gmail.com \nplese enter a vaild oTP.',
          //             style: TextStyle(
          //                 color: Theme.of(context).colorScheme.primary),
          //           ),
          //           leading: Icon(Icons.error_outline),
          //           backgroundColor: Colors.red,
          //           actions: <Widget>[
          //             TextButton(
          //               onPressed: ScaffoldMessenger.of(context)
          //                   .removeCurrentMaterialBanner,
          //               child: Text('DISMISS'),
          //             ),
          //           ],
          //         ),
          //       ),
          //       child: Container(
          //         height: 50,
          //         width: 100,
          //         alignment: Alignment.center,
          //         decoration: const BoxDecoration(
          //             // color: Colors.indigo.shade500
          //             ),
          //         child: const Text(
          //           'Validate',
          //           style: TextStyle(
          //               fontSize: 17,
          //               color: Colors.white,
          //               fontWeight: FontWeight.w400),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          'Secure Your Access with a Quick OTP Check!',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
