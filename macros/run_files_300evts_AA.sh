#!/usr/bin/bash
start=${1?Error: no start file \# given}
stop=${2?Error: no stop file \# given}
bX=${3?Error: no beamX \# given}
source /opt/sphenix/core/bin/sphenix_setup.sh -n
export MYINSTALL=/sphenix/u/abrahma/install
source /opt/sphenix/core/bin/setup_local.sh $MYINSTALL
 
for (( f=$start; f<$stop; f++ ));
do 
    let Xstart=f*1000 Xend=(f+1)*1000;
    A=$( printf '%06d' $Xstart )
    B=$( printf '%06d' $Xend )
    fname="/sphenix/sim/sim01/sphnxpro/Micromegas/3/G4Hits_sHijing_0-12fm_"$A"_"$B".root" ;
    foutputname="/sphenix/user/abrahma/Files/avg_ADCBins_NoW_hist_G4Hits_sHijing_0-12fm_bX"$bX"_"$A"_"$B".root" ;
    echo $fname ;
    echo $foutputname ;
    root -l -b -q ./macros/Fun4All_FillChargesMap_300evts.C\(1000,$Xstart,$bX,\"$fname\",\"$foutputname\"\)
done

echo all done
