Description
===========

Many Chef cookbooks attempt to manage Name Service Switch source databases. However, 
when multiple cookbooks modify the sources independently, unintentional results 
will happen. This cookbook attempt to solve this problem by providing a Chef LWRP
provider that add the sources into nsswitch.conf in order. As long as the cookbooks
uses this provider instead of modifying the nsswitch.conf file directly.

The default nsswitch.conf attributes will lookup all databases using "files."

Thanks to Josh Toft [1] for providing all the codes and design pattern for the
provider.

[1] https://github.com/seryl 

Requirements
============

No other cookbooks needed.

Attributes
==========

    node.default[:nsswitch] = {
      :passwd => ["files"],
      :group => ["files"],
      :shadow => ["files"],
      :hosts => ["files", "dns"],
      :networks => ["files"],
      :protocols => ["db","files"],
      :services => ["db","files"],
      :ethers => ["db","files"],
      :rpc => ["db","files"],
      :netgroup => ["nis"]
    }

Usage
=====

To add an extra service to each of the database, use:

    nsswitch_source(:passwd) { param "ldap"}
    nsswitch_source(:group) { param "ldap"}
    nsswitch_source(:hosts) { param "ldap"}
    nsswitch_source(:networks) { param "ldap"}

Which will produce the nsswitch.conf file as follow:
#nsswitch.conf

    passwd:  files ldap
    group:  files ldap
    hosts:  files dns ldap
    networks:  files ldap
