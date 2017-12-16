include apt
class jenkins {

  # https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu
  # add jenkins key
  exec { 'jenkins-key':
    command => '/usr/bin/wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -'
  }
  exec { 'jenkins.list':
    command => '/bin/echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list',
    require => Exec['jenkins-key'],
    before => Exec['apt_update']
  }
  package { 'jenkins':
    ensure => 'latest',
    require  => Exec['apt_update'],
  }
  file {'/etc/default/jenkins':
    ensure => file,
    content => template('jenkins/jenkins_defaults'),
    mode => '0644',
    owner => 'root',
    group => 'root',
    require => Package['jenkins'],
    notify => Service['jenkins']
  }
  service { 'jenkins':
    ensure => 'running'
  }
}
