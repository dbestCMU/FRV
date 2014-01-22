function [ SongPart ] = XPartSong( Song, Fs, Part, Key )
%XTenSong- takes in the song file and fs,
%           and with the given part it will
%           return the TimeIndexed length point
%           of the song

TimeIndex = Fs/Key; %Set to be every 1/Key seconds
Start = (Part * TimeIndex) +1;
End = ((Part+1) * TimeIndex);
SongPart = Song(Start:End);
%%return

end

