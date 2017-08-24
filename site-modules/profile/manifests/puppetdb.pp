# PuppetDB
class profile::puppetdb {
  file { '/etc/ssl/certs/puppetdb.crt':
    source => 'puppet:///modules/profile/puppetdb.crt',
  }

  file { '/etc/ssl/certs/puppetdb.key':
    source => 'puppet:///modules/profile/puppetdb.key',
  }

  include ::puppetdb
}
