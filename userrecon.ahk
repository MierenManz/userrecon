;----------------------------------------------------------------
;|You may use this program for personal use.			|
;|You are allowed to modify it but only if i get the credit	|
;|for the idea and for the work i've put in.			|
;|It does not matter how much of my code you use,		|
;|BUT if you use any bit of my code, then give me credit	|
;----------------------------------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
filecreatedir, %A_ScriptDir%\temp\
filecreatedir, %A_ScriptDir%\temp\htmls
inputbox, username, username, please type in any username without spaces
if errorlevel
	exitapp
if (username = "")
	exitapp
Gui, Add, Edit, r20 w500 vMyEdit readonly
gui, show
filedelete, %A_ScriptDir%\temp\temp.txt
fileappend, Preparing! , %A_ScriptDir%\temp\temp.txt
FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
GuiControl,, MyEdit, %FileContents%

filedelete, %A_ScriptDir%\temp\htmls\reddit.txt
filedelete, %A_ScriptDir%\temp\htmls\twitter.txt
filedelete, %A_ScriptDir%\temp\htmls\instagram.txt
filedelete, %A_ScriptDir%\temp\htmls\github.txt
filedelete, %A_ScriptDir%\temp\htmls\steam.txt
filedelete, %A_ScriptDir%\temp\htmls\roblox.txt
filedelete, %A_ScriptDir%\temp\htmls\wattpad.txt
filedelete, %A_ScriptDir%\temp\htmls\hackernews.txt
filedelete, %A_ScriptDir%\temp\htmls\wordpress.txt
filedelete, %A_ScriptDir%\temp\htmls\youtube.txt
filedelete, %A_ScriptDir%\users\%username%.txt
filedelete, %A_ScriptDir%\temp\temp.txt
fileappend, old files deleted! , %A_ScriptDir%\temp\temp.txt
FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
GuiControl,, MyEdit, %FileContents%

urldownloadtofile, https://www.reddit.com/user/%username%, %A_ScriptDir%\temp\htmls\reddit.txt
urldownloadtofile, https://twitter.com/%username%, %A_ScriptDir%\temp\htmls\twitter.txt
urldownloadtofile, https://instagram.com/%username%, %A_ScriptDir%\temp\htmls\instagram.txt
urldownloadtofile, https://www.github.com/%username%, %A_ScriptDir%\temp\htmls\github.txt
urldownloadtofile, https://steamcommunity.com/id/%username%, %A_ScriptDir%\temp\htmls\steam.txt
urldownloadtofile, https://www.roblox.com/user.aspx?username=%username%, %A_ScriptDir%\temp\htmls\roblox.txt
urldownloadtofile, https://www.wattpad.com/user/%username%, %A_ScriptDir%\temp\htmls\wattpad.txt
urldownloadtofile, https://news.ycombinator.com/user?id=%username%, %A_ScriptDir%\temp\htmls\hackernews.txt
urldownloadtofile, https://%username%.wordpress.com, %A_ScriptDir%\temp\htmls\wordpress.txt
urldownloadtofile, https://www.youtube.com/%username%, %A_ScriptDir%\temp\htmls\youtube.txt

filedelete, %A_ScriptDir%\temp\temp.txt
fileappend, Pages found! , %A_ScriptDir%\temp\temp.txt
FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
GuiControl,, MyEdit, %FileContents%

fileread, reddit, %A_ScriptDir%\temp\htmls\reddit.txt
fileread, twitter, %A_ScriptDir%\temp\htmls\twitter.txt
fileread, insta, %A_ScriptDir%\temp\htmls\instagram.txt
fileread, github, %A_ScriptDir%\temp\htmls\github.txt
fileread, steam, %A_ScriptDir%\temp\htmls\steam.txt
fileread, roblox, %A_ScriptDir%\temp\htmls\roblox.txt
fileread, wattpad, %A_ScriptDir%\temp\htmls\wattpad.txt
fileread, hackernews, %A_ScriptDir%\temp\htmls\hackernews.txt
fileread, wordpress, %A_ScriptDir%\temp\htmls\wordpress.txt
fileread, youtube, %A_ScriptDir%\temp\htmls\youtube.txt

if instr(reddit, "Sorry, nobody on Reddit goes by that name.")
	{
	filedelete, %A_ScriptDir%\temp\temp.txt
	fileappend, Reddit not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	filedelete, %A_ScriptDir%\temp\temp.txt
	fileappend, Reddit found: https://www.reddit.com/user/%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(twitter, "<h1>Sorry,")
	{
	fileappend, `nTwitter not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	fileappend, `nTwitter found: https://twitter.com/%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(insta, "Page Not Found")
	{
	fileappend, `nInstagram not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	fileappend, `nInstagram found: https://instagram.com/%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(github, "<title>Page not found")
	{
	fileappend, `nGithub not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	filegetsize, gitsize, %A_ScriptDir%\temp\htmls\github.txt
	if (gitsize = 0)
		{
		fileappend, `nGithub not found! , %A_ScriptDir%\temp\temp.txt
		FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
		GuiControl,, MyEdit, %FileContents%
		}
	else
	fileappend, `nGithub found: https://www.github.com/%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(steam, "<title>Steam Community :: Error</title>")
	{
	fileappend, `nSteam not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	fileappend, `nSteam found: https://steamcommunity.com/id/%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(roblox, "</span>Page Not found</h4>")
	{
	fileappend, `nRoblox not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	fileappend, `nRoblox found: https://www.roblox.com/user.aspx?username=%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(wattpad, "usererror404")
	{
	fileappend, `nWattpad not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	fileappend, `nWattpad found: https://www.wattpad.com/user/%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(hackernews, "No such user.")
	{
	fileappend, `nHackernews not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	fileappend, `nHackernews found: https://www.roblox.com/user.aspx?username=%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(wordpress, "doesn&#8217;t&nbsp;exist</h2>")
	{
	fileappend, `nWordpress not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	fileappend, `nWordpress found: https://www.roblox.com/user.aspx?username=%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
	
if instr(youtube, "vanity_404handler")
	{
	fileappend, `nYouTube not found! , %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
else
	{
	fileappend, `nYouTube found: https://www.youtube.com/%username%, %A_ScriptDir%\temp\temp.txt
	FileRead, FileContents, %A_ScriptDir%\temp\temp.txt
	GuiControl,, MyEdit, %FileContents%
	}
filecreatedir, %A_ScriptDir%\users
fileappend, %FileContents%, %A_ScriptDir%\users\%username%.txt
msgbox, file got saved in %A_ScriptDir%\users as %username%.txt
exitapp
