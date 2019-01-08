import 'package:reloader/watcher.dart';
import 'package:reloader/runner.dart';
import 'dart:io';

/// main entry point
/// [arguments] length can be 1 ot 2
/// if arguments length 2:
/// - first will be directory to monitor,
/// - secont will be file to start
/// if arguments length 1
/// - current directory will be monitored
/// - argument will be file to start
main(List<String> arguments) async {
  String dir;
  String file;

  if (arguments.length < 1) {
    print('Set directory for monitoring and file to execute, or just file');
    return;
  }

  if (arguments.length == 1) {
    dir = '.';
    file = arguments[0];
  } else if (arguments.length == 2) {
    dir = arguments[0];
    file = arguments[1];
  }

  Process proc;
  bool inProcess = false;

  watch(dir).listen((event) {
    if (null != proc) {
      proc.exitCode.then((code) async {
        if (inProcess) return;
        inProcess = true;
        print('[reloader] finished process: ${code}');
        proc = await run(event.path);
        inProcess = false;
      });
      proc.kill();
    }
  });

  proc = await run(file);

  ProcessSignal.sigint.watch().listen((data) async {
    proc.exitCode.then((code) => exit(0));
    proc.kill();
  });
}
