import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/custom_button.dart';
import 'package:university/componenets/custom_text_formfeild.dart';
import 'package:university/constants.dart';
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
  bool visibilityPassword = true;

  signUp(BuildContext context)async{
    try {
      if(_formKey.currentState!.validate()){
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        FirebaseAuth.instance.currentUser?.updateDisplayName(_name.text.trim()).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        });
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
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
                        CustomTextFormFeild(
                          controller: _name,
                          hintText: 'Mobile Number /Email',

                        ),CustomTextFormFeild(
                          controller: _emailController,
                          hintText: 'Mobile Number /Email',

                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        CustomTextFormFeild(
                          icon: visibilityPassword ? Icons
                              .visibility_outlined : Icons
                              .visibility_off_outlined,
                          controller: _passwordController,
                          hintText: 'Password',
                          obscureText: visibilityPassword,
                          onTap: () {
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
