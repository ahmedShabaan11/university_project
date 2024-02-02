import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/custom_button.dart';
import 'package:university/componenets/custom_text_formfeild.dart';
import 'package:university/constants.dart';
import 'package:university/core/regex_manager.dart';
import 'package:university/screens/loginscreen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _name = TextEditingController();
  final _latname = TextEditingController();
  bool visibilityPassword = true;

  signUp(BuildContext context) async {
    try {
      if (_formKey.currentState!.validate()) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        FirebaseAuth.instance.currentUser
            ?.updateDisplayName(_name.text.trim())
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const Text('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 350,
                child: Image.asset(
                  'assets/images/portrait-young-female-jumping-holding-books_23-2148883676.jpg',
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    controller: _name,
                    text: "First Name",
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    controller: _latname,
                    text: 'Last Name',
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
                    iconData: visibilityPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
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
                      await signUp(context);
                    },
                    title: " SIGN UP",
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
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'SIGN IN',
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
        ]));
  }
}
