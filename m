From: Russell Coker <russell@coker.com.au>
Subject: Re: non volatile ram devices
Date: Thu, 5 Dec 2002 10:00:32 +0100
Message-ID: <200212051000.32340.russell@coker.com.au>
References: <200212042059.35300.russell@coker.com.au> <20021204212447.C20004@vestdata.no>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021204212447.C20004@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?iso-8859-1?q?Kj=F8rstad?= <linux-ide-arrays@ragnark.vestdata.no>
Cc: linux-ide-arrays@lists.math.uh.edu, ReiserFS <reiserfs-list@namesys.com>, Mike Jadon <mikej@umem.com>

On Wed, 4 Dec 2002 21:24, Ragnar Kj=F8rstad wrote:
> On Wed, Dec 04, 2002 at 08:59:35PM +0100, Russell Coker wrote:
> > I have some servers that are giving inadequate disk performance for
> > Maildir mail spools.  They are running kernel 2.4.19 (2.4.20 upgrade is
> > planned) and using ReiserFS for everything that's important.
>
> One thing you might considder is replacing the reiserfs hash with a
> maildir-specific hash. In my rather limited testing I found that it was
> significantly faster; I think some tests gave 200-300% speed
> improvement.
>
> But, as I said, there was only limited testing. Don't go this route
> unless you have the time to test it properly both for stability and
> performance.

Thanks for the suggestion.  However I don't think that I have the resources=
 to=20
develop and adequately test such a change.

Also I doubt that this will help much for my use, I am seeing 160 writes pe=
r=20
second but only 20 reads per second at peak load times.  So I think that th=
e=20
caching is doing well (and directory sizes aren't too big because of quotas=
).

> > The device containing the journal would be something much faster than
> > physical media.
>
> Even if the device is just a regular disk it should give you a real
> performance boost. Depending on your RAID-setup, it may not be the
> throughput, but the seeking back and forth between the journal and the
> rest of the disk that kills performance. Having the journal on a
> seperate disk solves that problem.

True.  However I could only put in a single extra disk, and I don't want to=
=20
use non-RAID...

> > Does anyone know of an affordable ($1000 or less) device that can survi=
ve
> > unexpected power outages of at least 24 hours duration, can commit a
> > write in less than 1ms, supports unlimited writes, and connects to a IDE
> > or SCSI bus (or PCI if there's a suitable Linux driver).
>
> Did you check out Micro Memory Inc? (http://www.umem.com/)
> I think they have some PCI-cards (with linux-drivers) which may be
> suitable for this.

Thanks for everyone who recommended that, I'll check it out.  Based on the =

prices that Mike offered it seems crazy to go for a mere 128M, I think that=
 a=20
1G card would do best.  I could use it for the journal of the mail store fi=
le=20
system and for the entire mail spool.  This should multiply mail delivery=20
performance by a factor of at least 4 I think!  Given the price difference =

between 128M and 1G, maybe I should be looking at 2G...

> However, the main strength of flash/RAM devices is that you can do
> random writes very fast. For a journal deice all access will be
> sequential, so there may not be much advantage compared to using a
> seperate disk for the journal? I've never tried, so I'm not sure exactly
> how well it would work.

One significant issue of RAM is that there's almost zero latency.  Doing a =

synchronous write to disk (IE any journal write) takes a significant amount=
=20
of time.  Moving that to RAM should improve things a lot.

> Is your server read- or write- bound? I've found that some mailservers
> are IO-bound because of reads (I guess pop- and imap-servers that are
> polling), and then the external journal is not likely to help.

In this case the machines each have 4G of RAM.  The total RAM for the mail =

cluster is four times what was used for the Solaris cluster, and Intel X86 =

architecture uses less RAM than SPARC (32bit CISC vs 64bit RISC) and I=20
suspect that the software we're now using (Qmail and Courier) is more memor=
y=20
efficient than Netscape too.  Overall we have heaps more cache memory than =

before, I'm seeing 20 reads per second and 160 writes per second at times o=
f=20
peak load.

I don't think that the ratio of reads and writes will change, the people wh=
o=20
have their machines constantly polling for mail are the ones who receive th=
e=20
most mail, so therefore for reads it all stays in cache.

When we scale the machines up to more users if the RAM proves inadequate th=
en=20
we can always upgrade the servers to 8G of RAM each if necessary...

--=20
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

