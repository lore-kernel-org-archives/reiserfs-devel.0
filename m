From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: non volatile ram devices
Date: Thu, 5 Dec 2002 11:38:26 +0100
Message-ID: <20021205113826.B25528@vestdata.no>
References: <200212042059.35300.russell@coker.com.au> <20021204212447.C20004@vestdata.no> <200212051000.32340.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200212051000.32340.russell@coker.com.au>; from russell@coker.com.au on Thu, Dec 05, 2002 at 10:00:32AM +0100
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell Coker <russell@coker.com.au>
Cc: linux-ide-arrays@lists.math.uh.edu, ReiserFS <reiserfs-list@namesys.com>, Mike Jadon <mikej@umem.com>

On Thu, Dec 05, 2002 at 10:00:32AM +0100, Russell Coker wrote:
> > Even if the device is just a regular disk it should give you a real
> > performance boost. Depending on your RAID-setup, it may not be the
> > throughput, but the seeking back and forth between the journal and the
> > rest of the disk that kills performance. Having the journal on a
> > seperate disk solves that problem.
>=20
> True.  However I could only put in a single extra disk, and I don't want =
to=20
> use non-RAID...

Unless you use two ramdisks you still have a single point of failure.
Not sure exactly how the reability of the ramdrive is compared to a
disk?



--=20
Ragnar Kj=F8rstad
