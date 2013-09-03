#!/usr/bin/env bash
yum groupinstall -y "Development Tools"
yum install -y kernel-devel kernel-headers gcc libxml2 libxml2-devel zlib-devel opensp-devel perl-CPAN

mkdir -p ~/src
cd ~/src
wget http://github.com/downloads/petdance/tidyp/tidyp-1.04.tar.gz
tar -xzf tidyp-1.04.tar.gz
cd tidyp-1.04
./configure
make
make install
ldconfig

yes | perl -MCPAN -e "install Config::General"
yes | perl -MCPAN -e "install Bundle::W3C::Validator"

cd ~/src
wget http://validator.w3.org/validator.tar.gz http://validator.w3.org/sgml-lib.tar.gz
tar -xzf validator.tar.gz
tar -xzf sgml-lib.tar.gz

mkdir -p /usr/local/validator
mv validator-1.3/httpd/cgi-bin /usr/local/validator
mv validator-1.3/{htdocs,share,httpd} /usr/local/validator
mv validator-1.1/htdocs/sgml-lib /usr/local/validator/htdocs/

mkdir -p /etc/w3c
cp /usr/local/validator/htdocs/config/* /etc/w3c/

