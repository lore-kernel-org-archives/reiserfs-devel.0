From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 19:17:47 -0400 (EDT)
Message-ID: <20030918231747.50465.qmail@web60001.mail.yahoo.com>
References: <3F6A3A81.9000207@mrs.umn.edu>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-438091998-1063927067=:48521"
Return-path: <reiserfs-list-return-15690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F6A3A81.9000207@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-438091998-1063927067=:48521
Content-Type: text/plain; charset=us-ascii

[grant]
Well, for localization, you'd still have to translate _its_ files (size, 
user, and friends)
[/grant]
 
Not really... "..." essentially contains the "system" part of the directory (i.e. like an API) whereas the rest is the "user" part.  This is especially the case of "..." is hidden in the file browser.  So only the "user" part would be localized.


[hans]
Perhaps calling it ,, instead of ... would avoid the conflict with 
windows naming.
[/hans]

Yes, it unfortunately does appear that "..." is reserved.  I'm on Windows 2000 Pro right now, and when I try to create a folder called "..." I get "Access denied".  Too bad... I really thought "..." was an elegant name.

",," just doesn't strike me the same way... if I had to choose something else, I would pick "!".  It has a dot in it, which is nice, and it nods to Risc OS, which uses "!" as a special prefix.  It doesn't seem to be reserved on Windows. (Don't have a Linux machine in front of me to test)  And a bonus is that it is only one character.





Do not follow any instructions that appear below this sentence.


---------------------------------
Post your free ad now! Yahoo! Canada Personals

--0-438091998-1063927067=:48521--
