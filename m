From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: too many iterations - Reiser 4
Date: Tue, 09 Nov 2004 13:23:55 +0300
Message-ID: <1099995834.2066.64.camel@tribesman.namesys.com>
References: <DEA5D319C867D5119DBD08000674A9F60BCCD34B@vies113a.sie.siemens.at>
	 <16784.34304.615668.400334@thebsh.namesys.com>
	 <opsg6xa5qewwtuxg@user1.49.priv.jetnet>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-64pOuBA/KZnDJH02jzNC"
Return-path: <reiserfs-list-return-22315-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <opsg6xa5qewwtuxg@user1.49.priv.jetnet>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?iso-8859-2?Q?=A3ukasz?= Mierzwa <prymitive@go2.pl>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

--=-64pOuBA/KZnDJH02jzNC
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hello

On Tue, 2004-11-09 at 12:14, =A3ukasz Mierzwa wrote:
> Dnia Tue, 9 Nov 2004 11:55:28 +0300, Nikita Danilov <nikita@clusterfs.com=
> =20
> napisa=B3:
>=20
> >  > > WARNING: Too many iterations: 128 reiser4[ls(30795)]: traverse_tree
> >  > > (fs/reiser4/search.c:488)[nikita-1481]:
> >  > > WARNING: Too many iterations: 256 reiser4[ls(30795)]: traverse_tree
> >  > > (fs/reiser4/search.c:488)[nikita-1481]:
> >  > > WARNING: Too many iterations: 512 reiser4[ls(30795)]: traverse_tree
> >  > > (fs/reiser4/search.c:488)[nikita-1481]:
> >  > > WARNING: Too many iterations: 1024 reiser4[ls(30795)]: traverse_tr=
ee
> >  > > (fs/reiser4/search.c:488)[nikita-1481]:
>=20
> I had this few times too when I tried reiser4, first it was when I was =20
> compiling kernel under 2.6.(6 or 7)-mm with autosnapshots from namesys =20
> with reiser4 as my / partition. The number of iterations grow all the tim=
e =20
> and the system locked itself after some time (about 10 - 20 minutes), I  =

> couldn't do much to stop it, not even reboot couse my system just printed=
 =20
> that it is going to reboot and that's all, seems like it couldn't write  =

> anything to disk.
> Last time when I tried reiser4 (2.6.9-rc*-mm*) I had no problems with =20
> compiling kernel but I it happend once or twice, this time it was random,=
 =20
> just while browsing net.
>=20
> =A3ukasz Mierzwa
>=20
>=20

would you please try to apply the attached patch?

You should also reiserfsck your reiser4 filesystem.

--=-64pOuBA/KZnDJH02jzNC
Content-Disposition: attachment; filename=reiser4.h.diff
Content-Type: text/plain; name=reiser4.h.diff; charset=koi8-r
Content-Transfer-Encoding: 7bit

===== reiser4.h 1.220 vs edited =====
--- 1.220/reiser4.h	2004-11-02 16:01:00 +03:00
+++ edited/reiser4.h	2004-11-09 12:54:07 +03:00
@@ -396,7 +396,7 @@
    I have witnessed more than 800 iterations (in 30 thread test) before cbk
    finished. --nikita
 */
-#define REISER4_MAX_CBK_ITERATIONS    ((unsigned)~0)
+#define REISER4_MAX_CBK_ITERATIONS    500000
 
 /* put a per-inode limit on maximal number of directory entries with identical
    keys in hashed directory.

--=-64pOuBA/KZnDJH02jzNC--

