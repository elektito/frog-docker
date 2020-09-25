# Docker Build for Frog

[Frog][1] is an integration of memory-based natural language
processing (NLP) modules developed for Dutch. A frog package is
available in Debian/Ubuntu repositories, but it's fairly
outdated. Building from source can be tedious due to the fact that if
you want to build the latest version of Frog, you'll also need the
latest versions of its dependencies which then also need to be built
from source.

The included Dockerfile simply helps you build a Frog based docker
image based on the Frog version of your choice.

The following build-time arguments are available to set the version of
Frog and its dependencies:

 - `FROG_VER`
 - `FROGDATA_VER`
 - `TICCUTILS_VER`
 - `TIMBL_VER`
 - `MBT_VER`
 - `LIBFOLIA_VER`
 - `UCTODATA_VER`
 - `UCTO_VER`

Default values are for Frog version 0.21 which at the moment of
writing this is the latest version. In order to work out the
dependency versions needed, you can look at the `configure.ac` file in
the Frog code base. Simply grep for the names of the packages and
you'll find the relevant version numbers. The only exception is the
`uctodata` package that is not a direct dependency of Frog, so for
that you're going to need to look at the `configure.ac` file in `ucto`
code base.

I have already pushed a pre-built version of Frog 0.21 to
`elektito/frog:0.21`.

[1]: https://github.com/LanguageMachines/frog/
