From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 06 Jun 2003 11:41:10 +0200
Message-ID: <1054892469.1975.39.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <20030605090435.GE7950@namesys.com>
	 <1054804624.1997.39.camel@wusel.schnulli.de>
	 <200306052029.41437.russell@coker.com.au>
	 <1054809903.1995.83.camel@wusel.schnulli.de> <3EDF7424.7010003@gmx.net>
	 <20030605170616.GD22550@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14470-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030605170616.GD22550@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Russell Coker <russell@coker.com.au>, reiserfs-list@namesys.com

Am Don, 2003-06-05 um 19.06 schrieb Ragnar Kj=F8rstad:
> On Thu, Jun 05, 2003 at 06:47:32PM +0200, Carl-Daniel Hailfinger wrote:
> > Heinz-Josef Claes wrote:
> > >From the debian web page:
> > >
> > > http://packages.debian.org/testing/utils/storebackup.html
> > >
> > > File comparisons are done with MD5 checksums, so no changes go
> > > unnoticed.
> >=20
> > If you believe the last sentence, I have a bridge to sell.
> >=20
> > To be more exact: MD5 is a 128=3D2^7 bit hash. Assuming a file length o=
f 4kB
> > =3D 2^8*4096=3D2^20 bits, approximately 2^(2^(20-7))=3D 2^8192=3D 10^24=
57
> > different files have the same hash.
>=20
-> It's an additionally backup to a normal backup to a tape. <-
(BTW: storebackup exists for 2 years now, 1 year on sourceforge and I
never heard of problems like this, so I think it will not happen too
often :-))

> Or explained differently, every time you change a file there is a=20
> 1/(2^128) chance that the backup-system will not notice.
>=20
> I would be willing to take the risk.
>=20
>=20
> However, calculating a checksum of all your data is relatively slow -
> I'm surprised it doesn't use timestamps. Or maybe it's optional?
>=20
> (Of course in some situations timestamps can not be relied on, but if
> your application is not one of those it should be much much faster)
>=20

The application works a follows:

The first backup is slow because all md5 sums have to be calculated
(thas fast) and the files have to be copied/compressed (that's slow).
The md5 files are stored (beside other information) in a special file.

The following backups will
1. look if the same file at the same place is unchanged (ctime, mtime,
size). If 'yes', it make a link to the old one and takes the md5 sum of
the old file and stores that md5 sum in the special file of that backup.
2. If it cannot find the same file at the same place, or the file has
changed, it will calculate the md5 sum and look for it in the old
backup. If it finds the md5 sum, it will make the link, otherwise it
will copy/compress the file.

Calculating md5 sums, compression and copying is done in parallel to
reading directories and linking to improve performance. There are
several queues. It can also get advantage from multiprocessor systems,
because multiple compressions can happen in parallel.

The real algorithm is a little bit more complicated, among other things
because it can link between independent backups (eg. from different
machines, or you make a big backup with all files every week and a
faster, smaller one every day and share the inodes between them).

-> So it uses timestamps (and size), but if they are not equal but the
file hasn't changes, there is only a little overhead. Md5 sums are
stored in berkeley dbm files during the backup.


Regards,

--=20
Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk

Q: How does a Unix guru have sex?
A: gunzip && strip && touch && finger && mount && fsck && \
more && yes && fsck && fsck && fsck && umount && sleep


