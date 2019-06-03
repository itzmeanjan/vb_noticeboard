import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

/// Parses fetched html webpage
///
class ParseNotice {
  /// Builds element tree from html page
  /// And extracts target element, passes it to underlying deep parser
  ///
  Map<String, Map<String, String>> parseIt(String noticeBoard) =>
      _findArchiveList(
          parse(noticeBoard).documentElement.getElementsByTagName('ul'));

  /// Extracts target list, which is holding all notices, from other competing list elements
  ///
  Map<String, Map<String, String>> _findArchiveList(List<Element> elements) =>
      _extractNotices(
          elements.where((Element elem) => elem.id == 'archiveList').first);

  /// Builds a map, which will hold all notices, parsed and clean up from html page
  ///
  Map<String, Map<String, String>> _extractNotices(Element targetElement) =>
      Map<String, Map<String, String>>.fromEntries(targetElement.children.map(
        (elem) => MapEntry(
            'http://www.visvabharati.ac.in/${elem.getElementsByTagName('a').first.attributes['href']}',
            _extractNoticeDateAndText(elem.getElementsByTagName('a').first)),
      ));

  /// Extracts notice publishing date and notice text from each notice listing, available on website
  ///
  Map<String, String> _extractNoticeDateAndText(Element element) =>
      Map<String, String>.fromEntries(element.children.map(
        (elem) => elem.className == 'noticeDate'
            ? MapEntry('date', elem.innerHtml)
            : MapEntry('text', elem.innerHtml),
      ));
}
