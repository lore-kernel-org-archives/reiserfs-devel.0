From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Reiser4-ReiserFS recovery story
Date: Wed, 28 Jul 2004 16:33:06 +0200
Message-ID: <200407281633.06373.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19841-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list@namesys.com

Did you know, that you can recover a ReiserFS partition, which you formatte=
d=20
with reiser4?

Yesterday I formatted a ReiserFS partition with Reiser4. It was by mistake,=
 as=20
I did not modify the partition in my slow.c bash-script. Nevertheless I=20
learned from what I knew about Reiser4:

"If Reiser4 writes during formatting only the really needed informations" I=
=20
thought, "then data must still be there..."

So I run reiserfsck --rebuild-sb on the partition. I told the program, that=
=20
the partition is Reiser V 3.6 and it worked. Now I tried reiserfsck --check=
=2E=20
As this one failed I had to run reiserfsck --rebuild-tree to be able to mou=
nt=20
the partition. Now I can mount the partition and all the data is still ther=
e.

Nice feature :-) perhaps it can help someody else, too.

Marcel
=2D-=20
=C3=9Cdv=C3=B6zlettel -- Mit freundlichen Gr=C3=BCssen,
Marcel Hilzinger
