%SongList: The list of titles in the song folder each of which should have 
%          its own folder
SongList = {'YourSong'};

%This for loop goes through each song in the song list and makes a txt file
%for the low mid and high domains in which each statement contains the rgb
%bit values for each drawing class.
for index = 1:length(SongList)
    SongDirc = strcat('Songs/',SongList(index),'/',SongList(index),'.mp3');
    [Song,Fs] = audioread(char(SongDirc));
    SongData = SongProp(Song,Fs);
    
    ZListBass = zscore(SongData(:,1));
    ZListMid = zscore(SongData(:,2));
    ZListHigh = zscore(SongData(:,3));

    BassColors = ColorList(ZListBass,1);
    MidColors = ColorList(ZListMid,2);
    HighColors = ColorList(ZListHigh,3);
    
    WriteToTxt(BassColors,char(strcat('Songs/',SongList(index),'/','Bass.txt')));
    WriteToTxt(MidColors,char(strcat('Songs/',SongList(index),'/','Mid.txt')));
    WriteToTxt(HighColors,char(strcat('Songs/',SongList(index),'/','High.txt')));
end




