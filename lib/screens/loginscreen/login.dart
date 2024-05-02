import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/custom_button.dart';
import 'package:university/componenets/custom_text_formfeild.dart';
import 'package:university/constants.dart';
import 'package:university/core/regex_manager.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';
import 'package:university/screens/signup_screen/sign_up.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //changes current state
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  signIn(BuildContext context) async {
    try {
      if (_formKey.currentState!.validate()) {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim())
            .then((value) {
          Navigator.pushReplacementNamed(
              context, FirebaseAuth.instance.currentUser!.photoURL!);
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool visibilityPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //when user taps any Where on the screen ,keyboard hides
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 2.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/splash.png",
                    height: 150,
                    width: 150,
                  ),
                  sizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w100),
                      ),
                      Text(
                        'Student',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 5,
                  ),
                  Text('Sign In To Continue',
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2)
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 5),
                ),
                color: kOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          text: 'Email',
                          regexCondition: RegexManager.emailRegex,

                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        CustomTextFormField(
                          iconData: visibilityPassword ? Icons
                              .visibility_outlined : Icons
                              .visibility_off_outlined,
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          text: 'Password',
                          isPassword: visibilityPassword,
                          onClick: () {
                            setState(() {
                              visibilityPassword = !visibilityPassword;
                            });
                            // print(_passwordController.text);
                          },
                        ),
                        sizedBox,
                        DefaultButton(
                          onPress: () async {
                            await signIn(context);

                          },
                          title: " SIGN IN",
                          iconData: Icons.arrow_forward_outlined,
                        ),
                        sizedBox,
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ),
                              );
                            },
                            child: const Text(
                              'SIGN UP',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

}