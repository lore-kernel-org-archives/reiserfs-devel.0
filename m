From: Paolo Correnti <paolunix@yahoo.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 06:40:17 -0800 (PST)
Message-ID: <20040116144017.87800.qmail@web21508.mail.yahoo.com>
References: <20040116130406.64681.qmail@web21507.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16545-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040116130406.64681.qmail@web21507.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Correnti <paolunix@yahoo.com>, Hans Reiser <reiser@namesys.com>
Cc: REISER LIST <reiserfs-list@namesys.com>

I made another test with "only" 5 million records.
The result is OK !

real    58m22.468s
user    28m54.382s
sys     3m53.500s

on a P4 2,8 GHz with 512Mb RAM, to write about 1,5 Gb
of data.

So the first test problems where:

1) Oracle beeing in archivelog mode created something
like 2 Gb of redolog files -> disk full explained

2) The point 1 made a mess ...

3) Also deleting a 300mb datafile I wasn't able to
obtain a 300mb free space and I had to umount -> fsck
-> mount reiser4 partition

Best regards
 
 Paolo Correnti
 
 


__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
