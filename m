From: Russell Coker <russell@coker.com.au>
Subject: Re: non volatile ram devices
Date: Thu, 5 Dec 2002 11:45:00 +0100
Message-ID: <200212051145.00696.russell@coker.com.au>
References: <200212042059.35300.russell@coker.com.au> <200212051000.32340.russell@coker.com.au> <20021205113826.B25528@vestdata.no>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021205113826.B25528@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?iso-8859-1?q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: linux-ide-arrays@lists.math.uh.edu, ReiserFS <reiserfs-list@namesys.com>, Mike Jadon <mikej@umem.com>

On Thu, 5 Dec 2002 11:38, Ragnar Kj=F8rstad wrote:
> On Thu, Dec 05, 2002 at 10:00:32AM +0100, Russell Coker wrote:
> > > Even if the device is just a regular disk it should give you a real
> > > performance boost. Depending on your RAID-setup, it may not be the
> > > throughput, but the seeking back and forth between the journal and the
> > > rest of the disk that kills performance. Having the journal on a
> > > seperate disk solves that problem.
> >
> > True.  However I could only put in a single extra disk, and I don't want
> > to use non-RAID...
>
> Unless you use two ramdisks you still have a single point of failure.

True, but then both the RAID controller and the motherboard are single poin=
ts=20
of failure already.

> Not sure exactly how the reability of the ramdrive is compared to a
> disk?

The RAM drive has no moving parts and should be inherantly more reliable.  =
I=20
don't recall ever having RAM die on a machine that had been functioning=20
properly except when mechanical issues apply (IE clumsy people taking=20
machines apart).  Hard drives die regularly.  Get a busy machine like a new=
s=20
server or a mail server and you expect to keep replacing dead hard drives a=
s=20
they wear out.

--=20
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

