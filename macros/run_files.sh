#!/usr/bin/bash
start=${1?Error: no start file \# given}
stop=${2?Error: no stop file \# given}
source /opt/sphenix/core/bin/sphenix_setup.sh -n
export MYINSTALL=/sphenix/user/aahanab/install
source /opt/sphenix/core/bin/setup_local.sh $MYINSTALL
 
for (( f=$start; f<$stop; f++ ));
do 
    let Xstart=f*1000 Xend=(f+1)*1000;
    A=$( printf '%06d' $Xstart )
    B=$( printf '%06d' $Xend )
    fname="/sphenix/sim/sim01/sphnxpro/Micromegas/3/G4Hits_sHijing_0-12fm_"$A"_"$B".root" ;
    foutputname="/sphenix/user/aahanab/slim_G4Hits_sHijing_0-12fm_"$A"_"$B".root" ;
    echo $fname ;
    echo $foutputname ;
    root -l -b -q /sphenix/user/aahanab/DistortionMap/macros/Fun4All_SlimG4Hits.C\(1000,$Xstart,\"$fname\",\"$foutputname\"\)
done

echo all done
