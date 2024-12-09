// 抽象访问者
abstract class Visitor {
  void visitTextFile(TextFile file);
  void visitImageFile(ImageFile file);
}

// 抽象元素
abstract class File {
  void accept(Visitor visitor);
}

// 具体元素：文本文件
class TextFile implements File {
  final String content;

  TextFile(this.content);

  @override
  void accept(Visitor visitor) {
    visitor.visitTextFile(this);
  }
}

// 具体元素：图片文件
class ImageFile implements File {
  final String resolution;

  ImageFile(this.resolution);

  @override
  void accept(Visitor visitor) {
    visitor.visitImageFile(this);
  }
}

// 具体访问者：统计器
class StatsVisitor implements Visitor {
  int textFileCount = 0;
  int imageFileCount = 0;

  @override
  void visitTextFile(TextFile file) {
    textFileCount++;
    print("Analyzing TextFile: Content = ${file.content}");
  }

  @override
  void visitImageFile(ImageFile file) {
    imageFileCount++;
    print("Analyzing ImageFile: Resolution = ${file.resolution}");
  }
}

// 具体访问者：压缩器
class CompressionVisitor implements Visitor {
  @override
  void visitTextFile(TextFile file) {
    print("Compressing TextFile: Content = ${file.content}");
  }

  @override
  void visitImageFile(ImageFile file) {
    print("Compressing ImageFile: Resolution = ${file.resolution}");
  }
}

// 客户端代码
void main() {
  // 创建文件
  List<File> files = [
    TextFile("Hello World"),
    ImageFile("1920x1080"),
    TextFile("Dart Visitor Pattern"),
    ImageFile("1080x720"),
  ];

  // 使用统计访问者
  StatsVisitor statsVisitor = StatsVisitor();
  for (var file in files) {
    file.accept(statsVisitor);
  }
  print(
      "Text Files: ${statsVisitor.textFileCount}, Image Files: ${statsVisitor.imageFileCount}");

  // 使用压缩访问者
  CompressionVisitor compressionVisitor = CompressionVisitor();
  for (var file in files) {
    file.accept(compressionVisitor);
  }
}
