import 'dart:io';
import 'dart:convert';

/// run selected file
Future<Process> run(String file) async {
  print('started');
  Process process = await Process.start('dart', [file]);
  print('[dartmon] started process - ' + process.pid.toString());
  process.stdout.transform(utf8.decoder).listen(print);
  process.stderr.transform(utf8.decoder).listen(print);
  return process;
}
