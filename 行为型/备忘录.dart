/// 备忘录类，用于存储文本编辑器的状态
class EditorMemento {
  final String text;

  EditorMemento(this.text);
}

/// 原发器，负责生成和恢复状态
class TextEditor {
  String _text = '';

  void appendText(String newText) {
    _text += newText;
  }

  void setText(String text) {
    _text = text;
  }

  String getText() {
    return _text;
  }

  /// 保存当前状态为备忘录
  EditorMemento save() {
    return EditorMemento(_text);
  }

  /// 从备忘录恢复状态
  void restore(EditorMemento memento) {
    _text = memento.text;
  }
}

/// 管理者，用于管理备忘录
class History {
  final List<EditorMemento> _mementos = [];

  void save(EditorMemento memento) {
    _mementos.add(memento);
  }

  EditorMemento? undo() {
    if (_mementos.isNotEmpty) {
      return _mementos.removeLast();
    }
    return null;
  }
}

/// 客户端代码
void main() {
  var editor = TextEditor();
  var history = History();

  // 用户输入文本
  editor.appendText("Hello, ");
  history.save(editor.save()); // 保存状态
  print("After first input: ${editor.getText()}");

  editor.appendText("world!");
  history.save(editor.save()); // 保存状态
  print("After second input: ${editor.getText()}");

  // 撤销一次
  var previousState = history.undo();
  if (previousState != null) {
    editor.restore(previousState);
    print("After undo: ${editor.getText()}");
  }

  // 再撤销一次
  previousState = history.undo();
  if (previousState != null) {
    editor.restore(previousState);
    print("After second undo: ${editor.getText()}");
  }
}
