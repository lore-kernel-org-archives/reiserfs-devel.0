From: Richard Sharpe <rsharpe@richardsharpe.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer (purely performance)
Date: Sat, 14 Dec 2002 18:13:48 -0800 (PST)
Message-ID: <Pine.LNX.4.33.0212141809400.2681-100000@ns.aus.com>
References: <3DFBBD10.5000408@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DFBBD10.5000408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, darren <teodarren@myrealbox.com>, 'Russell Coker' <bofh@coker.com.au>, reiserfs-list@namesys.com

On Sun, 15 Dec 2002, Hans Reiser wrote:

> Ragnar Kj=F8rstad wrote:
>=20
> >>If you choose to use Samba, you will want to make sure that the sendfil=
e=20
> >>stuff is implemented. Unfortunately, the directory indexing in Reiser d=
oes=20
> >>not help that much a lot of the time because Samba is forced to do=20
> >>directory scans because it has to implement case-independent=20
> >>lookups/searches.
> >>   =20
> >>
> >
> >Isn't that an configuration-option?
> >
> >As a sidenote, I think it wouldn't be too hard to make reiserfs
> >optionally case-insensitive, but still able to use indexes. Perhaps it
> >would even be possible to have two virtual directories pr traditional
> >directory? one that has a regular index and one that has a
> >case-insensitive index. Of course this is not relevant for the
> >right-here right-now choice of fileservers, but....
> >
> >
> > =20
> >
> There is quite a lot that could be done to optimize for Samba, but=20
> nobody is sponsoring it unfortunately.  Seems like some money could be=20
> made by a clever appliance vendor....

The issues are complex. Samba still needs some work to make it perfect for =

appliance vendors, for example, although Andrew is talking about an NTFS=20
layer which will make things better.

Those same appliance vendors will need/want file system changes, esp if=20
they are trying to support NFS and CIFS off of the same box, and they tend =

to want to push many of the clever bits into the file system and keep them =

propietary :-) This is certainly true of the three vendors that I have any =

experience with.

However, I expect some patches for XFS will become available in the not=20
too distant future.

Regards
-----
Richard Sharpe, rsharpe[at]ns.aus.com, rsharpe[at]samba.org,=20
sharpe[at]ethereal.com, http://www.richardsharpe.com

