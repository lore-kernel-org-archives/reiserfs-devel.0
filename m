From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: How to set a reiserfs partition to get an occasional fsck?
Date: Fri, 30 Jan 2004 09:31:32 -0700
Message-ID: <3DF9165145FACB4C96977FF650C1E904096336DD@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16660-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael.James@csiro.au, reiserfs-list@namesys.com

Michael,

If this is a production machine (and it sounds like it), it would be
much easier to test your RAM before putting it into production.  In
either case you shouldn't need to boot from a floppy.  I'd just go to
single user mode and do it there or boot from a live Cd (Knoppix or
something) or (eek!) install a very small ext2 root.

I also was bitten by RAM-induced instability (hey, a new acronym - RII)
when using Reiser.  It makes you wonder how many of the SIMM modules
and/or motherboards are marginal or are using marginal contact
materials.

Case in point:=20

I had installed Slackware 9.1 on one of my lab servers that had been
running OpenBSD.  Now OpenBSD is an excellent secure OS, but nobody
would delude themselves that the kernel is much of a stress of cpu and
memory -- especially running as only a firewall.

I wiped OpenBSD and installed Slack with reiser everywhere.  Everything
was fine until did a kernel recompile.  The machine cratered so hard
that rebuilding the filesystem was almost pointless.  It was a real
mess.

Of course I bitched and moaned and cursed the day that Hans Reiser was
born.
Damn !@#$@#$@.  Can't write a file system to save his life! No wonder
that @#$@#$ wasn't #@$#@$@#.  ;-)=20

Fortunately, I didn't lose much.

I took a deep breath, composed myself and realized I really liked
Reiserfs and wondered if it wasn't something wrong with my machine.
First I suspected that something was wrong with the BIOS because I had
been having strange interrupt problems on my ethernet card. Upgrading
the BIOS firmware fixed the ethernet card, but kernel compiles were
still crashing.

After days of spare time work on this machine I finally opened it up and
looked around.  Nothing obvious, so I threw up my hands and just
re-seated the SIMM modules.

One more time re-installing Slackware and I did a kernel compile.  No
problems.  Completely stable.  I wrote a script that did nothing but run
kernel compiles for 5 hours straight.  Still stable.  Everything fine.
So strange.  The SIMM modules seemed to be tightly seated.  Maybe
corrosion?

During my diagnostic work I had tried a Knoppix live rescue CD.  I was
so impressed with Knoppix (and Debian) that I switched.  (someone should
make a switch campaign for Debian like the Apple switch campaign ;-).  I
must say that the convenience of apt-get has made it possible to
experiment with so many different software configurations in my lab that
I'm about 100% more productive.

So in actuality what sometimes seems like a pain-in-the-ass can actually
be a blessing in disguise.

Thank you, Han Reiser for introducing me to Knoppix/Debian (and a fine
filesystem ;-)  Goodbye Slackware.  You were a fine friend for 10 years.
Some day I'll come back and visit. ;-)

Hans and crew: I'm still not sure what kind of memory operations crash
out the marginal SIMMs.  Have you isolated them?  Could you reproduce
it?  It would be interesting if you could write a small utility that
stresses RAM in the same way that Reiser stresses it.  That way there
would be no suprises and it could be run as a pre-install package before
Reiser is installed.  Something like:

YOU ARE ABOUT TO INSTALL REISERFS!  THIS IS A RELIABLE AND HIGH
PERFORMANCE ACCELERATED FILE SYSTEM.  IT DEPENDS ON HIGH QUALITY RAM
CORRECTLY SEATED ON YOUR MOTHERBOARD.  WOULD YOU LIKE TO TEST YOUR RAM
MODULES BEFORE YOU INSTALL IT? (Y/N) Y<cr>

TESTING: PATTERN TEST 1....PATTERN TEST 2.....DMA TEST.....etc

Your RAM passed the stress testing -- proceed.

Or=20

ERROR: Detected periodic faults in CPU mediated block transfers.
       Detected periodic faults in microcoded block transfers.
       Detected periodic faults in memory to I/O DMA transfers.

** Your system memory is faulty.  Suggest you re-seat the modules, clean
module connectors or replace your memory with higher quality modules. **

This way there would be no suprises.  Reiser (and especially Reiser4)
uses deep magick.  That comes at a price. I remember a test of various
journaling file systems a while back.  They measured a lot of things,
but seemed to really focus on speed vs CPU consumed.

Reiser3 and 4 consumed more CPU than the average file system so it was
rated low in the standings.  But what was really interesting was what
they didn't mention.  Over in the corner of the chart Reiser had
completed nearly all the tests before any other file system. ;-)

Reiser, the accelerated file system.  It comes at a price.  I wouldn't
use it on a PDA ;-)

Have a good day,

j.burnes


> -----Original Message-----
> From: Michael James [mailto:Michael.James@csiro.au]
> Sent: Thursday, January 29, 2004 10:15 PM
> To: reiserfs-list@namesys.com
> Subject: How to set a reiserfs partition to get an occasional fsck?
>=20
> While the new logging filesystems are a great improvement
>  my experience is that they can't survive forever in the real world
>  without an occasional rebuild or fsck.
>=20
> The suse and other lists have warnings by people burnt by reiserfs.
> I haven't (yet) lost any data but have had some scary times.
>=20
> This hasn't been bugs in reiserfs (3.6) itself
>  as most instability was tracked to (very marginally) flakey RAM.
>=20
> However while the glitches were caused by corrupt RAM
>  they left me with faults in the filesystem,
>  faults that persisted across reboots.
>=20
> These included un-list-able and un-cat-able files.
> ie: read or ask the size of that file
>  and it's bye-bye to that terminal.
> It made the whole system unuseable
>  as processes "trod on the cracks" and hung.
> Backups? Hah, not with that file in the partition.
>=20
> So I think a lot of bad press stems from the misconception
>  that any filesystem can avoid bitrot forever without an fsck.
> But this is painful to do by hand, I have to boot a rescue system
>  and run reiserfsck by hand, to do the root and system partitions.
>=20
> How can I get back the old behaviour an fsck happening
>  during reboot every x reboots or y days?
>=20
> Or,  how can I trigger an "fsck reboot"?
>=20
> TIA, michaelj
>=20
> PS:	I've just realized I can do it by adding an fsck
> 	  into the linuxrc script of a cooked initrd image.
> 	That would give me an "fsck boot" option in grub.
> 	Comments?
>=20
> --
> Michael James                         michael.james@csiro.au
> System Administrator                    voice:  02 6246 5040
> CSIRO Bioinformatics Facility             fax:  02 6246 5166

