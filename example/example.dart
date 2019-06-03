import 'package:vb_noticeboard/vb_noticeboard.dart';

main() {
  FetchNotice().fetch().then(
        (value) =>
            StoreNotice.storeIt('data.json', ParseNotice().parseIt(value)).then(
              (val) => print(val ? 'Success' : 'Failure'),
              onError: (e) => print(e),
            ),
        onError: (e) => print(e),
      );
  ExtractFromJson.extractIt('data.json').then(
    (data) => print(data),
    onError: (e) => print(e),
  );
}
