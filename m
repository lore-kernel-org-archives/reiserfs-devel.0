From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations has been left out?
Date: Thu, 21 Aug 2014 00:34:14 +0400
Message-ID: <5431496.Ue9YL3Eeu2@intelfx-laptop>
References: <10671542.MCAVDCHSND@intelfx-laptop> <53F3E03E.7030805@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4587201.C0ce2y4c6a"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=oHZ8wQ774+H8wGvzpNrU8jOQUED01qRCCSFjfKZhZoQ=;
        b=FWg4Vv5szNjrHdTAJVc8+QRdErX5zg82+jiGUoKtH9ws2KnA453HZ/OfNrSKvYNOI2
         G1V8abeOXLAZtbDBxu3+liE0H5ZcvJv0Oo/KdVVCLcY92wRSzyKCWAbWZWbHJTxaNqOJ
         PS776KQCfUI4j7c2+1u0yqn/HPLRC4U2Wvi/r8oX1ydCOuNsUZmtU3WJfKdVF4w4XXLs
         cH7hLK4qauwDROodw/6gKM35srdfBBv5PLUukjuzjlHNtNJtgocKHkGReEp2q7UrqWi0
         DaiF1/kiqNU1gVsPZEm8P0alD8fEUmWJ4bAoB9YF6OEO+RDi+dbKyqjhYX6jC4E3Pt/m
         k8Mg==
In-Reply-To: <53F3E03E.7030805@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart4587201.C0ce2y4c6a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 August 2014 at 01:39:42, Edward Shishkin wrote:=09
>=20
> On 08/20/2014 12:32 AM, Ivan Shapovalov wrote:
> >  From `git log` I've seen that VFS people intend to replace ->aio_r=
ead() and
> > ->aio_write() of struct file_operations with new methods ->read_ite=
r() and
> > ->write_iter().
> >
> > (Along with a couple of related new helpers, differing from previou=
s just in
> > calling _iter methods instead of aio_ ones.)
> >
> >  From other filesystems it seems that these are simple drop-in repl=
acements
> > (however, well, I have zero familiarity with VFS). So here is a que=
stion:
> > is there any intentional reason that generic_file_aio_write() is no=
t used
> > in reiser4?
>=20
>=20
> Currently reiser4 is a set of two filesystems which differ in methods=

> of handling regular files. For VFS we provide "dispatchers", which pa=
ss
> management to appropriate plugin (UNIX_FILE or CRYPTCOMPRESS).
>=20
> UNIX_FILE plugin doesn't use generic write for performance reasons
> (I'll try to find the respective mailing thread). CRYPTCOMPRESS doesn=
't
> use it for compatibility reasons: I don't know how how to rewrite it
> gracefully using the generic write method.
>=20
> Edward.


Thanks for explanation! So, does this patch make any sense?

=2D-=20
Ivan Shapovalov / intelfx /

> >
> > What follows is a simple patch that I've currently applied to my ow=
n kernel
> > (seems to be the only significant vfs change affecting filesystems)=
, however,
> > I fear that these code-paths are not generally used, so my "works f=
or me"
> > isn't really representative. Could you please clarify the situation=
 here?
> >
> >  From 81172835255a01718c2c256942d5887825a0cd7a Mon Sep 17 00:00:00 =
2001
> > From: Ivan Shapovalov <intelfx100@gmail.com>
> > Date: Tue, 19 Aug 2014 14:33:35 +0400
> > Subject: [PATCH] Adjust reiser4 to 3.16: ->{read,write}_iter of str=
uct
> >   file_operations.
> >
> > 1. ->aio_{read,write} of struct file_operations are being replaced =
with ->{read,write}_iter.
> > 2. do_sync_{read,write} are being replaced with new_sync_{read,writ=
e}.
> > 3. generic_file_splice_write is being replaced with iter_file_splic=
e_write.
> >
> > Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> > ---
> >   fs/reiser4/plugin/file/cryptcompress.c | 2 +-
> >   fs/reiser4/plugin/file/file.c          | 2 +-
> >   fs/reiser4/plugin/object.c             | 4 ++--
> >   3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/reiser4/plugin/file/cryptcompress.c b/fs/reiser4/pl=
ugin/file/cryptcompress.c
> > index 8af388d..b0109fb 100644
> > --- a/fs/reiser4/plugin/file/cryptcompress.c
> > +++ b/fs/reiser4/plugin/file/cryptcompress.c
> > @@ -2964,7 +2964,7 @@ ssize_t read_cryptcompress(struct file * file=
, char __user *buf, size_t size,
> >   =09=09reiser4_exit_context(ctx);
> >   =09=09return result;
> >   =09}
> > -=09result =3D do_sync_read(file, buf, size, off);
> > +=09result =3D new_sync_read(file, buf, size, off);
> >  =20
> >   =09context_set_commit_async(ctx);
> >   =09reiser4_exit_context(ctx);
> > diff --git a/fs/reiser4/plugin/file/file.c b/fs/reiser4/plugin/file=
/file.c
> > index 94029cd..e65c48d 100644
> > --- a/fs/reiser4/plugin/file/file.c
> > +++ b/fs/reiser4/plugin/file/file.c
> > @@ -1752,7 +1752,7 @@ ssize_t read_unix_file(struct file *file, cha=
r __user *buf,
> >   =09switch (uf_info->container) {
> >   =09case UF_CONTAINER_EXTENTS:
> >   =09=09if (!reiser4_inode_get_flag(inode, REISER4_PART_MIXED)) {
> > -=09=09=09result =3D do_sync_read(file, buf, read_amount, off);
> > +=09=09=09result =3D new_sync_read(file, buf, read_amount, off);
> >   =09=09=09break;
> >   =09=09}
> >   =09case UF_CONTAINER_TAILS:
> > diff --git a/fs/reiser4/plugin/object.c b/fs/reiser4/plugin/object.=
c
> > index 553f1e2..e431e1f 100644
> > --- a/fs/reiser4/plugin/object.c
> > +++ b/fs/reiser4/plugin/object.c
> > @@ -188,7 +188,7 @@ static struct file_operations regular_file_f_op=
s =3D {
> >   =09.llseek =3D generic_file_llseek,
> >   =09.read =3D reiser4_read_dispatch,
> >   =09.write =3D reiser4_write_dispatch,
> > -=09.aio_read =3D generic_file_aio_read,
> > +=09.read_iter =3D generic_file_read_iter,
> >   =09.unlocked_ioctl =3D reiser4_ioctl_dispatch,
> >   #ifdef CONFIG_COMPAT
> >   =09.compat_ioctl =3D reiser4_ioctl_dispatch,
> > @@ -198,7 +198,7 @@ static struct file_operations regular_file_f_op=
s =3D {
> >   =09.release =3D reiser4_release_dispatch,
> >   =09.fsync =3D reiser4_sync_file_common,
> >   =09.splice_read =3D generic_file_splice_read,
> > -=09.splice_write =3D generic_file_splice_write
> > +=09.splice_write =3D iter_file_splice_write
> >   };
> >   static struct address_space_operations regular_file_a_ops =3D {
> >   =09.writepage =3D reiser4_writepage,
> 
--nextPart4587201.C0ce2y4c6a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlP1BlUACgkQxUKljSIMAnCTQQEAnl6cs0hoqaMPeeiWhvuW+81Z
DxWrMDba1HcZoBaiDKkBALXimAsMJJtEIL3po7TaWjYvBMV+YEDGjnetWoe2KzLX
=OdrG
-----END PGP SIGNATURE-----

--nextPart4587201.C0ce2y4c6a--

