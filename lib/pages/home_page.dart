import 'package:flutter/material.dart';
import 'package:social_flutter_app/components/my_drawer.dart';
import 'package:social_flutter_app/components/my_textfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //text controller
  final TextEditingController newPostControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("W A L L"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(children: [
        //textfield box for user to type
        Padding(
          padding: const EdgeInsets.all(25),
          child: MyTextField(
              hintText: "Say something",
              obscureText: false,
              controller: newPostControler),
        ),

        //posts
      ]),
    );
  }
}
