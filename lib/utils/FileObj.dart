import 'dart:typed_data';

class FileObj {
  String base64Str;
  String extension;
  String url;
  Uint8List? bytes;

  FileObj(this.base64Str, this.extension, this.url,this.bytes);

  @override
  String toString() {
    return 'FileObj{base64Str: $base64Str, extension: $extension, url: $url}';
  }
}