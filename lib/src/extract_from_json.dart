import 'dart:convert' show json, utf8;
import 'dart:io' show File;
import 'dart:async' show Completer;

/// Converts notices back to map, from json formatted file
///
class ExtractFromJson {
  /// Takes filepath, reads file and returns deserialized data
  ///
  /// In case of absense of file in target location, returns empty map
  ///
  static Future<Map<String, Map<String, String>>> extractIt(String filePath) {
    var completer = Completer<Map<String, Map<String, String>>>();
    try {
      File(filePath)
          .openRead()
          .transform(utf8.decoder)
          .transform(json.decoder)
          .listen(
            (data) => completer.complete(
                  Map<String, dynamic>.from(data).map(
                    (key, val) => MapEntry(
                          key,
                          Map<String, String>.from(val),
                        ),
                  ),
                ),
            onError: (e) => completer.complete({}),
            cancelOnError: true,
          );
    } on Exception {
      completer.complete({});
    }
    return completer.future;
  }
}
