[fwBasic]
status = enabled
incoming = deny
outgoing = allow
routed = disabled

[Rule0]
ufw_rule = 63095 ALLOW IN Anywhere
description = qbittorent
command = /usr/sbin/ufw allow in from any to any port 63095
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 63095
iface = 
routed = 
logging = 

[Rule1]
ufw_rule = 63095 ALLOW OUT Anywhere (out)
description = qbittorent
command = /usr/sbin/ufw allow out from any to any port 63095
policy = allow
direction = out
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 63095
iface = 
routed = 
logging = 

