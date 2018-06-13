# termdiff

This script lets you diff the outputs of bash commands run at different times.

# Installation

Use the provided bash scripts:

```
$ ./install
$ ./uninstall
```

The script will be copied to `/usr/local/bin`.

# Usage

To use, simply prefix the command you wish to run with `termdiff`.

```
$ termdiff date
```

This will store the output of the command in a temporary file and compare the output to the output of the most recently `termdiff`'d command (if any).

```
$ termdiff date
$ termdiff date
1c1
< Mon Jun 11 21:48:13 EDT 2018
---
> Mon Jun 11 21:48:16 EDT 2018
```

> **NOTE:** diffs are stored on a per-terminal basis, so commands that are `termdiff`'d in different terminals won't interfere (but you also can't diff the output of a command in another terminal).

### Cleanup

To remove all of the temporary cache files (stored in `/tmp/termdiff`), you can use the provided `clean.sh` script.
