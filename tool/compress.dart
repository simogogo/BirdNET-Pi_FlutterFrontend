import 'dart:io';

void main() async {
  final src = File('build/web/main.dart.js');
  final dst = File('build/web/main.dart.js.gz');

  if (!await src.exists()) {
    print('Error: main.dart.js not found.');
    exit(1);
  }

  print('Reading main.dart.js...');
  final bytes = await src.readAsBytes();
  
  print('Compressing to .gz...');
  final compressedBytes = gzip.encode(bytes);
  
  await dst.writeAsBytes(compressedBytes);
  print('Created main.dart.js.gz successfully!');
}
