function Unc = ASUncertainty(ATemp, APressure, APressureAv, ASpeed, ASpeedAv, ...
    DPressure);
    %ASUncertainty computes the uncertainty in the airspeed calculation
    
    %Compute average atmo pressure, standard deviation, and standard error
    numAPressure = length(APressure);
    StdDevAPressure = std(APressure);
    StdErrAPressure = StdDevPressure / sqrt(numAPressure);
    
    %Compute transducer pressure average, standard deviation, and standard
    %error
    numDPressure = length(DPressure);
    DPressureAv = mean(DPressure);
    StdDevDPressure = std(DPressure);
    StdErrDPressure = StdDevDPressure / sqrt(numDPressure);
    
    %Compute average atmo temp, standard deviation, and standard error
    numATemp = length(ATemp);
    ATempAv = mean(ATemp);
    StdDevTemp = std(ATemp);
    StdErrTemp = StdDevTemp / sqrt(numATemp);
    
    %Compute 
end