import 'package:flutter/material.dart';
import 'package:university/componenets/custom_button.dart';
import 'package:university/constants.dart';
import 'package:university/screens/home_screen/home_screen.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //changes current state
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w100),
                      ),
                      Text(
                        'Student',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 5,
                  ),
                  Text('Sign In To Continue',
                      style: Theme.of(context).textTheme.subtitle2)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                        buildTEmailField(),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        buildPasswordField(),
                        sizedBox,
                        DefaultButton(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  HomeScreen.routeName,
                                  (route) => false);
                            }
                          },
                          title: 'SIGN IN',
                          iconData: Icons.arrow_forward_outlined,
                        ),
                        sizedBox,
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forgot Password',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
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

  TextFormField buildTEmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17,
        fontWeight: FontWeight.w300,
      ),
      decoration: const InputDecoration(
        labelText: 'Mobile Number /Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      //for validation
      validator: (value) {
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'please Enter some Text ';
        } else if (!regExp.hasMatch(value)) {
          return 'Please Enter a valid email address ';
        }
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(_passwordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_off_outlined),
          iconSize: kDefaultPadding,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
      },
    );
  }
}
