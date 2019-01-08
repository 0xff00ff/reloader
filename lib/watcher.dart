import 'package:path/path.dart' as p;
import 'package:watcher/watcher.dart';

/// watch for directory changes
Stream<WatchEvent> watch(directory) {
  var watcher = DirectoryWatcher(p.absolute(directory));
  return watcher.events;
}
