// 图书类
class Book {
  final String title;
  final String category;

  Book(this.title, this.category);
}

// 图书集合
class Library implements Aggregate<Book> {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  @override
  Iterator<Book> createIterator() {
    return ListIterator(_books);
  }
}

// 客户端代码
void main() {
  var library = Library();
  library.addBook(Book("The Great Gatsby", "Novel"));
  library.addBook(Book("A Brief History of Time", "Science"));
  library.addBook(Book("Sapiens", "History"));

  var iterator = library.createIterator();

  print("All books in the library:");
  while (iterator.hasNext()) {
    var book = iterator.next();
    print("${book.title} - ${book.category}");
  }
}
