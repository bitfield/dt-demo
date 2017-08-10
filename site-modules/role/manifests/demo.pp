# Be the demo node
class role::demo {
  include docker

  file { [
    '/var/docker',
    '/var/docker/dora',
  ]:
    ensure => directory,
  }

  file { '/var/docker/dora/greeting':
    content => lookup('greeting', String),
    notify  => Docker::Run['dora'],
  }

  docker::run { 'dora':
    image   => 'bitfield/dora',
    volumes => '/var/docker/dora/greeting:/etc/config/greeting',
    ports   => ['9090:9090'],
  }
}
