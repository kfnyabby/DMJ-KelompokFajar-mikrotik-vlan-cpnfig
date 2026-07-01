# 2026-05-22 08:25:05 by RouterOS 7.22.1
# system id = CsLcfMD3xMJ
#
/interface ethernet
set [ find default-name=ether1 ] comment="Link to HQ-Fajar" \
    disable-running-check=no
set [ find default-name=ether2 ] comment="LAN server" disable-running-check=\
    no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
/routing ospf instance
add disabled=no name=ospf-nusantara router-id=2.2.2.2
/routing ospf area
add disabled=no instance=ospf-nusantara name=area-backbone
/ip address
add address=172.16.1.2/30 interface=ether1 network=172.16.1.0
add address=192.168.30.1/27 interface=ether2 network=192.168.30.0
add address=170.123.70.1 interface=ether3 network=170.123.70.1
add address=190.123.90.1 interface=ether4 network=190.123.90.1
/ip dhcp-client
add interface=ether1 name=client1
/ip route
add dst-address=0.0.0.0/0 gateway=172.16.1.1
/routing ospf interface-template
add area=area-backbone disabled=no interfaces=ether1
add area=area-backbone disabled=no interfaces=ether2
add area=area-backbone interfaces=ether3,ether4
/system identity
set name=DC-Fajar
