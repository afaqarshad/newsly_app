import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/resources/components/widgets/textformfields.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            CusttomTextFormFields(
              hintText: 'Name',
              obsText: false,
              textController: nameController,
              icon: Icons.person,
              errorText: 'Please Enter Name',
            ),
            const SizedBox(
              height: 2,
            ),
            CusttomTextFormFields(
              hintText: 'E-mail',
              obsText: false,
              textController: emailController,
              icon: Icons.email,
              errorText: 'Please a valid Email',
            ),
            const SizedBox(
              height: 2,
            ),
            CusttomTextFormFields(
              hintText: 'Password',
              obsText: true,
              textController: passwordController,
              icon: Icons.lock,
              errorText: 'Please a Enter Password',
            ),
            const SizedBox(
              height: 2,
            ),
            CusttomTextFormFields(
              hintText: 'DOB 1/18/2002',
              obsText: false,
              textController: dobController,
              icon: Icons.phone,
              errorText: 'Please enter DOB',
            ),
            const SizedBox(
              height: 2,
            ),
            CusttomTextFormFields(
              hintText: 'Phone Number',
              obsText: false,
              textController: phoneNumController,
              icon: Icons.phone,
              errorText: 'Please enter phone no',
            ),
            const SizedBox(
              height: 5,
            ),
            Consumer<AuthViewModel>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () async {
                    print("email: ${emailController.text}");
                    print("pass: ${passwordController.text}");

                    await value.signUp(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        phoneNo: phoneNumController.text);

                    print(FirebaseAuth.instance.currentUser!.uid);
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
                      ),
                    ),
                  ),
                );
              },
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
            Consumer<AuthViewModel>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    value.signInWithGoogle(context: context);
                  },
                  child: Image.asset('assets/images/googlebutton.png'),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account ? ',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, logIn);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Color(0xff1877F2),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
