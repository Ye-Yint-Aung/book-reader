import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solve/controller/book_controller.dart';

class AddBookScreen extends StatelessWidget {
  AddBookScreen({Key? key}) : super(key: key);
  final BookController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Book"),
      ),
      body: Column(
        children: [
          const Icon(
            Icons.upload_file_outlined,
            size: 100,
          ),
          Column(
            children: [
              // const Icon(
              //   Icons.image,
              // ),
              TextField(
                showCursor: true,
                controller: controller.bookNameTextController,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "Book Name",
                    contentPadding: EdgeInsets.only(left: 8),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                maxLines: null,
                showCursor: true,
                controller: controller.authorTextController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: "Author Name",
                    contentPadding: EdgeInsets.only(left: 8),
                    border: InputBorder.none),
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.addBook();
                    controller.clear();
                    Get.back();
                  },
                  child: const Text("Save"))
            ],
          ),
        ],
      ),
    );
  }
}
