Reloader

Tool for reloading project when sources are changed

```
$ pub global activate reloader

$ reloader /dir/to/monitor /file/to/execute.dart
or 
$ reloader /file/to/execute.dart // if you want to monitor current directory
```

* reload project on any changes in directory (add/edit/remove file)
* simple to use

Roadmap:
* add directory exceptions
* add event exceptions (do not reload on file addition)