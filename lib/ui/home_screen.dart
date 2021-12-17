import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solve/controller/book_controller.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final BookController controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Book"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                controller.clear();
                Get.toNamed('/add');
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        drawer: _Drawer(),
        body: _Body());
  }

  // ignore: non_constant_identifier_names
  Obx _Body() {
    return Obx(() => ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (ctx, idx) {
            //var bookList = controller.books;
            return InkWell(
              onTap: () {
                Get.toNamed('/detail', arguments: {
                  "b_name": controller.books[idx].bookName.toString(),
                  "a_name": controller.books[idx].authorName.toString()
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.red,

                  //trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add)) ,
                  leading: const Icon(
                    Icons.book_outlined,
                    color: Colors.orange,
                    size: 50,
                  ),
                  title: Text(controller.books[idx].bookName.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(controller.books[idx].authorName.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            );
          },

          //shrinkWrap: true,
        ));
  }

  // ignore: non_constant_identifier_names
  Drawer _Drawer() {
    return Drawer(
        child: ListView(
      children: [
        ListTile(
          title: const Text("All Books"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Catigories"),
          onTap: () {},
        ),
      ],
    ));
  }
}
