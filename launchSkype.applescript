#!/usr/bin/osascript

on run argv
	tell application "Skype"
		set state to item 1 of argv
		if state is equal to "on"
			set status to send command "SET USERSTATUS ONLINE" script name "SKYPE STATUS"
		else if state is equal to "off"
			set status to send command "SET USERSTATUS OFFLINE" script name "SKYPE STATUS"
		end
		return status
	end tell
end run