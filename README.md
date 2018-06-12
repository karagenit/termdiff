# termdiff

This script lets you diff the outputs of bash commands run at different times.

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
