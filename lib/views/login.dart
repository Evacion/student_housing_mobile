import 'package:flutter/material.dart';
import 'package:student_housing_mobile/widgets/firebase_signin_button.dart';
import 'package:student_housing_mobile/widgets/google_signin_button.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenOrient = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: screenOrient == Orientation.landscape ? screenSize.height : screenSize.height*0.75,
          width: screenOrient == Orientation.landscape ? screenSize.width*0.5 : screenSize.width,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                        ),
                        Card(
                          color: Theme.of(context).cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.all(24),
                          child: const Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GoogleSigninButton(),
                                SizedBox(
                                  height: 40,
                                  child: Text(
                                    'OR',
                                    textAlign: TextAlign.center,
                                    textScaler: TextScaler.linear(2),
                                  ),
                                ),
                                FirebaseSignInButton(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
