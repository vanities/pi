# Terraria

## Vanilla Server

### Info

#### Port Exposure
Exposes port 7777 

#### RAM limitations
as of 17 MAY 2020, Terraria's 1.4 patch pushed the limit on my Raspberry Pi 3B with the RAM. Large Maps consitently exceed 1 GB and would shut my pi off, I had to add new swap to get it to run. I would not recommend this, I bought a Pi4 w/ 4Gb RAM and this should fix the issue. It runs fine on swap, just not good for the health of the SD card.

### Install

Install is easy, just run the makefile task

`$ make install_terraria`

### Thanks/References

- https://www.linode.com/docs/game-servers/host-a-terraria-server-on-your-linode/
