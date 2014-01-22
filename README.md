Dale Best (dbest@andrew.cmu.edu)

Amy Lee (amylee@andrew.cmu.edu)

Jennifer Meagan Lloyd (jmlloyd@andrew.cmu.edu)

This is the source code for the F.R.V. (Full Room Visualizer), demonstrated at Carnegie Mellon University's 
Build18 Symposium on January 17, 2013, in which contains two folders "Processing" and "Performance". 
The Processing folder consists Matlab files that handle preprocessing of input song files. 
The Performance folder contains the Processing program that interacts with the connected Arduino board along 
to send data by serial, as well as the graphics display code code for each of the boards.

Processing:

	Helper Functions:
		BassLocations.m
		HighLocations.m
		ColorList.m
		PickColor.m
		SongProp.m
		WriteToTxt.m
		XPartSong.m
	Test Functions:
		Simulate.m
	Main Function:
		Animate.m

	NOTE: Due to copyright, I should not send songs I used in my performance. 
	      However, all mp3 files should work by making a folder in the "Songs" folder with the same
	      name as the mp3 file the folder should contain. Then within Animate.m remove 'YourSong'
	      with the title of the song(s) you will want to use.

Performance:

	Note: Make sure to load the Arduino code to each board and note the port used.

	NOTE2: The Performance code works only for the test computer but can easily be made to work on
		any computer. To do this replace the COM4-6 port lines with the ports used to load each of
   		of the Arduino boards. If the specific port/domain is not being used, then comment out all lines
	      	that use that domain. Furthermore, make sure to change all readData___ to the locations of your
		Matlab Processing song folder. If you encounter any issues contact Dale Best at dbest@andrew.cmu.edu.
