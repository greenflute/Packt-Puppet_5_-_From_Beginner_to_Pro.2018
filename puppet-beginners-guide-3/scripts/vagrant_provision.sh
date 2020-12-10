#!/bin/bash
source /etc/lsb-release

# wget can not deal with cname redirection from puppetlabs.com to puppet.com
echo "13.224.194.104 apt.puppetlabs.com" >> /etc/hosts
wget https://apt.puppetlabs.com/puppet-release-${DISTRIB_CODENAME}.deb

dpkg -i puppet-release-${DISTRIB_CODENAME}.deb
apt-get update
apt-get -y install git puppet-agent
echo 'Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin"' >/etc/sudoers.d/puppet

# deprecation of gem install options
# /opt/puppetlabs/puppet/bin/gem install gpgme --no-rdoc --no-ri
# /opt/puppetlabs/puppet/bin/gem install hiera-eyaml-gpg --no-rdoc --no-ri
# /opt/puppetlabs/puppet/bin/gem install r10k --no-rdoc --no-ri

/opt/puppetlabs/puppet/bin/gem install gpgme
/opt/puppetlabs/puppet/bin/gem install hiera-eyaml-gpg
/opt/puppetlabs/puppet/bin/gem install r10k
