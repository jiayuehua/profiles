yum install gcc make bison flex rpm-build.x85_64
yum install openldap-devel.x86_64 pam-devel.x86_64 openssl-devel.x86_64 libgssapi-devel.x86_64 libgssapi-devel.x86_64
wget -c http://www.inet.no/dante/files/dante-1.4.0-pre1.tar.gz
tar zxf dante-1.4.0-pre1.tar.gz
#cd dante-1.4.0-pre1/
#./configure 
#make 
#make install

rpmbuild -ta dante-1.4.0-pre1.tar.gz
cd ~/rpmbuild/RPMS/x86_64/
sudo rpm -ivh dante-1.4.0-0.pre1.el6.x86_64.rpm
