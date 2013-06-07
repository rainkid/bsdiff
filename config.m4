dnl $Id$
dnl config.m4 for extension bsdiff

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

PHP_ARG_WITH(bsdiff, for BZip2 support,
[  --with-bz2[=DIR]        Include BZip2 support])

if test "$PHP_BSDIFF" != "no"; then
  if test -r $PHP_BZ2/include/bzlib.h; then
    BZIP_DIR=$PHP_BZ2
  else
    AC_MSG_CHECKING(for BZip2 in default path)
    for i in /usr/local /usr; do
      if test -r $i/include/bzlib.h; then
        BZIP_DIR=$i
        AC_MSG_RESULT(found in $i)
        break
      fi
    done
  fi

  if test -z "$BZIP_DIR"; then
    AC_MSG_RESULT(not found)
    AC_MSG_ERROR(Please reinstall the BZip2 distribution)
  fi

  PHP_CHECK_LIBRARY(bz2, BZ2_bzerror, 
  [
    PHP_ADD_INCLUDE($BZIP_DIR/include)
    dnl PHP_ADD_LIBRARY_WITH_PATH(bz2, $BZIP_DIR/$PHP_LIBDIR, BSDIFF_SHARED_LIBADD)
    AC_DEFINE(HAVE_BZ2,1,[ ])
  ], [
    AC_MSG_ERROR(bsdiff module requires libbz2 >= 1.0.0)
  ], [
    -L$BZIP_DIR/$PHP_LIBDIR
  ])

  PHP_SUBST(BSDIFF_SHARED_LIBADD)
  PHP_ADD_LIBRARY(bz2, 1, BSDIFF_SHARED_LIBADD)
  PHP_CHECK_LIBRARY(bz2, BZ2_bzWriteOpen, [ ], AC_MSG_ERROR([your bzlib is not shared]))
  PHP_CHECK_LIBRARY(bz2, BZ2_bzWrite, [ ], AC_MSG_ERROR([your bzlib is not shared]))

  PHP_NEW_EXTENSION(bsdiff, bsdiff.c, $ext_shared)
fi
