# 2026-05-22 04:15:04 by RouterOS 7.22.1
# system id = 7+baTThKn+L
#
/interface ethernet
set [ find default-name=ether1 ] comment="Link to Cabang1-Abby" \
    disable-running-check=no
set [ find default-name=ether2 ] comment="Link to DC-Fajar" \
    disable-running-check=no
set [ find default-name=ether3 ] comment="Link to Cabang2-Alvian" \
    disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/routing ospf instance
add disabled=no name=ospf-nusantara router-id=1.1.1.1
/routing ospf area
add disabled=no instance=ospf-nusantara name=area-backbone
/ip address
add address=20.20.20.1/30 interface=ether1 network=20.20.20.0
add address=172.16.1.1/30 interface=ether2 network=172.16.1.0
add address=147.45.2.1/30 interface=ether3 network=147.45.2.0
/ip dhcp-client
add interface=ether1 name=client1
/ip route
add disabled=yes dst-address=192.168.20.0/27 gateway=20.20.20.2
add disabled=yes dst-address=192.168.30.0/27 gateway=172.16.1.2
add disabled=yes dst-address=192.168.10.0/27 gateway=147.45.2.2
/routing ospf interface-template
add area=area-backbone disabled=no interfaces=ether1
add area=area-backbone disabled=no interfaces=ether2
add area=area-backbone disabled=no interfaces=ether3
/system identity
set name=HQ-Fajar
