import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsly_app/resources/components/widgets/textformfields.dart';
import 'package:newsly_app/models/user_model.dart' as u;

class ProfilScreen extends StatelessWidget {
  ProfilScreen({super.key});
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
                snapshot.data!;

            u.User user = u.User.fromJson(documentSnapshot.data()!);

            _fullNameController.text = user.fullName;
            _emailController.text = user.email;
            _phoneNumController.text = user.phoneNum.toString();
            _dobController.text = user.dob;

            return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Your Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CusttomTextFormFields(
                        hintText: 'Enter your name',
                        obsText: false,
                        textController: _fullNameController,
                        icon: Icons.person,
                        errorText: 'enter your name'),
                    CusttomTextFormFields(
                        hintText: 'Enter your email',
                        obsText: false,
                        textController: _emailController,
                        icon: Icons.person,
                        errorText: 'enter your email'),
                    CusttomTextFormFields(
                        hintText: 'Enter your phone Number',
                        obsText: false,
                        textController: _phoneNumController,
                        icon: Icons.person,
                        errorText: 'enter your phoneNo.'),
                    CusttomTextFormFields(
                        hintText: 'Enter your DOB',
                        obsText: false,
                        textController: _dobController,
                        icon: Icons.person,
                        errorText: 'enter your DOB'),
                  ],
                ));
          }),
    );
  }
}
