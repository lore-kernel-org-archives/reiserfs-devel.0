From: Kurt <kpalmer@advance.net>
Subject: Filesystem Corruption
Date: Thu, 6 Jun 2002 14:00:01 -0400
Message-ID: <200206061400.01445.kpalmer@advance.net>
Reply-To: kpalmer@advance.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,
=09I currently have a system configured as follows :-
1) LVM version 1.0.1-rc4(ish)(03/10/2001)
2) /dev/PROJ/proj on /proj type reiserfs (rw,noatime,notail)
3) /dev/PROJ/proj        239G  142G   97G  60% /proj
4) 2.4.17 with reiserfs tools 3.x.0k
5) Reiserfs compiled in (CONFIG_REISERFS_CHECK set to NO)
6) 256 MB RAM ("sar -r" shows memory usage is not abnormal for this box)
7)Tuns of very small files based on log processing
I am told by my co-worker that the system unresponsive and showed reiserf=
s=20
related errors on the console.
Upon restart they noticed that the file=20
/proj/webtrends/receive/bama/www3/access.01Jun.r.gz was unreadable by roo=
t=20
(permission denied).
I did a reiserfsck on the drive and noticed that access.01Jun.r.gz return=
ed an=20
error stating the file pointed to nowhere.
I was unable to complete a reiserfsck --fix-fixable because of the length=
 of=20
time that this (fsck) process took since this was an unscheduled downtime=
=2E
During the weekend i will attempt to do the fsck again, however i really=20
needed to know if this problem has been observed by anyone else, and what=
=20
steps they took to fix the problem.
-Kurt



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Kurt Palmer                                      SysAdmin
kpalmer@advance.net                Advance Internet
201-459-2846

