# Configure a sensible version of Vim
class profile::vim {
  require epel

  ensure_packages(['ack', 'vim-enhanced'])

  file { '/bin/vi':
    ensure => link,
    target => '/bin/vim',
  }

  file { '/usr/share/vim/vimfiles/autoload/pathogen.vim':
    source => 'puppet:///modules/profile/pathogen.vim',
  }

  file { '/usr/share/vim/vimfiles/bundle':
    ensure => directory,
  }

  exec { '/usr/bin/git clone https://github.com/rodjek/vim-puppet.git vim-puppet':
    cwd     => '/usr/share/vim/vimfiles/bundle',
    creates => '/usr/share/vim/vimfiles/bundle/vim-puppet',
  }

  file { '/etc/vimrc':
    source => 'puppet:///modules/profile/vimrc',
  }

  vcsrepo { '/usr/share/vim/vimfiles/bundle/ctrlp.vim':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/ctrlpvim/ctrlp.vim.git',
  }

  vcsrepo { '/usr/share/vim/vimfiles/bundle/ack.vim':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/mileszs/ack.vim.git',
  }

  vcsrepo { '/usr/share/vim/vimfiles/bundle/nerdtree':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/scrooloose/nerdtree.git',
  }
}
