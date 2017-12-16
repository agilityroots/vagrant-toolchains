include apt
# install common tools
class tools {
  $binaries = [ "colordiff",
                "vim",
                "emacs",
                "git",
                "jq",
                "unzip",
                "zip"
              ]

  # always update
  class { 'apt':
      update => {
        frequency => 'always'
      }
  }
  $binaries.each |String $binary| {
    package { "${binary}":
      ensure => 'latest'
    }
  }
}
