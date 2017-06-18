# Class: harden_centos_os
# ===========================
#
# Full description of class harden_centos_os here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'harden_centos_os':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <jeff@autostructure.com>
#
# Copyright
# ---------
#
# Copyright 2017 Autostructure.
#
class harden_centos_os(
  Hash $managed_files,
  Hash $kernel_module_installs,
  Hash $managed_packages,
  Hash $aide_rules,
  Hash $sshd_configs,
) {
  Firewall {
    require => undef,
  }

  resources { 'firewall':
    purge => true,
  }

  class { '::harden_centos_os::install': }
  -> class { '::harden_centos_os::configure': }
}
