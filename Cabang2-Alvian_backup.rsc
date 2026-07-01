# 2026-05-22 08:31:48 by RouterOS 7.22.1
# system id = gCgDCeieuKB
#
/interface ethernet
set [ find default-name=ether1 ] comment="Link to HQ-Fajar" \
    disable-running-check=no
set [ find default-name=ether2 ] comment="LAN PC Staff (Cabang1-Alvian)" \
    disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
/interface vlan
add interface=ether2 name=vlan10-staff vlan-id=10
add interface=ether2 name=vlan20-guest vlan-id=20
/routing ospf instance
add disabled=no name=ospf-nusantara router-id=4.4.4.4
/routing ospf area
add disabled=no instance=ospf-nusantara name=area-backbone
/ip address
add address=147.45.2.2/30 interface=ether1 network=147.45.2.0
add address=192.168.27.1/27 interface=vlan10-staff network=192.168.27.0
add address=192.168.86.65/27 interface=vlan20-guest network=192.168.86.64
add address=190.123.90.2 interface=ether4 network=190.123.90.2
add address=180.123.80.2 interface=ether3 network=180.123.80.2
/ip dhcp-client
add interface=ether1 name=client1
/ip route
add disabled=yes dst-address=0.0.0.0/0 gateway=147.45.2.1
/routing ospf interface-template
add area=area-backbone disabled=no interfaces=ether1
add area=area-backbone disabled=no interfaces=vlan10-staff
add area=area-backbone disabled=no interfaces=vlan20-guest
add area=area-backbone interfaces=ether3,ether4
/system identity
set name=Cabang2-Alvian
