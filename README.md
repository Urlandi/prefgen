### Make prefix list from RIPE route objects

- ckpr.tcl - make prefix list from ASnum or AS-SET
- ckas.tcl - expand AS-SET to ASnum list

All incoming data are reading from stdin. Result is fetching from RIPE DB route objects by origin field. Needing the <b>whois</b> utility.

For aggregate prefixes may use an utility in [bgptablehole](https://github.com/Urlandi/bgptablehole)

For example:

 - <i>echo AS64500 | tclsh ckpr.pl</i> - will return all prefixes from RIPE DB route objects where is origin fields match AS65500
 - <i>echo AS-64500 | tclsh ckpr.pl</i> - will return all prefixes from RIPE DB route objects where is origin fields match all ASn from AS-AS65500 as-set object
 - <i>echo AS-64500 | tclsh ckas.pl</i> - will return all ASn from AS-AS65500 as-set object
 - <i>echo AS64500 | tclsh ckpr.pl | sort -gst. -k1,1 -k2,2 -k3,3 -k4,4 | python [ipv4full.py](https://github.com/Urlandi/bgptablehole/blob/master/ipv4full.py) -sgpd</i> - will return all AGGREGATED prefixes from RIPE DB route objects where is origin fields match AS65500
