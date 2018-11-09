function airspeed_av=calc_voltspeed(all_airspeeds)

    for i=1:10
        check=find(all_airspeeds==i)- length(all_airspeeds);
        %find the location of the volatage. Since voltage is always in second
        %column then the airspeed will be voltage element #-length(array)
        airspeed_av(i)=mean(all_airspeeds(check));
    end

end