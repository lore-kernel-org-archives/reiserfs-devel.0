From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: mount throws a nikita-3228 on me
Date: Tue, 25 May 2004 13:07:15 +0400
Message-ID: <20040525090715.GF1583@backtop.namesys.com>
References: <20040525080001.GF4990@nysv.org> <1085473856.1915.99.camel@tribesman.namesys.com> <20040525085535.GE1583@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040525085535.GE1583@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>, reiserfs-list@namesys.com

On Tue, May 25, 2004 at 12:55:35PM +0400, Alex Zarochentcev wrote:
> On Tue, May 25, 2004 at 12:30:57PM +0400, Vladimir Saveliev aka Monstr wr=
ote:
> > Hello
> >=20
> > On Tue, 2004-05-25 at 12:00, Markus T=F6rnqvist wrote:
> > > Hi
> > >=20
> > > I took a snapshot from the Namesys BK some days ago, compiled the
> > > 2.6.6-mm2 with high hopes of the future, but it doesn't mount.
> > >=20
> > > It says only small keys are supported. I think it was a Nikita-3228.[=
1]
> > >=20
> >=20
> > You seem to get reiser4 with an error which makes reiser4 to not compile
> > properly.
>=20
> it was missing=20
> #include <linux/config.h> in reiser4.h
>=20
> I just added it to our BK.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/05/24 23:59:58+04:00 zam@crimson.namesys.com=20
#   include linux/config.h  explicitly into reiser4.h
#=20
# reiser4.h
#   2004/05/24 23:59:54+04:00 zam@crimson.namesys.com +1 -0
#   include linux/config.h  explicitly into reiser4.h
#=20
# debug.c
#   2004/05/24 23:59:54+04:00 zam@crimson.namesys.com +1 -0
#   add #include "znode.h" for print_znodes().=20
#=20
diff -Nru a/debug.c b/debug.c
--- a/debug.c	Tue May 25 13:06:00 2004
+++ b/debug.c	Tue May 25 13:06:00 2004
@@ -33,6 +33,7 @@
 #include "context.h"
 #include "super.h"
 #include "txnmgr.h"
+#include "znode.h"
=20
 #include <linux/sysfs.h>
 #include <linux/slab.h>
diff -Nru a/reiser4.h b/reiser4.h
--- a/reiser4.h	Tue May 25 13:06:00 2004
+++ b/reiser4.h	Tue May 25 13:06:00 2004
@@ -6,6 +6,7 @@
 #if !defined( __REISER4_H__ )
 #define __REISER4_H__
=20
+#include <linux/config.h>
 #include <asm/param.h>		/* for HZ */
 #include <linux/errno.h>
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --=20
> Alex.

--=20
Alex.
