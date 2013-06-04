dnl $Id$
dnl config.m4 for extension bsdiff

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

PHP_ARG_WITH(bsdiff, for bsdiff support,
[  --with-bsdiff             Include bsdiff support])

dnl Otherwise use enable:

dnl PHP_ARG_ENABLE(bsdiff, whether to enable bsdiff support,
dnl [  --enable-bsdiff           Enable bsdiff support])

if test "$PHP_BSDIFF" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-bsdiff -> check with-path

  if test -r $PHP_BSDIFF/include/bzlib.h; then
    BZIP_DIR=$PHP_BSDIFF
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

  PHP_ADD_INCLUDE($BZIP_DIR/include)

  PHP_CHECK_LIBRARY(bz2, BZ2_bzerror, 
  [
    PHP_ADD_INCLUDE($BZIP_DIR/include)
    PHP_ADD_LIBRARY_WITH_PATH(bz2, $BZIP_DIR/$PHP_LIBDIR, BZ2_SHARED_LIBADD)
    AC_DEFINE(HAVE_BZ2,1,[ ])
  ], [
    AC_MSG_ERROR(bz2 module requires libbz2 >= 1.0.0)
  ], [
    -L$BZIP_DIR/$PHP_LIBDIR
  ])

  PHP_SUBST(BSDIFF_SHARED_LIBADD)

  dnl PHP_CHECK_LIBRARY(bzlib, BZ2_bzWriteOpen, [ ], AC_MSG_ERROR([your bzlib is not shared]))
  dnl PHP_CHECK_LIBRARY(bzlib, BZ2_bzWrite, [ ], AC_MSG_ERROR([your bzlib is not shared]))

  PHP_NEW_EXTENSION(bsdiff, bsdiff.c, $ext_shared)
fi
