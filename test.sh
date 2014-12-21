gem install diff-lcs erubis hashie highline \
  ipaddress json mime-types mixlib-authentication \
  mixlib-cli mixlib-config mixlib-log mixlib-shellout \
  net-ssh net-ssh-gateway net-ssh-multi rack \
  rest-client sigar systemu yajl;
sudo apt-get install vim lynx curl git mutt;

# Special files, see http://flurdy.com/docs/postfix/:

sudo apt-get install shorewall shorewall-doc courier-base courier-authdaemon courier-authlib-mysql \
			courier-imap courier-imap-ssl courier-ssl amavisd-new spamc postgrey \
			libsasl2-modules libsasl2-modules-sql libgsasl7 \ 
			libauthen-sasl-cyrus-perl sasl2-bin libpam-mysql \
			roundcube roundcube-mysql roundcube-plugins