From: Louis Erickson <lerickson@rdwarf.net>
Subject: Erased start of voulme...
Date: Thu, 13 Jan 2005 17:03:30 -0800 (PST)
Message-ID: <Pine.LNX.4.61.0501131658460.28732@holly.rdwarf.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I don't know how it happened, but the start of the /var partition of one 
of the machines I run has gotten itself zeroed out.  Only the first little 
bit - 4k or so - is nulls, then a large amount of very plausible data 
appears.

I can't get reiserfsck to even think this is a reiserfs volume - the 
program doesn't think this is a reiserfs volume any more.

Is there any chance of getting the data back off of this disk?  Can 
reiserfsck be told to look harder and recover more deeply or something?  
Or is this a lesson in why backups are important?

Any suggestions you can give are welcome.

I'm currently running dd from the mangled partition to a file to be able 
to try some things without losing my only copy of the data.  If there's 
anything special I have to do to make that work, please let me know.

Thank you!

-- 
Louis Erickson - lerickson@rdwarf.net - http://www.rdwarf.com/~wwonko/

Oh Dad!  We're ALL Devo!
