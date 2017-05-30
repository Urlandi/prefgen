#!/usr/local/bin/tclsh8.5

proc getprefix ases {
    set ases [split $ases]
    foreach as $ases {
	if {[regexp {^AS\d{1,10}$} $as]} then {
		catch {
			puts [exec {whois} {-h} {whois.ripe.net} {--} "-r -K -T route -i origin $as" | {grep} {-i} {route:} | {grep} {-oi} {[0-9].*$}]
		}
	} elseif {[regexp {^(AS-.*)|(AS\d{1,10}\:AS-.*)$} $as]} {
		catch {
			set assets [exec {whois} {-h} {whois.ripe.net} {--} "-r -K -T as-set $as" | {grep} {-i} {members:} | {grep} {-oi} {AS.*$}]
                        getprefix $assets
		}
        }
    }
}



while {true} {
    set ases [gets stdin]
    if {[eof stdin]} then { break }
    getprefix $ases
}

