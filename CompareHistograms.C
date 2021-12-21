void CompareHistograms () {
TFile *file1=TFile::Open("/sphenix/user/abrahma/Files_withshifterdec6/avg_ADCBins_NoW_hist_G4Hits_sHijing_0-12fm_bX7540028.0_042000_043000.root","READ");
TFile *file2=TFile::Open("/sphenix/user/abrahma/Files/avg_ADCBins_NoW_hist_G4Hits_sHijing_0-12fm_bX7540028.0_042000_043000.root","READ");  
TH3F *hist1=(TH3F*)(file1->Get("_h_SC_ibf_8")); 
TH3F *hist2=(TH3F*)(file2->Get("_h_SC_ibf_8"));
  
TH3F *hist3=(TH3F*)hist1->Clone("difference"); //make a new histogram that is a copy of hist1, give it a new name
hist3->Add(hist2,-1); //subtract hist2 from this histogram by 'adding' hist2 multiplied by -1.

TH3F *hist4=(TH3F*)hist1->Clone("divide"); //make a new histogram that is a copy of hist1, give it a new name
hist4->Divide(hist2); //divide each bin in the histogram by the same bin from hist2.
  
  
TCanvas * c= new TCanvas("c","title bar", 1000, 600);

c->Divide(3,1);

c->cd(1);
hist3->Project3D("x")->Draw("hist");
  
c->cd(2);
hist4->Project3D("x")->Draw("hist");
  
c->cd(3);
hist1->Project3D("x")->Draw("hist");
hist2->SetLineColor(kRed);
hist2->Project3D("x2")->Draw("hist,same"); 
  
  
  }
