From: Bernd Schubert <bernd.schubert@pci.uni-heidelberg.de>
Subject: Re: quota, reiserfs v3, 2.6.11.7
Date: Mon, 2 May 2005 14:05:51 +0200
Message-ID: <200505021405.52857.bernd.schubert@pci.uni-heidelberg.de>
References: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk> <200505021253.57878.bernd.schubert@pci.uni-heidelberg.de> <20050502110759.GA6381@melkor.dnp.fmph.uniba.sk>
Reply-To: bernd-schubert@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050502110759.GA6381@melkor.dnp.fmph.uniba.sk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Cc: reiserfs-list@namesys.com

On Monday 02 May 2005 13:07, you wrote:
> On Mon, May 02, 2005 at 12:53:57PM +0200, Bernd Schubert wrote:
> > Hello Radovan,
> >
> > > Is anyone using similar setup? (reiserfs+quotas+2.6.11.7+nfs)
> >
> > our main file server is running 2.6.11.7 with reiserfs +  nfs + quota.
>
> but probably not over RAID-1 :-)

Sure, we have also RAID-1, only forgot to write that ;)

Though, the nfs-exports are drbd devices - also raid1, but the raid code is=
=20
AFAIK not completely identical.

>
> > To your reiserfs problems, are you by any chance using a SIL 3114 SATA
> > controller? We had non-memory related data corruption on disks attached
> > to
>

Do you have ecc memory? If you have, you could/should monitor it e.g. with=
=20
bluesmoke. To my experience those reiserfs problems you have are usually=20
memory related - with the one disk-controller-related exception we recently=
=20
had.

Bernd

=2D-=20
Bernd Schubert
Physikalisch Chemisches Institut / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg
e-mail: bernd.schubert@pci.uni-heidelberg.de
