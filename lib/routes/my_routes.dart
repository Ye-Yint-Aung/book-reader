import 'package:get/route_manager.dart';
import 'package:solve/ui/add_book.dart';
import 'package:solve/ui/book_detail.dart';
import 'package:solve/ui/downloaded_screen.dart';
import 'package:solve/ui/home_screen.dart';

class MyRoute {
  static final routes = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: '/detail', page: () => BookDetailScreen()),
    GetPage(name: '/download', page: () => const DownloadedScreen()),
    GetPage(name: '/add', page: () => AddBookScreen()),
  ];
}
