From: Mat <jackdachef@gmail.com>
Subject: Re: Reiser4: errors AFTER fsck
Date: Sat, 5 Apr 2008 12:06:44 +0000 (UTC)
Message-ID: <loom.20080405T115310-647@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org

Volker,

storing the portage-tree on a "critical" partition such as /var isn't p=
robably a
good idea (yet),=20
reiser4 gets more stable on an almost daily / weekly basis now but I st=
ill have
the feeling that it's somewhat fragile in terms of use as a / (root / s=
ystem)
partition; data-partitions seem to be completely rock-solid & safe, tho=
ugh :)

therefore splitting the /var partition into one for the portage-tree an=
d one for
the other stuff probably will help prevent such incidents (=3D=3D data =
corruption)
in the near future until those little discrepancies are sorted out

e.g. I need my system to have almost 100% availability for study so I c=
reated=20
a=20

/usr/portage (portage-tree) partition
and a / (system-partition)
in addition to that weekly stage4-tarballs are created in case of corru=
ption so
that the system can be restored in around 20 minutes
I haven't encountered any severe problems in the past, despite using un=
stable
kernels & system, toolchain, etc.


if you have the time & resources to heavily test reiser4 (unfortunately=
 I don't
have them anymore) just go ahead,
this will help reiser4 to mature even faster so that it can be used by =
a broader
user-base, ..., and in the long term - mainline-inclusion


Gl=C3=BCck Auf :) ,
Mat

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
