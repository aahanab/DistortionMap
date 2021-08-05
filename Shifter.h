//Shifter code
class Shifter {
public:
  Shifter(TString truthfilename, TString correctionfilename);
  TVector3 Shift(TVector3 position);
  TVector3 ShiftForward(TVector3 position); //only shift with forward histogram
  TVector3 ShiftBack(TVector3 position); //
  TFile *forward, *back, *average;
  bool hasTruth, hasCorrection;
  TH3F *hX, *hY, *hZ, *hR, *hPhi, *hXave, *hYave, *hZave, *hRave, *hPhiave, *hXBack, *hYBack, *hZBack;  
};

