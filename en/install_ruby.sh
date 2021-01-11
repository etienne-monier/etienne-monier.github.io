CURR_DIR=`pwd` 
INSTALL_DIR="~/ruby-install-tmp"

mkdir $INSTALL_DIR
cd $INSTALL_DIR

## Install Ruby

# Install ruby-install
wget -O ruby-install-0.8.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.1.tar.gz
tar -xzvf ruby-install-0.8.1.tar.gz
cd ruby-install-0.8.1/
sudo make install
cd ..

# Install ruby
ruby-install ruby -i ~/.local/

## Install RubyGem

wget https://rubygems.org/rubygems/rubygems-3.2.4.tgz
tar -xvzf rubygems-3.2.4
cd rubygems-3.2.4
ruby setup.rb
cd ..

## Install Jeckyll and bundle

gem install jekyll bundler

# Go back to current dir
cd $CURR_DIR





