import 'package:chatting_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _authentication.currentUser;

    if (user != null) {
      try {
        loggedUser = user;
        print(loggedUser!.email);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void logOut() async {
      await _authentication.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginSignupScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat screen'),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('Chat Screen'),
      ),
    );
  }
}
