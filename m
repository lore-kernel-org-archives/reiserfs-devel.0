From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 20:28:15 -0400 EDT
Message-ID: <17778828065-BeMail@cr593174-a>
References: <20030918231747.50465.qmail@web60001.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030918231747.50465.qmail@web60001.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Narcoleptic Electron wrote on Thu, 18 Sep 2003 19:17:47 -0400 (EDT):
> Not really... "..." essentially contains the "system" part of the directory (i.e. like an API) whereas the rest is the "user" part.  This is especially the case of "..." is hidden in the file browser.  So only the "user" part would be localized.

Right, same thing for BeOS.  Attribute names are in English no matter what.

> ",," just doesn't strike me the same way... if I had to choose something else, I would pick "!".  It has a dot in it, which is nice, and it nods to Risc OS, which uses "!" as a special prefix.  It doesn't seem to be reserved on Windows. (Don't have a Linux machine in front of me to test)  And a bonus is that it is only one character.

No!  Argh!  It's a pain using file names with an ! in them, causes command history evaluation in various Unix shells.  Would have to escape them when typing in file names, which makes it really awkward to use.

I'd go with ",," or even "," instead (if that's not used).  Though that may make script files look even more like APL (a computer language using lots of Greek symbols rather than words).  Or how about "_"?  C programmers already use that for reserved system names.

- Alex
