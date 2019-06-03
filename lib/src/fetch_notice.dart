import 'dart:io' show HttpClient, HttpClientRequest, HttpClientResponse;
import 'dart:async' show Completer;
import 'dart:convert' show utf8;

/// Fetches notices from Visva-Bharati Official Website
///
/// takes a single argument, targetURL, which has a default value
///
class FetchNotice {
  String targetURL;
  FetchNotice(
      {this.targetURL:
          'http://www.visvabharati.ac.in/list_all_notice.html/type/notice'});

  /// Fetches html webpage, from url provided
  /// So that it next step this can be parsed
  ///
  Future<String> fetch() {
    var completer = Completer<String>();
    HttpClient()
        .getUrl(Uri.parse(targetURL))
        .then(
          (HttpClientRequest request) => request.close(),
          onError: (e) => completer.completeError(e.toString()),
        )
        .then(
      (HttpClientResponse response) {
        String dataContainer = '';
        response.transform(utf8.decoder).listen(
              (String data) => dataContainer += data,
              onError: (e) => completer.completeError(e.toString()),
              cancelOnError: true,
              onDone: () => completer.complete(dataContainer),
            );
      },
      onError: (e) => completer.completeError(e.toString()),
    );
    return completer.future;
  }
}
