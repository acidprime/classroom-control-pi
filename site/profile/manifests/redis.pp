class profile::redis (
$master = false,
) {
  require profile::epel

if $master {
$slaveof = 'master.puppetlabs.vm 6479'
}
else {
$slaveof = undef }

  class { 'redis':
    maxmemory => '10mb',
    bind     => $ipaddress,
    slaveof => $slaveof,
  }
  
}
