import 'package:contact_list/sign_up_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text("Contact List"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ));
          },
          child: Icon(Icons.add)),
    );
  }
}
