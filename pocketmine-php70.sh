/pocketmine/bin/php7/bin/php -v > /dev/null
if [ $? -ne 0 ];then
    echo "install pocketmine-php70"
    rm -rf /pocketmine
    sudo mkdir /pocketmine
    wget https://github.com/gouchaoer/pocketmine-php70/raw/master/pocketmine-php70-64.tar.gz -P /pocketmine
    tar -zxvf /pocketmine/pocketmine-php70-64.tar.gz -C /pocketmine/
    libltdl=`/pocketmine/bin/php7/bin/php -v |grep "libltdl"`
    if [ -z "$libltdl" ];then
        lsb=`lsb_release -i |grep "CentOS"`
        if [ -z "$lsb" ];then
             echo "install libltdl"
             yum -y install libtool-ltdl
         else
             echo "please install libltdl, exit"
             exit
         fi
    fi
fi

/pocketmine/bin/php7/bin/php -v > /dev/null
if [ $? -ne 0 ];then
    echo "install pocketmine-php70 failed, exit"
    exit
fi

#php script
/pocketmine/bin/php7/bin/php<<'PHPSCRIPT'
<?php
//echo $j;
$o=null;
$r=null;
exec("ls -alh", $o, $r);
var_dump($o);var_dump($r);
PHPSCRIPT
