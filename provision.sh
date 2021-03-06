sudo apt-get update && sudo apt-get upgrade

sudo apt-get -y install make gcc git python-dev python-pip libssl-dev build-essential zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl supervisor

curl http://nginx.org/keys/nginx_signing.key | sudo apt-key add -

VCNAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2` && sudo -E sh -c "echo \"deb http://nginx.org/packages/ubuntu/ $VCNAME nginx\" >> /etc/apt/sources.list"
VCNAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2` && sudo -E sh -c "echo \"deb-src http://nginx.org/packages/ubuntu/ $VCNAME nginx\" >> /etc/apt/sources.list"

sudo apt-get update

sudo apt-get -y install nginx

git clone git://github.com/yyuu/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT=$HOME/.pyenv' >> ~/.bash_profile
echo 'export PATH=$PYENV_ROOT/bin:$PATH' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

source ~/.bash_profile

pyenv install 3.5.3
pyenv global 3.5.3

pip install flask uwsgi tensorflow

sudo rm /etc/nginx/conf.d/default.conf

sudo mv ~/nginx.conf /etc/nginx/conf.d/
sudo mv ~/supervisor.conf /etc/supervisor/conf.d/

sudo mkdir /var/www
sudo chown -R vagrant:vagrant /var/www

cd /var/www
git clone https://ryosuke1217:kuuta326@github.com/ryosuke1217/web_app_uwsgi.git
