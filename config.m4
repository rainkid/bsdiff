dnl $Id$
dnl config.m4 for extension bsdiff

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

PHP_ARG_WITH(bsdiff, for bsdiff support,
[  --with-bsdiff             Include bsdiff support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(bsdiff, whether to enable bsdiff support,
[  --enable-bsdiff           Enable bsdiff support])

if test "$PHP_BSDIFF" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-bsdiff -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/bsdiff.h"  # you most likely want to change this
  dnl if test -r $PHP_BSDIFF/$SEARCH_FOR; then # path given as parameter
  dnl   BSDIFF_DIR=$PHP_BSDIFF
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for bsdiff files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       BSDIFF_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$BSDIFF_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the bsdiff distribution])
  dnl fi

  dnl # --with-bsdiff -> add include path
  dnl PHP_ADD_INCLUDE($BSDIFF_DIR/include)

  dnl # --with-bsdiff -> check for lib and symbol presence
  dnl LIBNAME=bsdiff # you may want to change this
  dnl LIBSYMBOL=bsdiff # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $BSDIFF_DIR/lib, BSDIFF_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_BSDIFFLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong bsdiff lib version or lib not found])
  dnl ],[
  dnl   -L$BSDIFF_DIR/lib -lm
  dnl ])
  dnl
  dnl PHP_SUBST(BSDIFF_SHARED_LIBADD)

  PHP_NEW_EXTENSION(bsdiff, bsdiff.c, $ext_shared)
fi
