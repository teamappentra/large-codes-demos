# GROMACS analysis with Parallelware Analyzer

First, run 'setup.sh' to configure a CMake build including the 'compile_commands.json' file that will use Parallelware Analyzer to determine the compiler flags required for the analysis to succeed.

Then, run 'analyze.sh' to launch the Parallelware Analyzer analysis. The analysis uses the 'pwa.json' configuration file which instructs Parallelware Analyzer to consume the 'compile_commands.json' and adds some symbol definitions and include directories.

## Example output

The following output corresponds to an execution on a laptop running Ubuntu 21.04 and equipped with an AMD Ryzen 4800H CPU and 16 GBs of RAM:

```
$ ./analyze.sh
...
CODE COVERAGE
  Analyzable files:          1282 / 1287  ( 99.61 %)
  Analyzable functions:      3542 / 23088 ( 15.34 %)
  Analyzable loops:          3091 / 11986 ( 25.79 %)
  Parallelized SLOCs:        2793 / 489463 (  0.57 %)

METRICS SUMMARY
  Total defects:                 0
  Total recommendations:      6072
  Total remarks:              1614
  Total opportunities:        3152
...
1282 files successfully analyzed and 5 failures in 1 h 7 m 27 s

real    67m27,451s
user    67m2,651s
sys     0m10,719s
```
