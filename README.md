a php exteions for bsdiff : http://www.daemonology.net/bsdiff/
======

Install : 
phpize
./configure --with-php-config=/usr/bin/php-config
make
make install

Example:
<?php

$bsdiff = new bsdiff();
$bsdiff->diff($old_file, $new_file, $diff_file);
