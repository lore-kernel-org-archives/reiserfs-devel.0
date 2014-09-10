From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4 (ccreg40): very slow mount, poor unlink performance, questions about compression modes
Date: Thu, 11 Sep 2014 01:39:33 +0400
Message-ID: <4194447.EgbZsqfSzA@intelfx-laptop>
References: <1466481.l6KPymqJEh@intelfx-laptop> <5410B1CB.3080705@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1438289.GyvWse64EE"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=4Ntyr76HLVa8UDf1mCQOtjf1LD46HY8mAwPfylo4BE4=;
        b=uAsMNmVLlLU0ckuMvUEtkf3e9jzG5DnT7XI75KVbDrg23OOAjo8QiuGcx0nSDsqUwG
         cIuNtZEfh3GC+6cuzMq0vDI8f4MuxJl/ZiVtgpNwMcxWVskPr0dytyz8/CkZrtRt36cG
         7+tt62eE+KdSKrhVrQdLV387Gx+MUsSJRJJjamR75k//p4RMO/+X+lmC6DqgY+SUT5FL
         +HiCQILrLOSkHI5bVH5ez3wSqYx5Io2ZqeTemfpXUwF8GAycOvI6sBHS6y5WhqiX8/Xr
         uWtQ0tBAueb5+XDW7oovnJXqnrnTrskM2ez0brQb6pM4KgOVRux3ID6B9rZrZ0HCVTJp
         NVRg==
In-Reply-To: <5410B1CB.3080705@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>


--nextPart1438289.GyvWse64EE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 10 September 2014 at 22:17:15, Edward Shishkin wrote:=09
> On 09/10/2014 09:00 PM, Ivan Shapovalov wrote:
> > Hi!
> >
> > The preamble: recently I had to force-change my configuration (the =
old laptop
> > was stolen). What I have now is a combination of a tiny 16 GiB SSD =
and a huge
> > 1 TiB HDD.
> >
> > ...So I've placed my /home on HDD. Partition size is 800 GiB, forma=
tting
> > options are "create=3Dccreg40,compress=3Dgzip1,compressMode=3Dlatt"=
 and I have a few
> > questions.
> >
> > 1. What is the recommended compression mode?
>=20
>=20
> The default one (conv).

OK, thanks.

> > More specifically, what is the default "conv" mode? What is its pur=
pose, why is
> > it the default?
>=20
>=20
> In this mode intelligent switches take place in 2 interfaces:
> 1) in FILE interface (if the first 64K of the file are incompressible=
, then
>      management is passed to unix-file plugin forever);
> 2) in COMPRESSION interface (turn on/off compression transform
>      on a dynamic lattice).
>=20
> In other compression modes switches take place only in COMPRESSION
> interface.
>=20
>=20
> > I'm asking, because I wasn't able to understand its purpose from co=
de, and the
> > code itself looks hackish in some places (hardcoded fallback to ext=
ent-only
> > files,
>=20
>=20
> Actually, this is implementation of a compression mode, not a hardcod=
ed
> fallback.
>=20
>=20
> >   hardcoded policy, hardcoded fallback to "latt" in many cases, etc=
).
>=20
>=20
> ditto

Yes, I understand that this is implementation and it doesn't have an ob=
ligation
to be configurable in every aspect... but still it feels somewhat stran=
ge.
E. g. why "extents only" formatting is forced when a file is decided to=
 be
incompressible? Why the heuristic in FILE interface check (compressible=
 only if
size can be reduced twice) is different from the one in COMPRESSION int=
erface
(compressible if size can be reduced at all)?

(I'm sorry for too many questions. I'm just curious.)

> > 2. The mount time of a 800-GiB partition is >20 seconds. And with
> > dont_load_bitmap it's around 1-2 seconds. Why so much?
>=20
>=20
> By default all bitmap blocks are loaded to memory at mount time.
> Now calculate a number of bitmap blocks for 800-GiB partition that
> should be read from disk.

25 MiB of bitmaps. 20 seconds still looks strange...
Are the blocks specially processed? Don't see anything.

> >   Why other filesystems
> > have drastically less mount times? If they have an equivalent of
> > dont_load_bitmap enabled by default, why don't we do it?
>=20
>=20
> For historical reasons. I recommended to not use large partitions
> for reiser4, so there wasn't any need in this option.

OK...

> > 3. Given a directory tree with ~20k files of total size around 20 G=
iB,
> > its removal takes forever. From strace I see that a single unlink t=
akes
> > ~1 second. Again, why so much? Is it related to my choice of "latt"=
 compression
> > mode over the default "conv"?
>=20
>=20
> Yes, in particular.
> "latt" means that all file bodies are represented by fragments in=20
> formatted nodes.

So... are all cryptcompress files stored in formatted nodes, without
any equivalent of extents?

> > 3a. I can reproduce the "directory not empty" bug :) Interestingly,=
 it is
> > always the same directory under the aforementioned huge hierarchy. =
(I've
> > done the unpack-remove cycle a few times.)
>=20
>=20
> I've made a conclusion that this is caused by unexpected disappearing=

> of a record, which represents a directory entry in the directory item=

> (currently directory items are managed by cde ITEM plugin, aka "compo=
und
> directory entries"). In the error path (ENOENT) the size of the direc=
tory is
> not decremented, which makes the directory undeletable. I still don't=
 know
> who kills the entries. Special debugging info is needed to find/fix i=
t.

What kind of information is needed?

Thanks for explanations and hints,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1438289.GyvWse64EE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQQxRoACgkQxUKljSIMAnBRDwEA1gJuJorK3GMSeu6dvYcvngwM
axwppiyIXWJ8pZJQoZoA/0liYp6TQxgwuiwIHbdhBZZu3ZanfAX7TVvImjXcqx7v
=gX6D
-----END PGP SIGNATURE-----

--nextPart1438289.GyvWse64EE--

