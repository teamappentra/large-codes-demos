# GROMACS analysis with Parallelware Analyzer

First, run 'setup.sh' to configure a CMake build including the 'compile_commands.json' file that will use Parallelware Analyzer to determine the compiler flags required for the analysis to succeed.

Then, run 'analyze.sh' to launch the Parallelware Analyzer analysis. The analysis uses the 'pwa.json' configuration file which instructs Parallelware Analyzer to consume the 'compile_commands.json' and adds some symbol definitions and include directories.
