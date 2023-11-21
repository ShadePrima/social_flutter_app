import 'package:flutter/material.dart';
import 'package:social_flutter_app/components/my_button.dart';
import 'package:social_flutter_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //text controllers
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  LoginPage({super.key});

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
              height: 10,
            ),

            //sign in button
            MyButton(
              text: 'Login',
              onTap: () {},
            )

            //don't have an account? Register here
          ],
        ),
      )),
    );
  }
}
