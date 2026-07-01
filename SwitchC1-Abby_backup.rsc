# 2026-05-22 06:30:44 by RouterOS 7.22.1
# system id = YSGhxkQGLrF
#
/interface bridge
add name=br-vlan vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface bridge port
add bridge=br-vlan interface=ether1
add bridge=br-vlan interface=ether2 pvid=10
add bridge=br-vlan interface=ether3 pvid=20
/interface bridge vlan
add bridge=br-vlan tagged=ether1 untagged=ether2 vlan-ids=10
add bridge=br-vlan tagged=ether1 untagged=ether3 vlan-ids=20
/ip dhcp-client
# DHCP client can not run on slave or passthrough interface!
add interface=ether1 name=client1
