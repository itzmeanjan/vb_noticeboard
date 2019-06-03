import 'dart:io' show File, FileMode;
import 'dart:convert' show json;
import 'dart:async' show Completer;

/// Stores parsed and formatted notices in a JSON file
///
class StoreNotice {
  /// Takes notices in form of map and a target filepath
  /// Writes notices in target file, json formatted
  ///
  /// Denotes success by returning true otherwise returns false
  ///
  static Future<bool> storeIt(
      String filePath, Map<String, Map<String, String>> data) {
    var completer = Completer<bool>();
    try {
      File(filePath).openWrite(
        mode: FileMode.write,
      )
        ..write(json.encode(data))
        ..close().then(
          (val) => completer.complete(true),
          onError: (e) => completer.complete(false),
        );
    } on Exception {
      completer.complete(false);
    }
    return completer.future;
  }
}
