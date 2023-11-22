import 'package:flutter/material.dart';
import 'package:social_flutter_app/components/my_button.dart';
import 'package:social_flutter_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //text controllers
  final TextEditingController usernameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController confirmPdControler = TextEditingController();

  //register methods
  void registerUser() {
    //show loading circle

    //make sure password match

    //try creating the user
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
                  onTap: onTap,
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
