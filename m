From: Marc Dietrich <Marc.Dietrich@hrz.uni-giessen.de>
Subject: Is this a critical error?
Date: Tue, 2 Jul 2002 21:48:56 +0200
Message-ID: <200207022148.56595.marc.dietrich@physik.uni-giessen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10902-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi,

when doing reiserfsck I get lots of messages like this:

<-------------reiserfsck, 2001------------->
reiserfsprogs 3.x.0j

Will read-only check consistency of the partition
Will put log info to 'stderr'
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
Analyzing journal..nothing to replay (no transactions older than last flu=
shed=20
one found)
Fetching on-disk bitmap..done
Checking S+tree../  1 (of   2)/ 18 (of 117)/ 21 (of 165)grow_id_map: obje=
ctid=20
map expanded: used 5120, 5 blocks
/ 52 (of 165)grow_id_map: objectid map expanded: used 5120, 5 blocks
/121 (of 165)grow_id_map: objectid map expanded: used 5120, 5 blocks
/ 19 (of 117)/  3 (of  92)grow_id_map: objectid map expanded: used 5120, =
5=20
blocks
/ 35 (of  92)grow_id_map: objectid map expanded: used 5120, 5 blocks
/ 20 (of 117)/109 (of 128)grow_id_map: objectid map expanded: used 5120, =
5=20
blocks
/ 21 (of 117)/ 31 (of 165)grow_id_map: objectid map expanded: used 5120, =
5=20
blocks
/103 (of 165)grow_id_map: objectid map expanded: used 5120, 5 blocks
/108 (of 165)grow_id_map: objectid map expanded: used 5120, 5 blocks
/ 32 (of 117)/ 66 (of 154)grow_id_map: objectid map expanded: used 10240,=
 10=20
blocks
/ 68 (of 154)grow_id_map: objectid map expanded: used 10240, 10 blocks
/ 65 (of 117)/115 (of 168)grow_id_map: objectid map expanded: used 15360,=
 15=20
blocks
ok

-------------------------------------------------------------------------

Are this critical errors, or can I ignore these?

System: SuSE 8.0

Greetings

Marc

--=20
Marc Dietrich
=09=09=09=09=09"Hilf dir selbst, sonst hilft dir Microsoft!"

