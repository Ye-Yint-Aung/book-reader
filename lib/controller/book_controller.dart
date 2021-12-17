import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solve/database/database.dart';
import 'package:solve/model/book.dart';

class BookController extends GetxController {
  RxList<Book> books = <Book>[].obs;
  final TextEditingController authorTextController = TextEditingController();
  final TextEditingController bookNameTextController = TextEditingController();
  final _db = DatabaseHelper.instance;

  @override
  void onClose() {
    authorTextController.dispose();
    bookNameTextController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    getAllBook();
  }

  clear() {
    authorTextController.clear();
    bookNameTextController.clear();
  }

  addBook() {
    Book book = Book(
        authorName: authorTextController.text,
        bookName: bookNameTextController.text);
    log("called add Book");
    _db.insert(book.toJson());
    getAllBook();
  }

  getAllBook() async {
    final listBook = await _db.queryAllRows();
    log("queryallrow" + listBook.toString());
    books.value = listBook;
  }
}
