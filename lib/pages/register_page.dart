import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_flutter_app/components/my_button.dart';
import 'package:social_flutter_app/components/my_textfield.dart';
import '../helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final TextEditingController usernameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController confirmPdControler = TextEditingController();

  //register methods
  void registerUser() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //make sure password match
    if (passwordControler.text != confirmPdControler.text) {
      //pop loading circle
      Navigator.pop(context);

      // show error message to user
      displayMessageToUser("Password don't match", context);
    }
    //if passwords do match
    else {
      //try create the user
      try {
        //create the user
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailControler.text, password: passwordControler.text);

        //create a user document and add to firestore
        createUserDocument(userCredential);

        //pop loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        if (context.mounted) Navigator.pop(context);

        //display error message  to user
        if (context.mounted) displayMessageToUser(e.code, context);
      }
    }
  }

  //create a user document and collect themm in firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameControler.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.person,
                size: 80, color: Theme.of(context).colorScheme.inversePrimary),

            const SizedBox(
              height: 25,
            ),

            //app name
            const Text(
              'M I N I M A L',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(
              height: 50,
            ),

            //username textfield
            MyTextField(
                hintText: 'Username',
                obscureText: false,
                controller: usernameControler),

            const SizedBox(
              height: 10,
            ),

            //email textfield
            MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: emailControler),

            const SizedBox(
              height: 10,
            ),

            //password textfield
            MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: passwordControler),

            const SizedBox(
              height: 10,
            ),

            //confirm password
            MyTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: confirmPdControler),

            const SizedBox(
              height: 10,
            ),

            //forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 25,
            ),

            //sign in button
            MyButton(
              text: 'Register',
              onTap: registerUser,
            ),

            const SizedBox(
              height: 5,
            ),

            //don't have an account? Register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Login here",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
