# gem install diff-lcs erubis hashie highline \
#   ipaddress json mime-types mixlib-authentication \
#   mixlib-cli mixlib-config mixlib-log mixlib-shellout \
#   net-ssh net-ssh-gateway net-ssh-multi rack \
#   rest-client sigar systemu yajl;

# Special files, see http://flurdy.com/docs/postfix/:
# http://blogging.dragon.org.uk/installing-a-mailserver-on-ubuntu-14-04-lts-part-2/

# sudo apt-get build-dep apache2-dev 
# sudo apt-get build-dep php5
# sudo apt-get build-dep mysql-5.6
# sudo apt-get install mysql-server-5.6 mysql-client-core-5.6 mysql-client-5.6


sudo apt-get install php5-dbg php5-dev php5-gd php5-gmp php5-json php5-odbc php5-readline php5-sqlite php5-xmlrp
c php5-xsl php5-intl php5-mysqlnd php5-memcached php5-mcrypt php5-mongo php5-my
sqlnd-ms php5-oauth php5-redis php5-svn php5-xdebug php5-xhprof

sudo apt-get install shorewall shorewall-doc courier-base courier-authdaemon courier-authlib-mysql \
			courier-imap courier-imap-ssl courier-ssl amavisd-new spamc postgrey \
			libsasl2-modules libsasl2-modules-sql libgsasl7 \ 
			libauthen-sasl-cyrus-perl sasl2-bin libpam-mysql \
			roundcube roundcube-mysql roundcube-plugins \
			pyzor razor unrar-free zoo nomarch ripole rpm2cpio lhasa \ 
			apache2-doc apache2-suexec-pristine apache2-suexec-custom apache2-utils \
            openssl-blacklist;

sudo apt-get install vim lynx curl git mutt;

sudo apt-get install libxml2-dev libpcre3-dev libbz2-dev \
libcurl4-openssl-dev libjpeg-dev libpng12-dev libxpm-dev libfreetype6-dev libmysqlclient-dev \
libt1-dev libgd2-xpm-dev libgmp-dev libsasl2-dev libmhash-dev unixodbc-dev \
freetds-dev libpspell-dev libsnmp-dev libtidy-dev libxslt1-dev libmcrypt-dev apache2-dev;

sudo apt-get install libreadline-dev libdb++-dev libdb-sql-dev libdb-dev libgdbm-dev ; 

sudo apt-get install cl-ppcre clisp-module-pcre gambas3-gb-pcre haskell-pcre-light-doc \
libghc-pcre-light-dev libghc-pcre-light-doc libghc-pcre-light-prof libghc-regex-pcre-dev \
libghc-regex-pcre-doc libghc-regex-pcre-prof libpcre++-dev libpcre++0 libpcre-ocaml \
libpcre-ocaml-dev libpcre3 libpcre3-dbg libpcre3-dev libpcrecpp0 \
lua-rex-pcre lua-rex-pcre-dev pcregrep pike7.8-pcre postfix-pcre sqlite3-pcre libgmp-dev libgmp3-dev;
#libpcre3-udeb

sudo apt-get install autoconf automake libtool re2c flex make libxml2-dev libbz2-dev;
sudo apt-get install libdb5.1-dev libjpeg-dev libpng-dev libXpm-dev libfreetype6-dev libt1-dev libgmp3-dev libc-client-dev libldap2-dev; 
libmhash-dev freetds-dev libz-dev libmysqlclient15-dev ncurses-dev libpcre3-dev unixODBC-dev libsqlite-dev \
libaspell-dev libreadline6-dev librecode-dev libsnmp-dev libtidy-dev libxslt-dev openssl libssl-dev libxml2 \
libpspell-dev libicu-dev libxml2 libxml2-dev libssl-dev pkg-config curl libcurl4-nss-dev enchant libenchant-dev \ 
libjpeg8 libjpeg8-dev libpng12-0 libpng12-dev libvpx1 libvpx-dev libfreetype6 libt1-5 libt1-dev libgmp10 \
libgmp-dev libicu-dev mcrypt libmcrypt4 libmcrypt-dev libpspell-dev libedit2 libedit-dev libxslt1.1 libxslt1-dev

wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.36.tar.gz

./configure --prefix=/usr                     \
            --docdir=/usr/share/doc/pcre-8.36 \
            --enable-unicode-properties       \
            --enable-pcre16                   \
            --enable-pcre32                   \
            --enable-pcregrep-libz            \
            --enable-pcregrep-libbz2          \
            --enable-pcretest-libreadline     \
            --disable-static                 &&
make

make check;

sudo make install                     &&
sudo mv -v /usr/lib/libpcre.so.* /lib &&
sudo ln -sfv ../../lib/$(readlink /usr/lib/libpcre.so) /usr/lib/libpcre.so

# For php to find the correct binaries.
sudo ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h;
sudo ln -s /usr/lib/x86_64-linux-gnu/libpcre.a /usr/lib/libpcre.a;

wget http://us2.php.net/distributions/php-5.6.4.tar.gz

#http://anduin.linuxfromscratch.org/files/BLFS/svn/php_configure.txt

# sudo ln -s /usr/include /opt/include
# sudo ln -s /usr/lib64 /opt/lib

#https://www.virgohacks.net/install-apache-2-4-mysql-5-6-php-5-5-source-ubuntu-14-04/

./configure --prefix=/usr                    \
            --sysconfdir=/etc                \
            --with-apxs2                     \
            --with-config-file-path=/etc     \
            --with-openssl                   \
            --with-kerberos                  \
            --with-pcre-regex=/usr/lib       \
            --with-zlib                      \
            --enable-bcmath                  \
            --with-bz2                       \
            --enable-calendar                \
            --with-curl                      \
            --enable-dba=shared              \
            --with-gdbm                      \
            --enable-exif                    \
            --enable-ftp                     \
            --with-openssl-dir=/usr          \
            --with-gd=/usr                   \
            --with-jpeg-dir=/usr             \
            --with-png-dir=/usr              \
            --with-zlib-dir=/usr             \
            --with-xpm-dir=/usr/X11R6/lib    \
            --with-freetype-dir=/usr         \
            --with-t1lib                     \
            --with-gettext                   \
            --with-gmp                       \
            --with-ldap                      \
            --with-ldap-sasl                 \
            --enable-mbstring                \
            --with-mysql                     \
            --with-mysqli=mysqlnd            \
            --with-mysql-sock=/var/run/mysql \
            --with-unixODBC=/usr             \
            --with-libdir=lib64              \
            --with-pdo-mysql                 \
            --with-pdo-odbc=unixODBC,/usr    \
            --with-pdo-pgsql                 \
            --with-pdo-sqlite                \
            --with-pgsql                     \
            --with-pspell                    \
            --with-readline                  \
            --with-snmp                      \
            --enable-sockets                 \
            --with-tidy                      \
            --with-xsl                       \
            --with-iconv;