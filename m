From: =?ISO-8859-1?Q?=22Norbert_Gr=FCn=22?= <gnor-gpl@gmx.de>
Subject: Reiser5 Repackager
Date: Wed, 2 Feb 2005 16:16:09 +0100 (MET)
Message-ID: <1406.1107357369@www26.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Dear developers!

While the Windows community regards defragging file systems almost as a
must, the *NIX community regards it as a non-issue.

DOS and Win16 programs used to load their binaries in one swoop, albeit
Win16 already created contention for parallel loading the DLLs and the OOP
scheme underlying any GUI will load the whole object chain up to the root
object.

Also FAT file systems tend to fragment rapidly, albeit not as bad as the
traditional 7th Ed *NIX file system with it's multiple indirection.

All modern OS' use the page fault mechanism, be it Linux, a BSD, OS/2 or
Win32. A binary in one chunk is only of help if significant portions land
via read-ahead in the buffer cache where they contend with directory,
inode, and write data.

Also NTFS inherits from OS/2's HPFS a controlled fragmentation scheme that
originated in the Berkeley Fast File System (BFFS) where the volume got
chopped up into cylinder groups and spreading large files over these at 1MB
boundaries. They regarded a long seek every megabyte a small penalty. Load
lots of files into NTFS and fire up a defrag program, preferably one with a
fine grained block display, and you'll see a checkerboard of allocated and
free blocks.

Given BFFS' design ideas, defragging file systems with controlled
fragmentation may not produce that great improvements than with FAT-like
file
systems.

Also, defragging is a matter of resources.

Defraggers are an I/O hog, the disk contending with graphics, mouse, and
keyboard I/O, serial and network interrupts are usually of higher priority
since data loss there is very critical.

This may be OK at a workstation which sits idle outside business hours, but
Internet servers have a 24/7 job.

Whereas Web servers may be somewhat static, mail and news servers are
definitely not. Bazillions of small files are created and deleted in quick
succession, overwhelming any defragmentation scheme since the results of
the analysis phase are obsolete at it's end.

Even ReiserFS gets strained when rebalancing the B+-tree after each write.

This would be the same with the utterly dumb strategy incremental
defragging scheme I suggested to Mark Russinovich where every file open for
writing would get checked for fragmentation and copied to the end after
closing, the resulting gaps getting filled by a consolidator process.
Initially, a checker process would schedule all fragmented files for
defragmentation, the consolidator filling the gaps, this needs several
passes as all defragmenters do. Finally, the live files would be at the
end, as would be their directories. Note that the buffer cache would keep
them along so contention for the disk arm wouldn't rise that much.

Thus a controlled fragmentation scheme like BFFS' might help maintaining
throughput over time which was one of the design goals of BFFS.

BTW: How can I send you the BFFS paper? It is in PostScript, the only way
to get the images saved with Netscape3 under Linux in 1997/98, today the
situation is slightly better, even among MSIE's competition. Your mailing
list refuses binary attachments, I don't know whether GMX will identify the
.PS file correctly as application/postscript and your mailer will accept
that as text/postscript. Recent searches didn't produce the HTML page
again. :-( However, this would need a TGZ archive your mailer refused.

Kind Regards

Norbert Gr=FCn (gnor-gpl@gmx.de)



--=20
GMX im TV ... Die Gedanken sind frei ... Schon gesehen?
Jetzt Spot online ansehen: http://www.gmx.net/de/go/tv-spot
