clearinfo

form You can do input like this
	comment Change directory here, don't put slash at the end
	sentence directory /Users/sara/Desktop/demofiles
endform

Create Strings as file list: "allFiles", directory$ +"/*.mp3"

numberFiles = Get number of strings

for ifile to numberFiles
	select Strings allFiles
	fileName$ = Get string... ifile
	name$ = fileName$ - ".mp3"
	print file 'fileName$' 'tab$' 
	x = Read from file: directory$ + "/" + fileName$
	pitchObject = To Pitch: 0, 75, 600
	total_frames = Get number of frames
	for iframe to total_frames
		time = Get time from frame: iframe
		pitchValue = Get value in frame: iframe, "Hertz"
		if pitchValue = undefined
			appendInfoLine: time, ",", "Voiceless", ",", "Pitch"
		else
			appendInfoLine: time, ",", pitchValue, ",", "Pitch"
		endif
	endfor
	selectObject: x
	intensityObject = To Intensity: 100, 0, "yes"
	total_frames = Get number of frames
	for iframe to total_frames
		time = Get time from frame: iframe
		intensityValue = Get value in frame: iframe
		appendInfoLine: time, ",", intensityValue, ",", "Intensity"
	endfor
endfor