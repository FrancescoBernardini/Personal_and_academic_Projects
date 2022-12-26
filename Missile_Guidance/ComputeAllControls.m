function [uResults xzplots] = ComputeAllControls(steps,A,B,R,zMax,uMax,z0,vz0,T,Vt,Vp,x0)
uResults = zeros(steps,steps,5);
xzplots=zeros(1,5,steps,steps);

for posWeight = 1:steps
    sprintf("Step %d of %d",posWeight,steps)
    for velWeight=1:steps
        [uResults(posWeight,velWeight,1)  uResults(posWeight,velWeight,2) ...
            uResults(posWeight,velWeight,3) uResults(posWeight,velWeight,4) ...
            uResults(posWeight,velWeight,5) xzplot] = ...
            ComputeControl(A,B,posWeight,velWeight,R,zMax,uMax,z0,vz0,T,Vt,Vp,x0);
            %%%write plots in global container%%%
                if size(xzplot,1) > size(xzplots,1) 
                    xzplots=padarray(xzplots,size(xzplot,1)-size(xzplots,1),NaN,'post' );
                    
                elseif size(xzplot,1) < size(xzplots,1) 
                    xzplot = padarray(xzplot,size(xzplots,1)-size(xzplot,1),NaN,'post');
                end
                xzplots(:,:,posWeight,velWeight)=xzplot;

            %%%
    end
end

end
