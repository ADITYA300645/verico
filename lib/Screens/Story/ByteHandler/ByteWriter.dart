import 'dart:io';
import 'dart:typed_data';

Future<void> WriteToFile(ByteData data, String path) {
  final buffer = data.buffer;
  print("asdasd");
  return new File(path)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}
