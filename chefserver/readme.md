# Chef Server and Windows Node

This directory contains the Vagrant-based recipe for a Chef Server and Windows node hosted on Azure.

This recipe demonstrates several things

* Multiplatform, Multimachine `Vagrantfiles`.
* Vagrant on Azure. 


## Prerequisites

### Azure

* Install the `vagrant-azure` plugin.
* Get a valid Azure account.
* Create an Active Directory application first as described in the [documentation](https://github.com/Azure/vagrant-azure#create-an-azure-active-directory-aad-application) for `vagrant-azure`.

### Ansible

* Run this on a host machine with Linux and Ansible.
* Also since you are working with windows, make sure you install `pywinrm` with `pip install pywinrm`.

### Troubleshooting WinRM

Ansible provisioning might fail with 

```
fatal: [winnode01]: UNREACHABLE! => {
    "changed": false, 
    "msg": "ssl: HTTPSConnectionPool(host='winnode01.westus.cloudapp.azure.com', port=5986): Max retries exceeded with url: /wsman (Caused by SSLError(SSLError(\"bad handshake: Error([('SSL routines', 'tls_process_server_certificate', 'certificate verify failed')],)\",),))", 
    "unreachable": true
}

```

_How do you test your WinRM connection from a Linux host?_

[reference](http://www.tomsitpro.com/articles/setup-linux-to-query-windows-winrm-hosts,1-3468.html)

```
$ python

>>> import winrm
>>> session = winrm.Session('winnode01.westus.cloudapp.azure.com',auth=('azureuser','Password'))
>>> session.run_ps("hostname")


```

The possible cause could be that your `pywinrm` version is too recent - [reference](https://github.com/ansible/ansible/issues/34378).


## References

1. Multi-machine Vagrant - [1](https://blog.scottlowe.org/2016/01/18/multi-machine-vagrant-json/)
1. Ansible and Windows Nodes - [1](http://docs.ansible.com/ansible/latest/intro_windows.html)
1. Issues with `pywinrm` - [1](https://github.com/ansible/ansible/issues/34378)
