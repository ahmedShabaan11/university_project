import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/custom_button.dart';
import 'package:university/componenets/custom_text_formfeild.dart';
import 'package:university/constants.dart';
import 'package:university/core/regex_manager.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/home_screen/admin_home_screen.dart';
import 'package:university/screens/home_screen/prof_home_screen.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';
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
  final _lastName = TextEditingController();
  final _firstName = TextEditingController();
  final _phone = TextEditingController();
  bool visibilityPassword = true;



  signUp(BuildContext context) async {
    try {
      if (_formKey.currentState!.validate()) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        UserModel userModel = UserModel(
          email: _emailController.text.trim(),
          phone: _phone.text.trim(),
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
          password: _passwordController.text.trim(),
          type: "",
          connections: []
        );

        FirebaseAuth.instance.currentUser
            ?.updateDisplayName(_firstName.text+" "+_lastName.text);
        FirebaseAuth.instance.currentUser
            ?.updatePhotoURL(ProfHomeScreen.profHome).then((value) async{
              userModel.type=ProfHomeScreen.profHome;
           await UserFirebase().addUser(userModel).then((v){
             Navigator.pushReplacementNamed(
                 context, LoginScreen.routeName);
           });
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
                height: MediaQuery.of(context).size.height*0.25,
                child: Image.asset(
                  'assets/images/portrait-young-female-jumping-holding-books_23-2148883676.jpg',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      controller: _firstName,
                      text: "First Name",
                      regexCondition: RegexManager.stringRegex,
                    ),const SizedBox(
                      height: kDefaultPadding,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      controller: _lastName,
                      text: 'Last Name',
                      regexCondition: RegexManager.stringRegex,
                    ),const SizedBox(
                      height: kDefaultPadding,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _phone,
                      text: 'Phone',
                      regexCondition: RegexManager.phoneRegex,
                    ),const SizedBox(
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
                      iconData: visibilityPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      text: 'Password',
                      isPassword: visibilityPassword,
                      regexCondition: RegexManager.weakPassword,
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
            ),
          ]),
        ]));
  }
}
