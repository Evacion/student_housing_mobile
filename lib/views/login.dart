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
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Housing for Students',
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Sign In'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const GoogleSigninButton(),
                                    const SizedBox(
                                      width: 40,
                                      child: Text(
                                        'OR',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FirebaseSignInButton(),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // RichText(
                                //   text: TextSpan(
                                //     children: [
                                //       const TextSpan(
                                //         text: 'Don\'t have an account? ',
                                //       ),
                                //       TextSpan(
                                //         text: 'Sign Up here',
                                //         style: TextStyle(
                                //           fontWeight: FontWeight.w600,
                                //           color: Theme.of(context).colorScheme.primary,
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
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
