From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Reiserfs with Samba vs NetApp Filer (purely performance)
Date: Sun, 15 Dec 2002 00:11:26 +0100
Message-ID: <20021215001126.J2727@vestdata.no>
References: <3DFBA067.5040601@namesys.com> <Pine.LNX.4.33.0212141429010.2681-100000@ns.aus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0212141429010.2681-100000@ns.aus.com>; from rsharpe@richardsharpe.com on Sat, Dec 14, 2002 at 02:34:06PM -0800
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Sharpe <rsharpe@richardsharpe.com>
Cc: Hans Reiser <reiser@namesys.com>, darren <teodarren@myrealbox.com>, 'Russell Coker' <bofh@coker.com.au>, reiserfs-list@namesys.com

On Sat, Dec 14, 2002 at 02:34:06PM -0800, Richard Sharpe wrote:
> If those are your choices, then I would rank them:
>=20
>   NetApp F870, Linux with ReiserFS and Samba, Win2K
>=20
> John Terpstra has done some testing with a modified cifs_bm which confirm=
s=20
> that Linux with EXT2/3 or ReiserFS outperforms Win2K on the same hardware.
>=20
> However, my testing of the NetApp suggests it will outperform the other=20
> two choices.

What kind of benchmarks, and what were the results?

> If you choose to use Samba, you will want to make sure that the sendfile =

> stuff is implemented. Unfortunately, the directory indexing in Reiser doe=
s=20
> not help that much a lot of the time because Samba is forced to do=20
> directory scans because it has to implement case-independent=20
> lookups/searches.

Isn't that an configuration-option?

As a sidenote, I think it wouldn't be too hard to make reiserfs
optionally case-insensitive, but still able to use indexes. Perhaps it
would even be possible to have two virtual directories pr traditional
directory? one that has a regular index and one that has a
case-insensitive index. Of course this is not relevant for the
right-here right-now choice of fileservers, but....


--=20
Ragnar Kj=F8rstad
