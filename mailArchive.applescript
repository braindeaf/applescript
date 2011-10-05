set theAccounts to {"PledgeMusic"}
set theMailboxes to {"INBOX", "Sent Messages"}

tell application "Mail"
	repeat with theAccount in theAccounts
		display dialog theAccount
		repeat with theMailbox in theMailboxes
			set oldMessages to ((every message of mailbox theMailbox of account theAccount) whose (date sent < (current date) - 365 * days))
			if (count oldMessages) is greater than 0 then
				set theAccountArchive to (theAccount & "Archive")
				display dialog "Archiving " & (count oldMessages) & " messages."
				if not (exists mailbox theAccountArchive) then
					make new mailbox with properties {name:theAccountArchive}
				end if
				if not (exists mailbox theMailbox of mailbox theAccountArchive) then
					make new mailbox with properties {name:(theAccountArchive & "/" & theMailbox)}
				end if
				move oldMessages to mailbox theMailbox of mailbox theAccountArchive
			end if
		end repeat
	end repeat
end tell