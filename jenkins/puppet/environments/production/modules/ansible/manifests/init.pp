include apt
class ansible {
  package { 'software-properties-common':
    ensure => installed,
    before => Package['ansible']
  }
  apt::ppa {'ppa:ansible/ansible':
    require => Package['software-properties-common'],
    before => Exec['apt_update']
  }
  package { 'ansible':
    ensure => "latest",
    require => Exec['apt_update']
  }
}
