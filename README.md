a php exteions for bsdiff
======

Install:
======

    phpize 
    ./configure --with-php-config=/usr/bin/php-config 
    make  
    make install 

Example:
======

    <?php
    ini_set('memory_limit', '700M');
    set_time_limit(0);
    error_reporting(E_ALL);
    
    if (bsdiff_diff("old.apk", "new.apk", "apk.patch")) {
            echo "bdiff success.\n";
    } else {
            echo "bdiff faild.\n";
    }
    
    if (bsdiff_patch("old.apk", "apk.patch", "a.new.apk")) {
            echo "bpatch success.\n";
    } else {
            echo "bpatch faild.\n";
    }
    ?>
======
http://www.daemonology.net/bsdiff/ 
