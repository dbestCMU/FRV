function [  ] = Simulate( SongName,Type)
%Will run a simulatiron on a song and show it in implay
%Type 1 is low
%Type 2 is high
%Work in progress (fixing performance issues in mid)

SongDirc = strcat('Songs/',SongName,'/',SongName,'.mp3');
[Song,Fs] = audioread(char(SongDirc));
SongData = SongProp(Song,Fs);


if (Type == 1)
    ZList = zscore(SongData(:,1));
    Colors = ColorList(ZList,1);
    Colors = Colors ./15;
    BassLocations;
    for frame = 1:length(Colors)
        FrameImg = zeros(32,32,3);
        
        for index=1:2:23
            X = Class0(index);
            Y = Class0(index+1);
            FrameImg(X,Y,:) = Colors(frame,1:3);
        end
        
        for array = 1:4
            for index=1:2:23
                X = Class1(array,index);
                Y = Class1(array,index+1);
                FrameImg(X,Y,:) = Colors(frame,4:6);
            end
        end
        
        for array = 1:12
            for index=1:2:23
                X = Class2(array,index);
                Y = Class2(array,index+1);
                FrameImg(X,Y,:) = Colors(frame,7:9);
            end
        end 
        
        
        for array = 1:18
            for index=1:2:23
             X = Class3(array,index);
             Y = Class3(array,index+1);
             FrameImg(X,Y,:) = Colors(frame,10:12);
            end
        end
        
        for array = 1:16    
            for index=1:2:8
                 X = Class4(array,index);
                 Y = Class4(array,index+1);
                 FrameImg(X,Y,:) = Colors(frame,13:15);
            end
        end
        Film(frame) = im2frame(FrameImg);
    end
    implay(Film,10);       
end

if (Type == 2)
    ZList = zscore(SongData(:,2));
    Colors = ColorList(ZList,2);
    Colors = Colors ./15;
    HighLocations;
    for frame = 1:length(Colors)
        FrameImg = zeros(32,32,3);
        
         for index = 1:2:length(Class0)
            X = Class0(index);
            Y = Class0(index+1);
            FrameImg(X,Y,:) = Colors(frame,1:3);
        end

        for index = 1:2:length(Class1)
            X = Class1(index);
            Y = Class1(index+1);
            FrameImg(X,Y,:) = Colors(frame,4:6);
        end

        for index = 1:2:length(Class2)
            X = Class2(index);
            Y = Class2(index+1);
            FrameImg(X,Y,:) = Colors(frame,7:9);
        end

        for index = 1:2:length(Class3)
            X = Class3(index);
            Y = Class3(index+1);
            FrameImg(X,Y,:) = Colors(frame,10:12);
        end

        for index = 1:2:length(Class7)
            X = Class7(index);
            Y = Class7(index+1);
            FrameImg(X,Y,:) = Colors(frame,13:15);
        end

        for index = 1:2:length(Class6)
            X = Class6(index);
            Y = Class6(index+1);
            FrameImg(X,Y,:) = Colors(frame,16:18);
        end

        for index = 1:2:length(Class5)
            X = Class5(index);
            Y = Class5(index+1);
            FrameImg(X,Y,:) = Colors(frame,19:21);
        end

        for index = 1:2:length(Class4)
            X = Class4(index);
            Y = Class4(index+1);
            FrameImg(X,Y,:) = Colors(frame,22:24);
        end
        
        Film(frame) = im2frame(FrameImg);
    end
    implay(Film,10);
end
end
