import 'package:flutter/material.dart';
import '../api/post_api.dart';
import '../widget/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> user = [];

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Flutter REST API",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            return MyCard(
              body: user[index].body,
              title: user[index].title,
            );
          },
        ),
      ),
    );
  }

  fetchPost() async {
    var response = await PostApi.getPostData();

    setState(() {
      user = response;
    });
  }
}
