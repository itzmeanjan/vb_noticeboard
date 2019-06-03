import 'dart:io' show File, FileMode;
import 'dart:convert' show json;
import 'dart:async' show Completer;

class StoreNotice {
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
