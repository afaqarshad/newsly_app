import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/components/widgets/textformfields.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            MyTextFormFields(
              hintText: 'Name',
              obsText: false,
              textController: nameController,
            ),
            const SizedBox(
              height: 2,
            ),
            MyTextFormFields(
              hintText: 'E-mail',
              obsText: false,
              textController: emailController,
            ),
            const SizedBox(
              height: 2,
            ),
            MyTextFormFields(
              hintText: 'Password',
              obsText: true,
              textController: passwordController,
            ),
            const SizedBox(
              height: 2,
            ),
            MyTextFormFields(
              hintText: 'Phone Number',
              obsText: false,
              textController: phoneNumController,
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                context.read<AuthViewModel>().signUp(
                    context: context,
                    email: emailController.text,
                    password: passwordController.text);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff1877F2),
                ),
                child: const Center(
                    child: Text(
                  'SignUp',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'or continue with',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  context
                      .read<AuthViewModel>()
                      .signInWithGoogle(context: context);
                },
                child: Image.asset('assets/images/googlebutton.png')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account ? ',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, login);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xff1877F2),
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
