# v1.0.0
- Fetches html web page over http from [here](http://visvabharati.ac.in)
- Parses web page, extracts list of notices
- Processes data and returns `Map<String, Map<String, String>>`, in case of success
- Can store it in `JSON` format file
- Can read from `JSON` file, and convert it back to `Map<String, Map<String, String>>`
