#!/usr/local/bin/tclsh8.5

proc getas ases {
    set ases [split $ases]
    foreach as $ases {
	if {[regexp {^AS\d{1,10}$} $as]} then {
 	    puts $as
	} elseif {[regexp {^(AS-.*)|(AS\d{1,10}\:AS-.*)$} $as]} {
		catch {
			set assets [exec {whois} {-h} {whois.ripe.net} {--} "-r -K -T as-set $as" | {grep} {-i} {members:} | {grep} {-oi} {AS.*$}]
                        getas $assets
		}
        }
    }
}



while {true} {
    set ases [gets stdin]
    if {[eof stdin]} then { break }
    getas $ases
}

