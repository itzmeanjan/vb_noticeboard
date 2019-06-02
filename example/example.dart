import 'package:vb_noticeboard/vb_noticeboard.dart';

main() {
  FetchNotice().fetch().then(
        (value) => ParseNotice().parseIt(value),
        onError: (e) => print(e),
      );
}
