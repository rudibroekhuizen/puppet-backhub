# backhub

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with backhub](#setup)
    * [What backhub affects](#what-backhub-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with backhub](#beginning-with-backhub)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Collect data from devices that cannot run a backup client, like switches, routers, firewall, ASA's, UPS's, PDU's. Tested on Ubuntu 14.04 with Puppet 3.7.4.

## Module Description

The main goal of this module is to pull configuration files from devices. It uses ssh keys and scp to do that. Create a keypair and upload the public key to your device. Use hiera of the Foreman to set the private key parameter (id_rda). If your device doesn't support ssh keys, you can use the backhub user to push configs to your backhub server.

## Setup

### What backhub affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **OPTIONAL**

yo61/logrotate
geoffwilliams/scp

### Beginning with backhub

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
