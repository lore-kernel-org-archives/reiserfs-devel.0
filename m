From: "Steve Olivieri" <steve86@WPI.EDU>
Subject: Reiser4 SCSI Bug?
Date: Fri, 28 Oct 2005 13:49:10 -0400 (EDT)
Message-ID: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26696-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: steve86@WPI.EDU

Greetings!

I have a Maxtor Atlas II 15k, 147GB SCSI hard disk and an LSI Logic
LSI21320 Ultra320 SCSI Host Bus Adapter for PCI-X (though it's running in
a PCI slot).  I have partitioned it and installed a temporary Gentoo
system with the reiserfs filesytem.  My boot partition uses ext2.  These
partitions seem perfectly stable.  I have booted this temporary system
multiple times and I have attempted to use it to install a permanent
system with the reiser4 filesystem.

After making the fileystems on each partition and mounting them, I was
able to download two tarballs (the stage and portage snapshot).  While
extracting the first, the terminal seems to hang.

I switched to another terminal to see what was wrong.  Everything works
great until I try to do anything at all on a reiser4 partition.  Then,
this terminal also hangs.  Repeat until I'm out of terminals.

I've been able to repeat this problem a number of times.  The only
messages in my log file claimed that a flush failed (with code -12, if I
remember correctly).  I do not have access to the logs at this time but I
will try to get them soon.

I am running a 2.6.13-ck8 kernel patched with the 2.6.13 reiser4 patchset.
 Patitions were made using the 1.0.5 reiser4progs/libaal.  In the past, I
have also replicated this problem using a 2.6.12-gentoo kernel with the
2.6.12 patchset and 1.0.5 reiser4progs/libaal.

Is there something that I can do to fix this problem?  Is it a known bug?

Also, I am not on the mailing list and I would appreciate it if I could be
cc'd with any information about this problem.

Thanks,
Steve



