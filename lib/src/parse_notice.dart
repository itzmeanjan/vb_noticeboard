import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class ParseNotice {
  ParseNotice();
  Map<String, Map<String, String>> parseIt(String noticeBoard) =>
      _findArchiveList(
          parse(noticeBoard).documentElement.getElementsByTagName('ul'));

  Map<String, Map<String, String>> _findArchiveList(List<Element> elements) =>
      _extractNotices(
          elements.where((Element elem) => elem.id == 'archiveList').first);

  Map<String, Map<String, String>> _extractNotices(Element targetElement) =>
      Map<String, Map<String, String>>.fromEntries(targetElement.children.map(
        (elem) => MapEntry(
            'http://www.visvabharati.ac.in/${elem.getElementsByTagName('a').first.attributes['href']}',
            _extractNoticeDateAndText(elem.getElementsByTagName('a').first)),
      ));

  Map<String, String> _extractNoticeDateAndText(Element element) =>
      Map<String, String>.fromEntries(element.children.map(
        (elem) => elem.className == 'noticeDate'
            ? MapEntry('date', elem.innerHtml)
            : MapEntry('text', elem.innerHtml),
      ));
}
