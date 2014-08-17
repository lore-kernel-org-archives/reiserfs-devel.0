From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/7] reiser4: batch discard support (FITRIM ioctl): initial implementation.
Date: Mon, 18 Aug 2014 00:29:59 +0400
Message-ID: <1513582.NQMWUjKG6U@intelfx-laptop>
References: <1408292795-1841-1-git-send-email-intelfx100@gmail.com> <53F10FA3.7050507@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2691752.kFPu6jvt4O"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=HSdkEM5iT4S3gvpsPiUfTS/ZYSPImwJofTmN/6a/dMs=;
        b=kJ0WmarjQ6RJtmKS75t6xv8urwHr5urAvaiZ+JlJW4f0gOyqOD8AbkjPA7421yFIhm
         zr0xIa3xzj49Bj0JGnfi4cb3RMxTmjmpNwYBKw2hxy2M0JZasISDlwPM23V8h97DcaTE
         gUr4d8GyyijyOOXvxZzgDQKXByoT0dve7pn7uaaXZwE88JEwIrldM67dM9VFu3NPwlzL
         J/poDuoQl2meRuzBhTEPQE99HavY/r+qQFOJfxvE1+PZUdSRBtLs2h2vdXA6nSWC9nsx
         9rSZDl845dLR9KPWG1vzKV5cRLCgfvmi9Eahywll0C2HILA2bgQj7V1F7cLdiWaU1kY0
         ZB4Q==
In-Reply-To: <53F10FA3.7050507@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2691752.kFPu6jvt4O
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 17 August 2014 at 22:25:07, Edward Shishkin wrote:=09
> Great, thanks!
> I'll take a look at leisure.
> What is the status of this code? Did you test it?

The v1 does not compile and is bogus.
The v2 works for me; tested 1) in idle and 2) simultaneously with
    while :; do rm -rf *; git reset --hard; done
on the Linux source tree on the same partition, ten times in a row.
No corruptions so far, however, there has been only one testing session=
.

I think I'll schedule a hourly fstrim to all partitions involved.

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> Edward.
>=20
>=20
> On 08/17/2014 06:26 PM, Ivan Shapovalov wrote:
> > This patch series implements FITRIM ioctl support in reiser4.
> >
> > The FITRIM ioctl is supposed to be applied to any directory inside =
the target
> > filesystem. At least, this can be deduced from `fstrim` utility beh=
avior on
> > mainstream filesystems (e. g. ext2/3/4).
> >
> > The idea of implementation is per Edward's advices: FITRIM handler =
iteratively
> > grabs a portion of disk space, sequentially allocates extents withi=
n grabbed
> > space and commits the resulting atom. This way we avoid starving co=
ncurrent
> > processes of the disk space. This process is repeated until the par=
tition has
> > been fully scanned and processed.
> >
> > Points I'm really uncertain of:
> > - grabbing fixed amount of space (new BA_SOME_SPACE flag, grabs 25%=
 of disk space)
> > - creation of empty atoms (reiser4_create_atom())
> > - handling of empty atoms in commit_current_atom()
> >
> > v2: - fix PATCH 5/7 "reiser4: txnmgr: call reiser4_post_write_back_=
hook() for empty atoms."
> >        * fix a typo
> >        * release atom spinlock before calling reiser4_post_write_ba=
ck_hook()
> >
> > Ivan Shapovalov (7):
> >    reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixe=
d amount of space.
> >    reiser4: block_alloc: add a "forward" parameter to reiser4_block=
nr_hint to allocate blocks only in forward direction.
> >    reiser4: txnmgr: free allocated but unneeded atom in atom_begin_=
and_assign_to_txnh().
> >    reiser4: txnmgr: add reiser4_create_atom() which creates an empt=
y atom without capturing any nodes.
> >    reiser4: txnmgr: call reiser4_post_write_back_hook() for empty a=
toms.
> >    reiser4: batch discard support: add a dummy FITRIM ioctl handler=
 for directories.
> >    reiser4: batch discard support: actually implement the FITRIM io=
ctl handler.
> >
> >   fs/reiser4/block_alloc.c         |   6 ++
> >   fs/reiser4/block_alloc.h         |  10 ++-
> >   fs/reiser4/plugin/dir/dir.h      |   2 +
> >   fs/reiser4/plugin/file_ops.c     |  62 ++++++++++++++++++
> >   fs/reiser4/plugin/object.c       |   6 +-
> >   fs/reiser4/plugin/space/bitmap.c |   3 +-
> >   fs/reiser4/super_ops.c           | 131 ++++++++++++++++++++++++++=
+++++++++++++
> >   fs/reiser4/txnmgr.c              |  57 +++++++++++------
> >   fs/reiser4/txnmgr.h              |   2 +
> >   9 files changed, 255 insertions(+), 24 deletions(-)
> >
> 
--nextPart2691752.kFPu6jvt4O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPxEMcACgkQxUKljSIMAnDVKgEAl7RaiyGk0spT7u4BWfdasRrg
wk7q5gOUGC63uVWo9U0BAJYTa5FxmUUowz20Sw58Ev51lFxyZVcaMGzsSjEmgc2P
=Nkyb
-----END PGP SIGNATURE-----

--nextPart2691752.kFPu6jvt4O--

