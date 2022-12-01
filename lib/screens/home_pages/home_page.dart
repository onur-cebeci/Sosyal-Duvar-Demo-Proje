import 'package:flutter/material.dart';
import 'package:sosyal_duvar_demo/screens/post_pages/post_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sosyal Duvar"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PostHomePage()));
          },
          child: const Text('Post Page'),
        ),
      ),
    );
  }
}
