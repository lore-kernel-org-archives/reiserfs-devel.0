From: Siegfried.Loeschmann@t-online.de (Siegfried =?iso-8859-1?q?L=F6schmann?=)
Subject: On disk and correct bitmaps differ
Date: Thu, 2 Oct 2003 21:28:51 +0200
Message-ID: <200310022128.51416.Siegfried.Loeschmann@loe-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15775-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

I have been using a reiserfs on a logical volume of two 80G disks for quite=
 a=20
while without any problems now. Recently I bought a new 250G disk in=20
addition, added it to the lv, created a new fs and started to put data on i=
t.=20
After a week or so the fs crashed unrepairable. I fear the reason was a=20
loosly connect disk.

So I started all over again (new fs, putting data on it). Situation now is =
as=20
follows: I create the filesystem, reiserfsck says it is ok. I put some data=
=20
on it say 10G and reiserfs say "on disk and correct bitmaps differ". After =

this I have to do reiserfsck --fix-fixable. Answer is no corruptions found.=
=20
But again --check says the above mentioned. I can reproduce this as often a=
s=20
I like.

I already checked all harddisks, no errors. Well, can anyone tell me, if I =

should worry about this. Reiserfs version is 3.6.4, Kernel is SuSE 2.4.20.

Thanks in advance
--=20
Siegfried L=F6schmann
Schillerstr. 22
21423 Winsen
fon: +49 4171 72415
mobile: +49 162 10 455 43
email: Siegfried.Loeschmann@loe-online.de
