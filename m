From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <linux-ide-arrays@ragnark.vestdata.no>
Subject: Re: non volatile ram devices
Date: Wed, 4 Dec 2002 21:24:47 +0100
Message-ID: <20021204212447.C20004@vestdata.no>
References: <200212042059.35300.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200212042059.35300.russell@coker.com.au>; from russell@coker.com.au on Wed, Dec 04, 2002 at 08:59:35PM +0100
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell Coker <russell@coker.com.au>
Cc: linux-ide-arrays@lists.math.uh.edu, ReiserFS <reiserfs-list@namesys.com>

On Wed, Dec 04, 2002 at 08:59:35PM +0100, Russell Coker wrote:
> I have some servers that are giving inadequate disk performance for Maild=
ir=20
> mail spools.  They are running kernel 2.4.19 (2.4.20 upgrade is planned) =
and=20
> using ReiserFS for everything that's important.

One thing you might considder is replacing the reiserfs hash with a
maildir-specific hash. In my rather limited testing I found that it was
significantly faster; I think some tests gave 200-300% speed
improvement.

But, as I said, there was only limited testing. Don't go this route
unless you have the time to test it properly both for stability and
performance.


> What I am thinking of doing is using a kernel that supports data journall=
ing=20
> which should increase performance, but still probably won't give me enoug=
h. =20
> So I am thinking of using an "external journal" (or using software RAID t=
o=20
> put the part of the partition containing the journal on a different devic=
e).
>=20
> The device containing the journal would be something much faster than phy=
sical=20
> media.

Even if the device is just a regular disk it should give you a real
performance boost. Depending on your RAID-setup, it may not be the
throughput, but the seeking back and forth between the journal and the
rest of the disk that kills performance. Having the journal on a
seperate disk solves that problem.


> Does anyone know of an affordable ($1000 or less) device that can survive=
=20
> unexpected power outages of at least 24 hours duration, can commit a writ=
e in=20
> less than 1ms, supports unlimited writes, and connects to a IDE or SCSI b=
us=20
> (or PCI if there's a suitable Linux driver).

Did you check out Micro Memory Inc? (http://www.umem.com/)=20
I think they have some PCI-cards (with linux-drivers) which may be
suitable for this.=20

However, the main strength of flash/RAM devices is that you can do
random writes very fast. For a journal deice all access will be
sequential, so there may not be much advantage compared to using a
seperate disk for the journal? I've never tried, so I'm not sure exactly
how well it would work.

Is your server read- or write- bound? I've found that some mailservers
are IO-bound because of reads (I guess pop- and imap-servers that are
polling), and then the external journal is not likely to help.



--=20
Ragnar Kj=F8rstad
