class Book {
  int? id;
  String? authorName;
  String? bookName;

  Book({this.id, this.authorName, this.bookName});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorName = json['authorName'];
    bookName = json['bookName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['id'] = this.id;
    data['authorName'] = authorName;
    data['bookName'] = bookName;
    return data;
  }

  @override
  String toString() {
    return authorName.toString();
  }
}
