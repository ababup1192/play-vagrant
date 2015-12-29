# Remove files

# Install packges
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
apt-get update && apt-get install -y software-properties-common
add-apt-repository ppa:git-core/ppa && add-apt-repository ppa:pi-rho/dev
apt-get update && apt-get install -y openssh-server zsh vim git curl autoconf tar wget \
    zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev \
    sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev \
    software-properties-common postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 \
    postgresql-server-dev-9.4 libpq-dev python-software-properties \
    libffi-dev tmux python-software-properties

# Change shell to zsh
chsh -s /bin/zsh vagrant

su - vagrant -c "curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug"

su - vagrant -c "git clone https://github.com/ababup1192/dotfiles.git /tmp/dotfiles && \
                  cp -r /tmp/dotfiles/.??* /home/vagrant"
rm -rf /var/tmp/dotfiles

# Install vim-plug
su - vagrant -c "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# Install heroku
su - vagrant -c "wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh"

# Install Java8
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

# postgresql
su - postgres -c "/etc/init.d/postgresql start &&\
        psql --command \"CREATE USER vagrant WITH SUPERUSER PASSWORD 'vagrant';\" &&\
            createdb -O vagrant vagrant"
echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf
echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf


