From: ivan <ivan@t1.unisoftbg.com>
Subject: production use of reiserfs
Date: Fri, 28 Nov 2003 08:46:12 +0200
Message-ID: <200311280846.12697.ivan@t1.unisoftbg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

We are collecting our statistic for the last 9 m. of using linux + postgr=
eSQL=20
as oracle+windows alternative in production.

We are using linux redhat (7.3 and 9.0) + reiserfs (it was recomendet as=20
stable and fast).

For this time we have 6 filesystem crashes (all after powerdown) with tot=
al=20
database lose.

It is very bad situation because for this period we do not have any probl=
ems=20
with windows + oracle.

So it is now time to see if resierfs is production ready or we need to ch=
ange=20
the filesystem (or OS distro).

My question:

exist somewath special in reiserfs setup on redhat, that we need to chang=
e?
We are using the standart install (linux reiserfs).

We do not make changes on kernel or setup.

Is it good idea to change redhat?

Also it is possible to use redhat AS 3.0, but we do not find any info how=
 to=20
instsall it with reiserfs. Exist any problems on this distro?

regards,
ivan.
