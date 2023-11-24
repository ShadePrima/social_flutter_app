import 'package:flutter/material.dart';
import 'package:social_flutter_app/components/my_drawer.dart';
import 'package:social_flutter_app/components/my_post_button.dart';
import 'package:social_flutter_app/components/my_textfield.dart';
import 'package:social_flutter_app/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  //text controller
  final TextEditingController newPostControler = TextEditingController();

  //post message
  void postMessage() {
    //only post message if there is something in the textfield
    if (newPostControler.text.isNotEmpty) {
      String message = newPostControler.text;
      database.addPost(message);
    }
  }

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
          child: Row(
            children: [
              //textfield
              Expanded(
                child: MyTextField(
                    hintText: "Say something",
                    obscureText: false,
                    controller: newPostControler),
              ),

              //post button
              MyPostButton(
                onTap: postMessage,
              )
            ],
          ),
        ),

        //posts
      ]),
    );
  }
}
