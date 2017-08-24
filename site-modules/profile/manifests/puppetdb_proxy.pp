# Proxy SSL to PuppetDB
class profile::puppetdb_proxy {
  include ::nginx

  nginx::resource::server { 'wapvopsdbsp01.prod.saasapm.com':
    ssl_port    => 8081,
    proxy       => 'http://localhost:8080',
    ssl         => true,
    ssl_cert    => '/etc/ssl/certs/puppetdb.crt',
    ssl_key     => '/etc/ssl/certs/puppetdb.key',
  }
}
