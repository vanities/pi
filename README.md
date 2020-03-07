# pi
just pi things... this repo composes many pi services together for easy deployments.


## Goals
- one command deployment for all services
- security with contained networking + ssl with let's encrypt for hosted sites
- clear documentation of which ports need to be opened
- highly configurable make for service configuration


## Setup

set the environment vars

- PIHOLE_WEB_PASSWORD
- PIHOLE_TIMEZONE


## Components

### Main

- pihole - network-level advertisement and internet tracker blocking application which acts as a DNS sinkhole, can also be used as a DHCP server
- unbound - validating, recursive, and caching DNS resolver 
- wireguard - protocol that implements virtual private network (VPN) techniques to create secure point-to-point connections

### Security

- ufw - managing a netfilter firewall designed to be easy to use
- fail2ban- intrusion prevention software framework that protects computer servers from brute-force attacks
