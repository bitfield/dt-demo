# Send reports to PuppetDB
class profile::puppetdb_reports {
  ensure_packages('puppetdb-termini')

  file { '/etc/puppetlabs/puppet/puppet.conf':
    source => 'puppet:///modules/profile/puppet.conf',
  }

  file { '/etc/puppetlabs/puppet/puppetdb.conf':
    source => 'puppet:///modules/profile/puppetdb.conf',
  }
}
