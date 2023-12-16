import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopify_app/pages/master_page.dart';
import 'package:shopify_app/services/prefrences.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool obscureText = true;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                        //Do something with the user input.
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'email is required';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text('Email'),
                        suffixIcon: const Icon(Icons.mail),
                        // fillColor: Colors.red,
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: obscureText,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'password is required';
                        }
                        if (value.length < 8) {
                          return 'Password length must be 8';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        suffixIcon: InkWell(
                          onTap: () {
                            obscureText = !obscureText;
                            setState(() {});
                          },
                          child: obscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),

                        // fillColor: Colors.red,
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, 'home_screen');
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          showSpinner = false;
                        });

                        if ((formKey.currentState?.validate() ?? false)) {
                          GetIt.I<SharedPreferences>()
                              .setString('user', emailController.text);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => MasterPage()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 60),
                      ),
                      child: Text('Submit'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
