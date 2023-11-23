import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_flutter_app/components/my_button.dart';
import 'package:social_flutter_app/components/my_textfield.dart';
import 'package:social_flutter_app/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final TextEditingController emailControler = TextEditingController();

  final TextEditingController passwordControler = TextEditingController();

  //login methods
  void login() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //try sign in

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControler.text, password: passwordControler.text);

      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    }
    //display any errors

    on FirebaseAuthException catch (e) {
      //pop loading circle
      if (context.mounted) Navigator.pop(context);

      if (context.mounted) displayMessageToUser(e.code, context);
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
              text: 'Login',
              onTap: login,
            ),

            const SizedBox(
              height: 5,
            ),

            //don't have an account? Register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Register here",
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
