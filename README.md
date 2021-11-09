# Plog

TOPIC

    about_Plog

SHORT DESCRIPTION

    Powershell Logger module called Plog that allows easy to use logging functionalities.

LONG DESCRIPTION

    Plog is a module for logging scripts, The module was created for personal use
    by Michael Shvili aka L0l2K and is public and free for sharing.
    
    The module contain options for creating a new log file and configuring the path and the file name,
    you can add an a Transcript file at the Start-Log command for covering both logging methods.
    
    The log options are INFO, WARNING, ERROR, DEBUG, ACTION, SUCCESS.
	
HOW TO INSTALL THE MODULE
	
	Just download the Plog and put Plog Folder at:
	"C:\Users\YOUR-USERNAME\Documents\WindowsPowerShell\Modules"
    
SYNTAX

	Start-Log
		-Path <String>
		[-Name <String>]
		[-Transcript <Boolean>]]

	Log-Info
		-LogString <String>
		[-Print <Boolean>]
		[-Save <Boolean>]

	Log-Warning
		-LogString <String>
		[-Print <Boolean>]
		[-Save <Boolean>]

	Log-Error
		-LogString <String>
		[-Print <Boolean>]
		[-Save <Boolean>]

	Log-Debug
		-LogString <String>
		[-Print <Boolean>]
		[-Save <Boolean>]

	Log-Action
		-LogString <String>
		[-Print <Boolean>]
		[-Save <Boolean>]

	Log-Success
		-LogString <String>
		[-Print <Boolean>]
		[-Save <Boolean>]

EXAMPLES

	#Create Test.log and test-transcript.log in the folder: C:\Temp\Logs
	Start-Log -Path C:\Temp\Logs -Name Test.log -Transcript $true
	

	#Write "Info log with print and save." into C:\Temp\Logs\test.log, and will print to the console
	Log-Info -LogString "Info log with print and save." -Print $true -Save $true

	#Stop the log and close the log files, for use with -Transcript only.
	Stop-Log

KEYWORDS

    None.

SEE ALSO

    More information update and changes and tools at @Levi-Michael Github.
