From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Wed, 5 Mar 2003 16:01:35 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C0798@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com

	Anders, you need the subsequent lines for the error to determine
what the status error is. The 0x58 is a staatus error. It could be a status
timeout, seek error, etc. The subsequent line generally tells you what it
is. The faact you have noticed the errors diminished with DMA off or at the
lower speeds seems to indicate possible timeouts. 
	Typically, the IDE driver will drop out of DMA and retry in PIO when
an error is encountered. If the kernel is <2.4.18(?) it will have a
configuration switch that says DMA always for disks. What this means is IDE
will drop back to PIO, complete the request, then go back to DMA for
subsequent requests. Prior to this kernel, IDE would degrade that drive to
PIO forever until the next boot.
	To solve it - good hardware. Really! For instance, there is a Maxtor
tool that allows you to examine the probational logs of the drive - areas of
the disk that are suspected as bad. These are areas that aren't necessarily
logged as a bad block but are on "probation" for the next write. They can
cause these error messages to occur. Unfortunately, I don't believe the tool
is available to the general populace. Sorry.
	You may want to pose your question the IDE mailing list
(linux-ide@vger.kernel.org) to see if anyone else has any ideas for you on
how to deal with these errors.
Regards,
Wayne

email:       Berthiaume_Wayne@emc.com

"One man can make a difference, and every man should try."  - JFK


-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Wednesday, March 05, 2003 2:18 PM
To: reiserfs-list@namesys.com
Subject: Error messages.



   This  has  come up on this list a number of times, and no one still
   seem to have found the true answer to the problem.

   kernel: status error: status=0x58 { DriveReady SeekComplete DataRequest }

   Most  seem  to  say  this is a bad block on the harddrive. I am not
   convinced  though.  Using  Linux on three machines here, and I have
   seen  this error on all of them, with lots of disks. The error seem
   to   come  random,  but  does  cause  system  lockups  and  broken
   filesystems.

   Have  about  20  disks, and have replaced and upgraded them several
   times  too.  This error has shown on most of them. But when testing
   them  with tools like IBM DFT, Maxtor Powermax, badblocks or chkdsk
   in Windows none show up to be with errors on.

   Sometimes  it  seem  to  help to disable DMA and or lower UDMA mode
   (all  drives are ATA-100 or ATA-133). But then after a few days, or
   a  few  minutes  the  kernel  starts spitting out these status=0x58
   errors.

   After  looking  online  on  different forums it does seem that many
   people are experiencing them.

   What  exactly does this status=0x58 error mean, and what can one do
   to solve the problem?

   //Anders


--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
