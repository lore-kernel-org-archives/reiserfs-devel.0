From: Norbert =?ISO-8859-1?Q?Gr=FCn?= <gnor-gpl@gmx.de>
Subject: Yet Another Discussion on Defrag.
Date: Sat, 29 Mar 2003 14:35:51 +0100 (MET)
Message-ID: <11174.1048944951@www45.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13430-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Dear Developers!

Please read the *whole* article before flaming!

It is probably the bazillionth discussion of the value of defragging
and I am quite mixed about it.

The first time defragging was mentioned when old 7th ed UNIX file
systems regularly got dumped, rebuilt and restored, PC-OS users may
prefer the terms backup, format and restore.

"A Fast File System for UNIX" by McKusick et al. from UCB discusses a
new strategy of, as I would say, "controlled fragmentation" or
"interleave everything" to keep disk latency low, and boosting
throughput by a factor of 10. I'll attach a bz2 archive of this paper
saved as PostScript with Netscape 3 for Linux in 1997/98. It doesn't
seem to be online any longer.

This paper mentioned curtly a defragger as an alternative to the dump,
rebuild, restore cycle.

Most people know defragging from their PC-OS.

MS-DOS and Win16 slurped their EXEs into memory in one chunk, as did
old 16-bit Unices with their a.out binaries. Win16 pulled lots of DLLs
behind that and introduced some parallelism in the start process.

Thus a contiguous file, with the appropriate disk interleave factor,
tremendously sped up program start, albeit other delays could happen
like with CP/M's WordStar, that took longer to initialise than to load
from floppy, not hard disk.

Defraggers got very popular then.

32-bit Unices, OS/2, and finally, Win32 changed this quite
dramatically.

Dklite stopped to work with OS/2 and Win32.

The reason was that all these systems start their programs with the
page fault mechanism that governs their demand paging virtual memory.

Only the headers of COFF-EXEs and ELF binaries will be read in one
slurp, then the tables will be built and the first page of the real
binary faulted in.

It will have rotated away when the loader will request it, so you have
to wait average half a round to get it. Then the binary will start to
execute this usually 4096 bytes of code until either it runs out of
instructions or a non-local reference is made.

In both cases the next page will be rarely under the head, the average
half round applies again, and so on.

More, console OSs will start most processes during start-up
sequentially whereas GUIs will fire up almost everything in parallel.

The latter will create quite some contention for the disk arm since
those binaries are rarely adjacent. Thus some defraggers try to cluster
these binaries together.

However, the page faulting program loader can't take advantage of
contiguous binaries because paging usually bypasses the buffer cache,
so no read-ahead can preallocate a disk track there.

On-access malware scanners might benefit from contiguity, but the
loader can't read from the buffer cache so this performance penalty
hurts fully.

MSIE creates quite decent disk rattling when starting and even Lotus
WordPro strains the disk when loading the table-related modules.

Some of this traffic may be due to the shrink-all-processes strategy of
the VMS-based Win32 systems that lack swap partitions and have to
squeeze this traffic through the file system bottleneck as well, albeit
this will be noticeable with behemoths like Mozilla and monster HTML
documents.

Thus the original drive behind defragging is gone.

Only large multimedia streams may benefit from contiguity any longer
albeit today's hard disks outperform any DVD, how fast the latter may
be. If you look at the CD/DVD drive lamp during a movie, it will
indicate that the stream is read in small chunks every quarter minute
or so, so there is no hard demand for contiguity, too. And CD/DVD
roasters now survive buffer underruns, so another demand has gone.

There some simple strategies for continuous defrag-on-write schemes,
but these will have a performance penalty like the post-writing
reordering of the ReiserFS tree already albeit this could be kept low
by putting "dynamic" files at the end and "static" ones at the
beginning which can be achieved by a dumb "bubble sort" algorithm.
Deleting a "static" file will cause a big traffic peak, however.

Thus a "controlled fragmentation" or "interleave everything" strategy
like the Berkeley Fast File System which is used also by HPFS and NTFS
may be the solution to increasing disk latency traditional layouts
suffer from. There have been defraggers for HPFS and those for NTFS are
quite numerous. These counteract the "controlled fragmentation"
however. The FAT legacy has distorted minds there.

So ReiserFS should perhaps interleave everything as well to overcome
the post-writing tree-sorting performance penalty.

Note that the BSD guys now try to get the benefits of journalising with
a completely different strategy with "soft updates" which also speeds
up their traditionally fully synchronous operation.

So I would agree mostly with those that oppose defragging.

Also, the high disk traffic of a defragger will interfere heavily with
other I/O, the smoothness of your GUI will suffer heavily, disk
interrupts are high.

There are no longer wee hours in the Net, while you sleep, somebody
else is up and connecting to your server.

So you can't afford to have your server become sluggish just because
disk contents get arranged with almost no noticeable benefit.

Especially mail and news servers have such a rapidly changing disk
content that any hope of defragging is void.

These also need journalising and a faster writing ReiserFS, competition
from a "soft updated" BSD FFS will be fierce.

As you see, the cost of defragging now outweighs it's benefits and the
strategy of BSD FFS will make it utterly obsolete.

I mentioned already the mental FAT legacy above, but several years ago,
prior to the OS wars, c't mag compared DOS defraggers and gave an acid
comment about defragger addicts being messy people enjoying watching
their disk getting tidied up instead of their rooms.

As an aside, nobody ever heard about a defragger for NetWare. They now
have B-trees to speed up their new NSSFS, the old FS mentioned FAT as
an important structure.

So defragging is a method of yesterday giving benefits only to
yesterdays' PC-OSs, but not to modern professional OSs.

I hope this helps in the discussion that may be retriggered by the
bazillion of people that grew up with PC-OSs.

Please be patient with these "newbies", there are native language
effects in computers as are in real life, everybody of us who is
multilingual knows of all the idiomatic expressions and puns that take
an hour to explain in another language.

Kind regards

Norbert Gr=FCn (gnor@x-mail.net)


--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=E4cheln! Fotogalerie online mit GMX ohne eigene Homepage!

