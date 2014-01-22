function [MusicVal] = SongProp(Song,Fs)
%SONGPROP Takes in a song matrix and it's Fs
%			and returns a x-by-3 matrix of its properties
%			in which each column is the fft summation
%			of the low,mid,high domains at each 1/Key sec
%			timestamp.

SongLength = length(Song)/Fs; %Length of song in seconds
Key = 10; %Experimental frame rate
Parts = Key*floor(SongLength); 
T = 1/Fs;

%This for loops Splits the song into it's 10ms parts and takes the FFT sum
%of the low mid and high which are represented by 80:320, 320:1280, and
%1280:5120 and store these values in MusicVal
MusicVal = zeros(Parts,3);
for Part = 1:Parts
    SongPart = XPartSong(Song,Fs,Part, Key);
    L = length(SongPart);
    t = (0:L-1)*T;
    NFFT = 2^nextpow2(L);
    Y = fft(SongPart,NFFT)/L;
    f = (Fs*2)/2*linspace(0,1,NFFT/2+1);
    
    YFFT = 2*abs(Y(1:NFFT/2+1));
    Bass = sum(YFFT(80:320));
    Mid = sum(YFFT(320:1280));
    High = sum(YFFT(1280:min(5120,length(YFFT))));
    MusicVal(Part,:) = [Bass,Mid,High];

end

