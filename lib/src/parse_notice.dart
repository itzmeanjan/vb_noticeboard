import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class ParseNotice {
  ParseNotice();
  parseIt(String noticeBoard) =>
      _findChildren(parse(noticeBoard).documentElement);

  _findChildren(Element element, {String indent: ' '}) {
    print('- $indent${element.localName}');
    element.children.forEach(
      (elem) => _findChildren(elem, indent: indent + ' '),
    );
  }
}
