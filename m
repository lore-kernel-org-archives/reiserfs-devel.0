From: Robert Tiismus <robert@fi.tartu.ee>
Subject: Catastrophe with mailboxes on ReiserFS
Date: Tue, 8 Oct 2002 23:55:42 +0300 (EEST)
Message-ID: <Pine.LNX.4.44.0210082331110.10033-100000@fii.fi.tartu.ee>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11621-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi!
	I have been using Reiserfs on mail server for two months. Today
a _Very Bad Thing_ (VBT) happened. I would appreciate if someone would give a
helpful comment about IT (VBT) being related with the incident. The
result of the mess was that some blocks of user1 mailbox were placed in
the middle of user2 mailbox, and some blocks from user2 mailbox were
palced into user3 mailbox. The result was surprisingly good: all three
mailboxes were readable by pine/elm/pop3. I speculate that this happened
during previous malfunction during disk access. I had added some devices to
server and did not close the case to check if the server does not
malfunction with the new hardware. I think that when closing the side
panel, I misaligned the scsi cable from the connector and disk access
malfunctioned. Then, after rebooting the system, everything seemed ok, besides
this unfortunate inident with three mailboxes :(
Is it possible, that VBT happened during following reboot?

System is Debian GNU/Linux 2.4.18 (Woody). ReiserFS version 3.6.25

The fstab line looks like this:

/dev/sda2	/	 reiserfs	defaults	0	0

Best wishes,

Robert Tiismus

