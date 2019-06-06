# vb_noticeboard
A simple Dart wrapper for fetching, parsing and extracting notices from **Visva-Bharati, Santiniketan's** Official website

Show some :heart: by putting :star:

**This plugin is readily available for [use](https://pub.dev/packages/vb_noticeboard).**

## what does it do ?
- Can fetch list of notices from *Visva-Bharati, Santiniketan's* Official [Website](http://www.visvabharati.ac.in)
- Parse them and extract them from html page
- Clean up data and convert it to `Map<String, Map<String, String>>`
- Can store processed data in `JSON` file
- Can read data back from `JSON` file and convert it to `Map<String, Map<String, String>>`, so that it can be used again

## how to use it ?
### Fetching Notices :
```dart
FetchNotice().fetch().then(
        (value) {
            // more code coming
        },
        onError: (e) => print(e),
      );
```
### Parsing HTML page to `Map<String, Map<String, String>>` :
```dart
ParseNotice().parseIt(value);
```
### Storing parsed Notices :
```dart
StoreNotice.storeIt('data.json', ParseNotice().parseIt(value)).then(
        (val) => print(val ? 'Success' : 'Failure'),
        onError: (e) => print(e),
);
```
### Extracting Notices from JSON :
```dart
ExtractFromJson.extractIt('data.json').then(
    (data) => print(data),
    onError: (e) => print(e),
);
```
### Merging up all of them :
```dart
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
```

Make sure you've imported `vb_noticeboard.dart`
```dart
import 'package:vb_noticeboard/vb_noticeboard.dart';
```

Hoping it was helpful :smile:
