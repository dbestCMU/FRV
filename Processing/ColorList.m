function [ Colors ] = ColorList(Zlist,Type)
%ColorList: Take a list of ZScore and returns a list of the bit rgb values 
%           for each drawing class for each frame

Colors = zeros(length(Zlist),24);

for frame = 1:length(Zlist)
    if (frame>1)
        %The following lines push the colors from the prev frame
        %up one class
        Colors(frame,22:24) = Colors(frame-1,19:21);
        Colors(frame,19:21) = Colors(frame-1,16:18);
        Colors(frame,16:18) = Colors(frame-1,13:15);
        Colors(frame,13:15) = Colors(frame-1,10:12);
        Colors(frame,10:12) = Colors(frame-1,7:9);
        Colors(frame,7:9) = Colors(frame-1,4:6);
        Colors(frame,4:6) = Colors(frame-1,1:3);
        Colors(frame,1:3) = PickColor(Zlist(frame),Type);
    else
        Colors(1,1:3) = PickColor(Zlist(frame),Type);
    end
end

return 

