# termdiff

This script lets you diff the outputs of bash commands run at different times.

# Installation

To install, use the provided Makefile:

```
$ sudo make install
```

Similarly, to uninstall, simply use the `uninstall` make target.

> **NOTE:** To install/uninstall the man pages, make *must* be run with `sudo`.

### Debian

You can use [this repo](https://github.com/karagenit/termdiff.deb) to easily build a `.deb` file for simpler installation/removal.

# Usage

To use, simply prefix the command you wish to run with `termdiff`.

```
$ termdiff date
```

This will store the output of the command in a temporary file and compare the output to the output of the most recently `termdiff`'d command (if any).

```
$ termdiff date
$ termdiff date
@@ -1 +1 @@
-Sat Jun 23 15:11:26 EDT 2018
+Sat Jun 23 15:11:28 EDT 2018
```

> **NOTE:** diffs are stored on a per-terminal basis, so commands that you `termdiff` in different terminals won't interfere.

### Options

```
termdiff [OPTION]... COMMAND...

-t, --temporary
       Don't save/cache current output for future diffs.

-o, --output
       Display command output to the console (stdout) - disabled by default.

-s, --silent
       Don't display diff between current and cached command output.

-e, --errors
       Save & diff stderr as well as stdout.

-g, --global
       Saves  &  diffs output to global (all terminals) cache, allowing commands in different terminals to be diffed.
```

### Cleanup

To remove all of the temporary cache files (stored in `/tmp/termdiff`), you can use `make clean`.
