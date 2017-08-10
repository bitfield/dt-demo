# Be the demo node
class role::demo {
  file { [
    '/var/docker',
    '/var/docker/dora',
  ]:
    ensure => directory,
  }

  file { '/var/docker/dora/greeting':
    content => "Hello from ${facts['hostname']}\n",
  }

  docker::run { 'dora':
    image   => 'bitfield/dora',
    volumes => '/var/docker/dora/greeting:/etc/config/greeting',
    ports   => ['9090'],
  }
}
