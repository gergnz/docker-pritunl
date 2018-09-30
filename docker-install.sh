set -ex

apt-get update -q
apt-get install -y gnupg
echo 'deb http://repo.pritunl.com/stable/apt bionic main' > /etc/apt/sources.list.d/pritunl.list

apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A

apt-get update -q
apt-get install -y locales iptables pritunl mongodb-server
locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
apt-get upgrade -y -q
apt-get dist-upgrade -y -q

apt-get clean
apt-get -y -q autoclean
apt-get -y -q autoremove
