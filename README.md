Kc-Manifests
============

Personal Puppet manifests

Quick run
---------

Just do the following :

	$ puppet apply --modulepath=/home/kisscool/kc-manifests/ -e "include kisscool"

or

	$ puppet apply --modulepath=/home/othername/kc-manifests/ -e "class {'kisscool': username => 'othername'}"

do not forget to add --noop if you just want to test.
