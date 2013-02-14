# vim: set softtabstop=2 shiftwidth=2 expandtab filetype=ruby :
# Class: kisscool
#
#   Configuration for my home
#
#   KissCool
#   2013
#
# Parameters:
#
# Actions:
#
#  Just put my favorite files in place
#
# Requires:
#
# Sample Usage:
#
#   class { "kisscool"}
#
# [Remember: No empty lines between comments and class definition]
class kisscool(
  $username='kisscool'
) {

  # standard check
  case $::kernel {
    Linux: {
      $supported = true
      $shell = '/bin/bash'
    }
    FreeBSD: {
      $supported = true
      $shell = '/usr/local/bin/bash'
    }
    default: {
      $supported = false
      notify { "${module_name}_unsupported":
        message => "The ${module_name} module is not supported on ${::operatingsystem}",
      }
    }
  }

  # actual configuration code
  if ($supported == true) {

    file { "/home/${name}/plop":
      ensure  => directory,
      owner   => $username,
      mode    => 755,
      recurse => remote,
      purge   => false,
      source  => "puppet:///modules/kisscool/dotfiles/",
      #require => User[$name],
    }
    # pour multi-users :
    # source => [ "puppet://$servername/modules/$name/", "puppet://$servername/modules/skel/" ],
    # sourceselect => all,
  }
}
