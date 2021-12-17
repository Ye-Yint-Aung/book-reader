// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BookDetailScreen extends StatelessWidget {
  BookDetailScreen({Key? key}) : super(key: key);

  // Argument for Book Name and Author Name from homeScreen
  String bName = Get.arguments["b_name"];
  String aName = Get.arguments["a_name"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: _Body(),
    );
  }

  // ignore: non_constant_identifier_names
  Column _Body() {
    return Column(
      children: [
        Container(
          color: Colors.white70,
          height: 140,
          padding: const EdgeInsets.all(15),
          child: headerContainerView(),
        ),
        const Divider(
          thickness: 2,
        ),
        Container(
          padding: const EdgeInsets.all(2),
          child: otherFunction(),
        ),
        const Divider(
          thickness: 2,
        ),
        const Text(
          "Suggested Book",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 200,
          child: suggestBookView(),
        )
      ],
    );
  }

  Column otherFunction() {
    return Column(
      children: [
        ListTile(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.book)),
          title: const Text("Read"),
        ),
        const Divider(
          thickness: 2,
        ),
        ListTile(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          title: const Text("Delete Book"),
        ),
        const Divider(
          thickness: 2,
        ),
        ListTile(
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          title: const Text("Favorite Book"),
        ),
      ],
    );
  }

  Row headerContainerView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink,
              image: const DecorationImage(
                  image: AssetImage('assets/images/book.png'),
                  fit: BoxFit.fitHeight)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NAME: $bName",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              // const SizedBox(
              //   height: 10,
              //),
              Text(
                "AUTHOR: $aName",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }

  ListView suggestBookView() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 200,
          color: Colors.blue,
        ),
        Container(
          width: 200,
          color: Colors.red,
        ),
        Container(
          width: 200,
          color: Colors.yellow,
        ),
        Container(
          width: 200,
          color: Colors.green,
        )
      ],
    );
  }
}
