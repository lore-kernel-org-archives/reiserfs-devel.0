From: Frank Van Damme <frank.vandamme@student.kuleuven.ac.be>
Subject: rebuildtree dangerous?
Date: Sun, 12 Jan 2003 17:29:58 +0100
Message-ID: <200301121729.58989.frank.vandamme@student.kuleuven.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

I am having an unfortunate problem with my root filesystem (system only h=
as a=20
separate /boot), it has some files which are unreadable. That means, I ca=
n't=20
rm, chmod or even ls them even with root privileges. This is probably due=
 to=20
too many forced poweroffs (no faulty hd according to badblocks). reiserfs=
ck=20
--check tells me I only can correct these errors with a --rebuild-tree.=20

What I want to know is: I can backups all data (no problem), but=20

a) how big is the chance that reiserfsck will destroy the partition?
b) what if the procedure gets broken in the middle (power outage,...), wi=
ll it=20
mean Total Destruction?

I would use the reiserfs tools included on the mandrake 9.0 cdrom, since =
this=20
is a most convenient tool as a rescue disk. The disk in question is a 10 =
gig=20
ide wd-caviar:=20
/dev/hda5 reiserfs    9.1G  7.5G  1.6G  82% /


thx in advance!

--=20
Frank


