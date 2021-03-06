#!/bin/bash
PUPPET_REPO=$1
BRANCH=$2
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 PUPPET_REPO BRANCH"
  echo "Called with: $*"
  exit 1
fi
rpm -Uvh https://yum.puppetlabs.com/puppet/puppet-release-el-7.noarch.rpm
yum install -y git puppet-agent
cd /etc/puppetlabs/code/environments
mv production production.orig
git clone ${PUPPET_REPO} production
cd production
git checkout ${BRANCH}
/opt/puppetlabs/puppet/bin/gem install r10k --no-rdoc --no-ri
/opt/puppetlabs/puppet/bin/r10k puppetfile install --verbose
/opt/puppetlabs/bin/puppet apply --environment=production /etc/puppetlabs/code/environments/production/manifests/
