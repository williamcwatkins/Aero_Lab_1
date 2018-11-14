function [VUnc,PUnc] = ASUncertainty(VenturiData,PitotData)
    %ASUncertainty computes the uncertainty in the airspeed calculation
    VPressure = VenturiData(:,1);
    PPressure = PitotData(:,1);
    VTemp = VenturiData(:,2);
    PTemp = PitotData(:,2);
    VDPressure = VenturiData(:,3);
    PDPressure = PitotData(:,3);

    %Only have to consider manufacturer stated uncertainty
    dT = 0.25; %K
    dP = 68.947; %Pa
    dp = 3450; %Pa
    
    R = 0.287; %kg / kJ K
    syms P T p 
    V = sqrt((2*P*R*T)/(p*(1-(1/9.5)^2)));
    dVdP = diff(V,P);
    dVdT = diff(V,T);
    dVdp = diff(V,p);
    
    for i = 1:39000

        VUnc(i) = double(sqrt((vpa(subs(dVdP,[P T p],[VDPressure(i),VTemp(i),VPressure(i)]))*dP)^2 ...
            + (vpa(subs(dVdT,[P T p],[VDPressure(i),VTemp(i),VPressure(i)]))*dT)^2 ... 
            + (vpa(subs(dVdp,[P T p],[VDPressure(i),VTemp(i),VPressure(i)]))*dp)^2));
    
    end
    
    for i = 1:45000
        PUnc(i) = double(sqrt((vpa(subs(dVdP,[P T p],[PDPressure(i),PTemp(i),PPressure(i)]))*dP)^2 ...
            + (vpa(subs(dVdT,[P T p],[PDPressure(i),PTemp(i),PPressure(i)]))*dT)^2 ... 
            + (vpa(subs(dVdp,[P T p],[PDPressure(i),PTemp(i),PPressure(i)]))*dp)^2));
    end
    
end