From: "Thorsten Kohfeldt" <thorsten.kohfeldt@gmx.de>
Subject: bug+fix in reiserfsck - reiserfscore/journal.c
Date: Fri, 27 Feb 2004 04:13:15 +0100
Message-ID: <004301c3fcdf$b3932f60$e91ba8c0@thk.local>
Reply-To: "Thorsten Kohfeldt" <thorsten.kohfeldt@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0040_01C3FCE8.05C53B90"
Return-path: <reiserfs-list-return-16950-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0040_01C3FCE8.05C53B90
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To whom it may (should!) concern,                                        =
26/27-FEB-2004
=20
after having been annoyed for quite some time by corrupt /var file =
systems after
(simulated) powerloss in a SuSE 9.0 setup with reiserfs, I finally =
tracked the
problem down to a nasty bug in reiserfsck - reiserfscore/journal.c
=20
Turned out that the journal is not always correctly replayed by =
reiserfsck !
=20
This may be the case when the filesystem has not experienced a lot of =
transactions
after it has been mounted and so there are more than one mount_id to be =
found in
the journal. In that case, the function replay_journal() might =
accidentally step over
the transactions it is supposed to replay and that way those =
transactions are
completely and forever ignored.
=20
The following fix prevents the search loop from stepping too far:
(check also the MIME attachment down below)
The diff is valid for SuSE 9.0 reiserfsprogs 3.6.9+ and also valid for
reiserfsprogs 3.6.13.

############# snip ##############
--- reiserfsprogs-3.6.13/reiserfscore/journal.c 2004-02-17 =
13:06:23.000000000 +0100
+++ replayFix/reiserfscore/journal.c 2004-02-27 00:11:44.000000000 +0100
@@ -784,7 +784,9 @@
  if (control.mount_id =3D=3D cur.mount_id && control.trans_id =3D=3D 0 =
&&=20
      control.desc_blocknr =3D=3D 0)
      break;
-=20
+ if (cur.mount_id =3D=3D control.mount_id && cur.trans_id =3D=3D =
control.trans_id + 1)
+     break;
+
  ret =3D next_transaction (fs, &cur, newest);
 =20
  if (ret !=3D TRANS_FOUND)
@@ -792,8 +794,9 @@
     }
=20
     while (ret =3D=3D TRANS_FOUND) {
- if (control.mount_id !=3D cur.mount_id || control.trans_id !=3D 0 ||=20
-     control.desc_blocknr !=3D 0)=20
+ if ((control.mount_id !=3D cur.mount_id || control.trans_id !=3D 0 ||=20
+      control.desc_blocknr !=3D 0) &&
+     (cur.mount_id !=3D control.mount_id || cur.trans_id !=3D =
control.trans_id + 1))
  {
      ret =3D next_transaction (fs, &cur, newest);
     =20
@@ -821,7 +824,8 @@
         replayed ++;
     }
=20
-    reiserfs_warning (stderr, "%d transactions replayed\n", replayed);
+    reiserfs_warning (stderr, "Journal in %s (1st block: %d) - %d =
transactions replayed\n",
+     fs->fs_j_file_name, get_jp_journal_1st_block (sb_jp =
(fs->fs_ondisk_sb)), replayed);
 =20
     mark_buffer_dirty (fs->fs_super_bh);
     bwrite (fs->fs_super_bh);=20
############# pins ##############

The fix was extensively tested by copying mounted reiser filesystems to
(XOR- !) loop devices and then reiserfsck-ing them.
The fixed reiserfsck version always created the same results or, when =
the bugged
version did replay 0 transactions, the fixed version replayed the =
correct amount
of transactions.
=20
The unfortunate thing about the SuSE setup is, that reiserfsck is =
executed before
the filesystem gets mounted. The kernel "mount" code itself seems to =
know the trick,
but that doesn't help if reiserfsck is discarding those transactions =
before the
mount can perform its correct replay!
Only the root filesystem gets replayed correctly because it will be =
mounted
read-only first. On initiation of a mount, the log will always be =
replayed even if
the mount is supposed to be read-only in order to achieve consistency as =
early
as possible !

For a quick fix of a SuSE 9.0 system, install the reiserfs(progs) source =
with yast2,
untar the (source only) attachment to a directory of your choice and run
./createSuSEreiserfs. Then install the new reiserfsck into /sbin/.
IMPORTANT NOTE: Make sure that /sbin/reiserfsck AND /sbin/fsck.reiserfs
are hardlinked to each other again (ls -li shows the same inode) !
The boot code calls fsck.reiserfs instead of reiserfsck.
=20
=20
Also, I would like to start a discussion about the 32-bit wrap-around of =
the
journal transaction id.
I DO expect that is a non-academic scenario given the following =
assumption:
A system that would do 200 transactions per second, 12 hours a day,
5 days a week would reach the wrap around in only two years !
Of course that is a worst case calculation but it is quite probable that =
a
long term running system might touch that boundary. And that id survives
a reboot. So the amounts accumulate over time.
=20
I saw several code sections that assume that the "newer" transaction has
also the higher transaction id. That is NOT the case during a =
wrap-around.
I'm curious what y'all think about that issue.
=20
For a starter, I added a patch that fixes one wrap around issue inside
journal.c. Take it or leave it.

############# snip ##############
--- replayFix/reiserfscore/journal.c 2004-02-27 00:11:44.000000000 +0100
+++ wrapSafer/reiserfscore/journal.c 2004-02-27 00:18:06.000000000 +0100
@@ -136,14 +136,15 @@
     __u32 newest_trans_id, oldest_trans_id, trans_id;
     int trans_nr;
=20
+    memset(oldest, 0, sizeof(*oldest));
+    memset(newest, 0, sizeof(*newest));
+    newest_trans_id =3D oldest_trans_id =3D 0; // keep compiler quiet
+
     sb =3D fs->fs_ondisk_sb;
    =20
     j_start =3D get_jp_journal_1st_block (sb_jp (sb));
     j_size =3D get_jp_journal_size (sb_jp (sb));
    =20
-    oldest_trans_id =3D 0xffffffff;
-    newest_trans_id =3D 0;
-
     trans_nr =3D 0;
     for (j_cur =3D 0; j_cur < j_size; j_cur ++) {
  d_bh =3D bread (fs->fs_journal_dev, j_start + j_cur, =
fs->fs_blocksize);
@@ -152,10 +153,14 @@
      continue;
  }
=20
+ trans_id =3D get_desc_trans_id (d_bh);
+ if (!trans_nr) {
+     oldest_trans_id =3D trans_id;
+     newest_trans_id =3D trans_id;
+ }
  trans_nr ++;
=20
- trans_id =3D get_desc_trans_id (d_bh);
- if (trans_id < oldest_trans_id) {
+ if (((__u32)(oldest_trans_id - trans_id)) < 0x80000000UL) {
      oldest_trans_id =3D trans_id;
=20
      oldest->mount_id =3D get_desc_mount_id (d_bh);
@@ -166,7 +171,7 @@
      oldest->next_trans_offset =3D next_desc_expected (fs, d_bh) - =
j_start;
  }
=20
- if (trans_id > newest_trans_id) {
+ if (((__u32)(trans_id - newest_trans_id)) < 0x80000000UL){
      newest_trans_id =3D trans_id;
=20
      newest->mount_id =3D get_desc_mount_id (d_bh);=20
############# pins ##############

For REISER 4, I guess, a 48-bit or 64-bit transaction id is an =
adviseable
choice !


Thorsten Kohfeldt (gmx|de)
=20


ATTACHMENT: tar file with 3 patchdiffs and one script


MIME-Version: 1.0
Content-Type: application/octet-stream; =
name=3D"reiserReplayFix20040227.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; =
filename=3D"reiserReplayFix20040227.tar.gz"

H4sIAMmSPkAAA+0Za2/bSC5f7V/BeNvAji1bkh+JkyZo0cddF9t0kaQ44LYLQZZGtmpZ0ukRJ=
338
9yNn9LL8SPb6usOJCCJrhuRwSA7JoQJmhyy4ZL6j372yb3t73wFkeSAfDYf4lOWj0WDlmcCeI=
svK
0VBRVEXZkxW131f3YPg9hClDHEZ6ALAXzeY78e6b/x+FoGR/RZY+eHHg6o60DHT/SrdY0DVty=
/qK
NWQ07mgw2GZ/dTRI7Y8vaHj8hS6zB/I32+UO+D+3vyRJEGTWF95ghYYXsF7iB12jpqI5JFmV1=
COQ
5RNFORkMutnRhTbZt95utyHzmAcyOj6RR2uMnj4FSemPOsoA2vw5hKdP60CgaXFfBZctWRhpU=
aC7
oWabHfAcc3Ug/XUqyGw3SobcAIfqbRpcsEXIoqag7YDcgdD+yDyreSiGWq3TFUSx6gqiGMoQS=
3LB
WVkwHJFPa70ezBnzwfAWvu2wAP4V2yyqt4Ws4QSxrFA6t0LNc007nGvhJNmH+P9BI4+NEG3KI=
u2D
ryXq1RRcauJ4xhya4QQn6EHCpVQo9ToRH92AX5fo/4YN3FoJnAqU9V3LOCOYpEoXg3zI8gJof=
tCM
WAyC+PkkkS99b7db8KkONVObzBBvEjDdhGaillR0k910Mm20BWUn1R1XBLHEDXGPGqodBV1MG=
fbJ
s8ijaiSP4bmR7cYMxat9Id+oFXZCukIFGPnumiQRGbxmW9DcTzdI0rZrmzWWO6PAWFdYEQNlq=
GVq
a7fJXaWHiSRxkbLhJ2VRhIyE02zyg9RqloWVMlFaLWQg3x4nR/Pdb8Ie9+0QVnCk84UXu1FJ8=
Gws
FZybZzTqHKF1jhR8ZMZJ2bjsNl3Qsyw8jciPj3GG7NZnRsS4g3SAM8WdJI6R2rWknfOyGTZop=
6CW
MvKadlLl7DIurOA8UDnfO/6X8788zvJ/lha+d/7vD9U0/49Udcjzf39Y5f8fASL/i2TtB940l=
Prd
UVfp35fBlSNQ+pi+T9T+xlLgm9QUFBmOjgcUGegxFpGBDimF7cBzuvkZOgMM//n7wQGkOPlhx=
IxD
E4XQT/P84PF8QZkKcVoJAqWdOQXWJDKsLEALloWgRRGnuOCaEG1QWkkmSPhj5q8FeUzjmLoR2=
Z4r
ItoBz2tJsUHxLNEB0eyfwfXls4sr7dXbdxcvWkJjY7VzjBobpxojoBjIfyxnWHQI4rNVYoyA0=
mbl
7peU+/nz+r72Sbk4gTy2KpdwWpDG2a9bRqhw1zoHBwnSquH2NxiOVioabn+L4cgz0lD/l0zGS=
yoy
zrFKGa59rA7QRqlxBDs6MJjFeNJPTSaJKXGCtKUeuLY7xUItMlmAKzQem1BYPMy4vHcbnewlL=
VB3
8PlVnEssleFxCE0sJYEr8wQem5RNd60jmNfS6kyz0ME0V1+wzv0VarnSbbVWxCZf5zW4Hsy1S=
Wzh
1UIz7SC6yyjD2Mcxnio55mQZ2BHbNP2zI+1/J5Tzv4ExKWJX8dXL1Fu+fg2K5Tv6P/2RnOT/P=
iYF
hfI/jlT3/x8Cv+z3Jrbbm+jhrP4LXM/sEOj8gu6a/EcIh1lBeMgLQVDxzq52KX8jBdYMN7aJY=
Wty
B9HMC8KIud25N7OYY0ZPpwssHln9F0TcWljiMre4jA7obbYXh8Ry4rAFZioWsCxoGXNksvRix=
4SL
t9dJkFgNSphVohmDZBlY6iG4XkTbcFDAyAMdWRgsiHQMcxi3mRvBHYu6OPoKr6XsVl/4uHVyf=
hh3
5WQ1h+k3qA94/vby8t3v19C7QX/5/dnl9evr128vKGIaeoh7BM9CLN9b4pXe0m0nRuFD1Ejk3=
IFu
RTiqo9QTz+MLXqOgDZ5/GphqTIaLBfMQfwYBXmaIBA0gBAhjw2C4AVxJ7BpDN3LA12imR3x1j=
NCT
OIKlHc1wmDbQKSgO0KjslhkxXZIsG21E3JGFEGum31AymDDmgj11sUwzwXMNRibNmXTIvLhSU=
ePE
Anfpshtkg2YzWBgisT4lBVuBt1ixx369jkcNU8JZoxhfGjTqxzi6XoeOG/UQqZHvWaMXh0EvD=
Iye
rxtzfcrC3tXbd5fPX1416nW0/B/QeKQ0KHM3GiDp+Zsk/M1gDfgTTusokVuvMWPmQeNdiHxO4=
JEM
f2RYfzZw9taOQKlbdsJ5H6QAHiWS9B59EgJ/6eKzO/24xpZsK5AhkZW3PR4JMljElF0ZGhBDD=
3fN
/XRNNV+Ty79N/GCBElmcI+qTEy3mmBjTEapE/TicmdnAec9kNz03dhwqdmgxbg2Qbm8+Wtv3V=
qud
4w+OpJXnuo43rdcNM9tYxtjXI2MGkq/Ak4yzrIibhcwPPfLtdnscT+Z8tpBgOjLtKJQMPIVu7=
Ava
jFTZTqpKi3nqTxLvsJVo1e20fbGccyfFLj+izCwR97cTD3A1L9K10Ex6UJJaIh5sJx5KgWMv7=
Ega
DSZ2WeLhdrpRkSCnGG2nOJL0OPK0gmZysqMyGdZVOId/8nEWxMU1sSTi8XbKbeE/Jx5vJd76U=
aJM
3O1h2W7ZU4y9NQKazkY4xkKfiyk+R2/CjX3PNwuHBP16tvBMkC4hbi+zg4Ynzc3PlLRYYJyTh=
iBF
dz6ecZSa0cnEWgYkCrjghCA58OkLvD+FzzDFnYN0A0KiLp7+KA5/cl261v/ZaOGvW+Oe/s+wr=
+Tf
f5ThEeIPR0pV//0Q2Nz/Ge/o2vQlDB7KCJTRSX980pdXujZq1v75ti0l3iPuDKFN/+ja3DvEu=
/Eh
PPf8u8CezjB1ytRMQvGobPk71ihwyZfrgGMbzA2pxJl6WKi4oljFW+sm8sFDyQHJV3bZu3z57=
MWb
lzTRq4vL/uBY4R8d+FPJrvvbvvEkX6vow4K4RdMlWjSmcbtZp4AQ7FDLbvMfAm2hT21DC6NA3=
Orx
Gk3NHChA7xDE1Y4KbZ8ZNhZkvNCnstigwi2r01D89gpp76Gk9SIZNUhwFJTTXJIvkLP+wvVEz=
ax8
s7lesiZC2gwB5mD1yZXzkM1z9Y9V6rUMxv30owKRI6Kx8OkjVLpqZ23RVv65Y0fT5BXdj+7wx=
rPg
lTdgJHFNPTAzTVpYPJiIiKxqjWXgITXfJd4UuCItm+XImHrQ06j9wps3BQ84TXpquULbxXc1+=
caR
9oxo60O53xlDeygXe4A6OqrtRqiDg03NmsbjsLwuJ8vdcsO3Q9HIEVp/Ar9iRX7x7DftzesL7=
er1
P1+KnuID+k6okeZjJ26JrhP/wiq0hzeRDbpqJBppZErrvnffJHU13fkc8kq8HrmCLc5expiqs=
faY
xLZjSngE0XuTt3W2vh6gAvByRHwba32stY+m1Bwsqq5D/cmv3XYjMXNjh6/cu21qz3Eu/8EWx=
AEo
25Q3Qk9Fzzpxx8T1uOMpfR7yhkrR8wyqouFMPJO6eOMJLH623eZ2m79zo1gP2SKcCyHEAd9ho=
hdo
fv5VMdX5iiPmh9X0WNpmiMinMh+iq69AQzNc8Y/UidTc4m1hbfGS2y1hnM+RDVOWD/Hhsusmt=
Nt0
WNTPRj9f85GswU9aTEPRt9xtJ23uF/3jYfJv9/V1V083sMGRRdgjdx71eRwVD/LmvxRJxfZap=
2kj
n5wZN7QlULZ3o/Bzd5/X/uPZ5cXri7+dQBphEtWi1u2QK74jNJ/5FF5h7AUhxr7vBUWHz0i7u=
BmU
qbMtFLQfzombdxevcvUgrxoFyxi6eaWMZ0zHjVMh8bPr6AoqqKCCCiqooIIKKqigggoqqKCCC=
iqo
oIIKKqigggoqqKCCCiqooIIKKqigggoq+JHwb17W0/4AUAAA


------=_NextPart_000_0040_01C3FCE8.05C53B90
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3810.1700" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>To whom it may (should!)=20
concern,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
26/27-FEB-2004<BR>&nbsp;<BR>after having been annoyed for quite some =
time by=20
corrupt /var file systems after<BR>(simulated) powerloss in a SuSE 9.0 =
setup=20
with reiserfs, I finally tracked the<BR>problem down to a nasty bug in=20
reiserfsck - reiserfscore/journal.c<BR>&nbsp;<BR>Turned out that the =
journal is=20
not always correctly replayed by reiserfsck !<BR>&nbsp;<BR>This may be =
the case=20
when the filesystem has not experienced a lot of transactions<BR>after =
it has=20
been mounted and so there are more than one mount_id to be found =
in<BR>the=20
journal. In that case, the function replay_journal() might accidentally =
step=20
over<BR>the transactions it is supposed to replay and that way those=20
transactions are<BR>completely and forever ignored.<BR>&nbsp;<BR>The =
following=20
fix prevents the search loop from stepping too far:<BR>(check also the =
MIME=20
attachment down below)<BR>The diff&nbsp;is valid for SuSE 9.0 =
reiserfsprogs=20
3.6.9+&nbsp;and also valid for<BR>reiserfsprogs 3.6.13.<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>############# snip =
##############<BR>---=20
reiserfsprogs-3.6.13/reiserfscore/journal.c&nbsp;2004-02-17 =
13:06:23.000000000=20
+0100<BR>+++ replayFix/reiserfscore/journal.c&nbsp;2004-02-27 =
00:11:44.000000000=20
+0100<BR>@@ -784,7 +784,9 @@<BR>&nbsp;&nbsp;if (control.mount_id =3D=3D =
cur.mount_id=20
&amp;&amp; control.trans_id =3D=3D 0 &amp;&amp; =
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
control.desc_blocknr =3D=3D 0)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
break;<BR>-&nbsp;<BR>+&nbsp;if (cur.mount_id =3D=3D control.mount_id =
&amp;&amp;=20
cur.trans_id =3D=3D control.trans_id + 1)<BR>+&nbsp;&nbsp;&nbsp;&nbsp;=20
break;<BR>+<BR>&nbsp;&nbsp;ret =3D next_transaction (fs, &amp;cur,=20
newest);<BR>&nbsp;&nbsp;<BR>&nbsp;&nbsp;if (ret !=3D TRANS_FOUND)<BR>@@ =
-792,8=20
+794,9 @@<BR>&nbsp;&nbsp;&nbsp;&nbsp; =
}<BR>&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
while (ret =3D=3D TRANS_FOUND) {<BR>-&nbsp;if (control.mount_id !=3D =
cur.mount_id ||=20
control.trans_id !=3D 0 || <BR>-&nbsp;&nbsp;&nbsp;&nbsp; =
control.desc_blocknr !=3D=20
0) <BR>+&nbsp;if ((control.mount_id !=3D cur.mount_id || =
control.trans_id !=3D 0 ||=20
<BR>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; control.desc_blocknr !=3D 0)=20
&amp;&amp;<BR>+&nbsp;&nbsp;&nbsp;&nbsp; (cur.mount_id !=3D =
control.mount_id ||=20
cur.trans_id !=3D control.trans_id +=20
1))<BR>&nbsp;&nbsp;{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D =
next_transaction=20
(fs, &amp;cur, newest);<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>@@ -821,7 =
+824,8=20
@@<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; replayed=20
++;<BR>&nbsp;&nbsp;&nbsp;&nbsp; }<BR>&nbsp;<BR>-&nbsp;&nbsp;&nbsp;=20
reiserfs_warning (stderr, "%d transactions replayed\n",=20
replayed);<BR>+&nbsp;&nbsp;&nbsp; reiserfs_warning (stderr, "Journal in =
%s (1st=20
block: %d) - %d transactions replayed\n",<BR>+&nbsp;&nbsp;&nbsp;=20
&nbsp;fs-&gt;fs_j_file_name, get_jp_journal_1st_block (sb_jp=20
(fs-&gt;fs_ondisk_sb)), =
replayed);<BR>&nbsp;&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
mark_buffer_dirty (fs-&gt;fs_super_bh);<BR>&nbsp;&nbsp;&nbsp;&nbsp; =
bwrite=20
(fs-&gt;fs_super_bh); </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>############# pins =
##############</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The fix was extensively tested by =
copying mounted=20
reiser filesystems to<BR>(XOR- !) loop devices and then reiserfsck-ing=20
them.<BR>The fixed reiserfsck version always created the same results =
or, when=20
the bugged<BR>version did replay 0 transactions, the fixed version =
replayed the=20
correct amount<BR>of transactions.<BR>&nbsp;<BR>The unfortunate thing =
about the=20
SuSE setup is, that reiserfsck is executed before<BR>the filesystem gets =

mounted. The kernel "mount" code itself seems to know the trick,<BR>but =
that=20
doesn't help if reiserfsck is discarding those transactions before =
the<BR>mount=20
can perform its correct replay!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Only the root filesystem gets =
replayed</FONT><FONT=20
face=3DArial size=3D2> correctly because it will be mounted</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>read-only first.&nbsp;On initiation of =
a=20
mount,</FONT><FONT face=3DArial size=3D2> the log will always be =
replayed&nbsp;even=20
if</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>the mount is supposed to be =
read-only</FONT><FONT=20
face=3DArial size=3D2> in order to achieve consistency as =
early</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>as possible !<BR><BR>For a quick fix of =
a SuSE 9.0=20
system, install the reiserfs(progs) source with yast2,<BR>untar the =
(source=20
only) attachment to a directory of your choice and =
run<BR>./createSuSEreiserfs.=20
Then install the new reiserfsck into /sbin/.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>IMPORTANT NOTE: Make sure=20
that&nbsp;/sbin/reiserfsck&nbsp;AND /sbin/fsck.reiserfs</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>are hardlinked to each other again (ls =
-li shows=20
the same inode) !</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The boot</FONT><FONT face=3DArial =
size=3D2> code calls=20
fsck.reiserfs instead of reiserfsck.<BR>&nbsp;<BR>&nbsp;<BR>Also, I =
would like=20
to start a discussion about the 32-bit wrap-around of the<BR>journal =
transaction=20
id.<BR>I DO expect that is a non-academic scenario given the following=20
assumption:<BR>A system that would do 200 transactions per second, 12 =
hours a=20
day,<BR>5 days a week would reach the wrap around in only two years =
!<BR>Of=20
course that is a worst case calculation but it is quite probable that =
a<BR>long=20
term running system might touch that boundary. And that id survives<BR>a =
reboot.=20
So the amounts accumulate over time.<BR>&nbsp;<BR>I saw several code =
sections=20
that assume that the "newer" transaction has<BR>also the higher =
transaction id.=20
That is NOT the case during a wrap-around.<BR>I'm curious what y'all =
think about=20
that issue.<BR>&nbsp;<BR>For a starter, I added a patch that fixes one =
wrap=20
around issue inside<BR>journal.c. Take it or leave =
it.<BR><BR>############# snip=20
##############<BR>--- replayFix/reiserfscore/journal.c&nbsp;2004-02-27=20
00:11:44.000000000 +0100<BR>+++ =
wrapSafer/reiserfscore/journal.c&nbsp;2004-02-27=20
00:18:06.000000000 +0100<BR>@@ -136,14 +136,15 =
@@<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
__u32 newest_trans_id, oldest_trans_id, =
trans_id;<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
int trans_nr;<BR>&nbsp;<BR>+&nbsp;&nbsp;&nbsp; memset(oldest, 0,=20
sizeof(*oldest));<BR>+&nbsp;&nbsp;&nbsp; memset(newest, 0,=20
sizeof(*newest));<BR>+&nbsp;&nbsp;&nbsp; newest_trans_id =3D =
oldest_trans_id =3D=20
0;&nbsp;// keep compiler quiet<BR>+<BR>&nbsp;&nbsp;&nbsp;&nbsp; sb =3D=20
fs-&gt;fs_ondisk_sb;<BR>&nbsp;&nbsp;&nbsp;&nbsp; =
<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
j_start =3D get_jp_journal_1st_block (sb_jp =
(sb));<BR>&nbsp;&nbsp;&nbsp;&nbsp;=20
j_size =3D get_jp_journal_size (sb_jp (sb));<BR>&nbsp;&nbsp;&nbsp;&nbsp; =

<BR>-&nbsp;&nbsp;&nbsp; oldest_trans_id =3D =
0xffffffff;<BR>-&nbsp;&nbsp;&nbsp;=20
newest_trans_id =3D 0;<BR>-<BR>&nbsp;&nbsp;&nbsp;&nbsp; trans_nr =3D=20
0;<BR>&nbsp;&nbsp;&nbsp;&nbsp; for (j_cur =3D 0; j_cur &lt; j_size; =
j_cur ++)=20
{<BR>&nbsp;&nbsp;d_bh =3D bread (fs-&gt;fs_journal_dev, j_start + j_cur, =

fs-&gt;fs_blocksize);<BR>@@ -152,10 +153,14 =
@@<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
continue;<BR>&nbsp;&nbsp;}<BR>&nbsp;<BR>+&nbsp;trans_id =3D =
get_desc_trans_id=20
(d_bh);<BR>+&nbsp;if (!trans_nr) {<BR>+&nbsp;&nbsp;&nbsp;&nbsp; =
oldest_trans_id=20
=3D trans_id;<BR>+&nbsp;&nbsp;&nbsp;&nbsp; newest_trans_id =3D=20
trans_id;<BR>+&nbsp;}<BR>&nbsp;&nbsp;trans_nr =
++;<BR>&nbsp;<BR>-&nbsp;trans_id =3D=20
get_desc_trans_id (d_bh);<BR>-&nbsp;if (trans_id &lt; oldest_trans_id)=20
{<BR>+&nbsp;if (((__u32)(oldest_trans_id - trans_id)) &lt; 0x80000000UL) =

{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oldest_trans_id =3D=20
trans_id;<BR>&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
oldest-&gt;mount_id =3D=20
get_desc_mount_id (d_bh);<BR>@@ -166,7 +171,7=20
@@<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oldest-&gt;next_trans_offset =3D=20
next_desc_expected (fs, d_bh) - =
j_start;<BR>&nbsp;&nbsp;}<BR>&nbsp;<BR>-&nbsp;if=20
(trans_id &gt; newest_trans_id) {<BR>+&nbsp;if (((__u32)(trans_id -=20
newest_trans_id)) &lt; 0x80000000UL){<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
newest_trans_id =3D =
trans_id;<BR>&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
newest-&gt;mount_id =3D get_desc_mount_id (d_bh); </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>############# pins =
##############</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>For REISER 4, I guess, a 48-bit or =
64-bit=20
transaction id is an adviseable</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>choice !</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thorsten Kohfeldt =
(gmx|de)<BR>&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ATTACHMENT: tar file with 3 patchdiffs =
and one=20
script</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>MIME-Version: 1.0<BR>Content-Type:=20
application/octet-stream;=20
name=3D"reiserReplayFix20040227.tar.gz"<BR>Content-Transfer-Encoding:=20
base64<BR>Content-Disposition: attachment;=20
filename=3D"reiserReplayFix20040227.tar.gz"</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>H4sIAMmSPkAAA+0Za2/bSC5f7V/BeNvAji1bkh+JkyZo0cddF9t0kaQ44LYLQZZG=
tmpZ0ukRJ338<BR>9yNn9LL8SPb6usOJCCJrhuRwSA7JoQJmhyy4ZL6j372yb3t73wFkeSAfD=
Yf4lOWj0WDlmcCeIsvK<BR>0VBRVEXZkxW131f3YPg9hClDHEZ6ALAXzeY78e6b/x+FoGR/RZ=
Y+eHHg6o60DHT/SrdY0DVty/qK<BR>NWQ07mgw2GZ/dTRI7Y8vaHj8hS6zB/I32+UO+D+3vyR=
JEGTWF95ghYYXsF7iB12jpqI5JFmV1COQ<BR>5RNFORkMutnRhTbZt95utyHzmAcyOj6RR2uM=
nj4FSemPOsoA2vw5hKdP60CgaXFfBZctWRhpUaC7<BR>oWabHfAcc3Ug/XUqyGw3SobcAIfqb=
RpcsEXIoqag7YDcgdD+yDyreSiGWq3TFUSx6gqiGMoQS3LB<BR>WVkwHJFPa70ezBnzwfAWvu=
2wAP4V2yyqt4Ws4QSxrFA6t0LNc007nGvhJNmH+P9BI4+NEG3KIu2D<BR>ryXq1RRcauJ4xhy=
a4QQn6EHCpVQo9ToRH92AX5fo/4YN3FoJnAqU9V3LOCOYpEoXg3zI8gJoftCM<BR>WAyC+Pkk=
kS99b7db8KkONVObzBBvEjDdhGaillR0k910Mm20BWUn1R1XBLHEDXGPGqodBV1MGfbJ<BR>s=
8ijaiSP4bmR7cYMxat9Id+oFXZCukIFGPnumiQRGbxmW9DcTzdI0rZrmzWWO6PAWFdYEQNlqG=
Vq<BR>a7fJXaWHiSRxkbLhJ2VRhIyE02zyg9RqloWVMlFaLWQg3x4nR/Pdb8Ie9+0QVnCk84U=
Xu1FJ8Gws<BR>FZybZzTqHKF1jhR8ZMZJ2bjsNl3Qsyw8jciPj3GG7NZnRsS4g3SAM8WdJI6R=
2rWknfOyGTZop6CW<BR>MvKadlLl7DIurOA8UDnfO/6X8788zvJ/lha+d/7vD9U0/49Udcjzf=
39Y5f8fASL/i2TtB940lPrd<BR>UVfp35fBlSNQ+pi+T9T+xlLgm9QUFBmOjgcUGegxFpGBDi=
mF7cBzuvkZOgMM//n7wQGkOPlhxIxD<BR>E4XQT/P84PF8QZkKcVoJAqWdOQXWJDKsLEALloW=
gRRGnuOCaEG1QWkkmSPhj5q8FeUzjmLoR2Z4r<BR>ItoBz2tJsUHxLNEB0eyfwfXls4sr7dXb=
dxcvWkJjY7VzjBobpxojoBjIfyxnWHQI4rNVYoyA0mbl<BR>7peU+/nz+r72Sbk4gTy2KpdwW=
pDG2a9bRqhw1zoHBwnSquH2NxiOVioabn+L4cgz0lD/l0zGSyoy<BR>zrFKGa59rA7QRqlxBD=
s6MJjFeNJPTSaJKXGCtKUeuLY7xUItMlmAKzQem1BYPMy4vHcbnewlLVB3<BR>8PlVnEssleF=
xCE0sJYEr8wQem5RNd60jmNfS6kyz0ME0V1+wzv0VarnSbbVWxCZf5zW4Hsy1SWzh<BR>1UIz=
7SC6yyjD2Mcxnio55mQZ2BHbNP2zI+1/J5Tzv4ExKWJX8dXL1Fu+fg2K5Tv6P/2RnOT/PiYF<=
BR>hfI/jlT3/x8Cv+z3Jrbbm+jhrP4LXM/sEOj8gu6a/EcIh1lBeMgLQVDxzq52KX8jBdYMN7=
aJYWty<BR>B9HMC8KIud25N7OYY0ZPpwssHln9F0TcWljiMre4jA7obbYXh8Ry4rAFZioWsCx=
oGXNksvRix4SL<BR>t9dJkFgNSphVohmDZBlY6iG4XkTbcFDAyAMdWRgsiHQMcxi3mRvBHYu6=
OPoKr6XsVl/4uHVyfhh3<BR>5WQ1h+k3qA94/vby8t3v19C7QX/5/dnl9evr128vKGIaeoh7B=
M9CLN9b4pXe0m0nRuFD1Ejk3IFu<BR>RTiqo9QTz+MLXqOgDZ5/GphqTIaLBfMQfwYBXmaIBA=
0gBAhjw2C4AVxJ7BpDN3LA12imR3x1jNCT<BR>OIKlHc1wmDbQKSgO0KjslhkxXZIsG21E3JG=
FEGum31AymDDmgj11sUwzwXMNRibNmXTIvLhSUePE<BR>Anfpshtkg2YzWBgisT4lBVuBt1ix=
x369jkcNU8JZoxhfGjTqxzi6XoeOG/UQqZHvWaMXh0EvDIye<BR>rxtzfcrC3tXbd5fPX1416=
nW0/B/QeKQ0KHM3GiDp+Zsk/M1gDfgTTusokVuvMWPmQeNdiHxO4JEM<BR>f2RYfzZw9taOQK=
lbdsJ5H6QAHiWS9B59EgJ/6eKzO/24xpZsK5AhkZW3PR4JMljElF0ZGhBDD3fN<BR>/XRNNV+=
Ty79N/GCBElmcI+qTEy3mmBjTEapE/TicmdnAec9kNz03dhwqdmgxbg2Qbm8+Wtv3Vqud<BR>=
4w+OpJXnuo43rdcNM9tYxtjXI2MGkq/Ak4yzrIibhcwPPfLtdnscT+Z8tpBgOjLtKJQMPIVu7=
Ava<BR>jFTZTqpKi3nqTxLvsJVo1e20fbGccyfFLj+izCwR97cTD3A1L9K10Ex6UJJaIh5sJx=
5KgWMv7Ega<BR>DSZ2WeLhdrpRkSCnGG2nOJL0OPK0gmZysqMyGdZVOId/8nEWxMU1sSTi8Xb=
KbeE/Jx5vJd76UaJM<BR>3O1h2W7ZU4y9NQKazkY4xkKfiyk+R2/CjX3PNwuHBP16tvBMkC4h=
bi+zg4Ynzc3PlLRYYJyThiBF<BR>dz6ecZSa0cnEWgYkCrjghCA58OkLvD+FzzDFnYN0A0KiL=
p7+KA5/cl261v/ZaOGvW+Oe/s+wr+Tf<BR>f5ThEeIPR0pV//0Q2Nz/Ge/o2vQlDB7KCJTRSX=
980pdXujZq1v75ti0l3iPuDKFN/+ja3DvEu/Eh<BR>PPf8u8CezjB1ytRMQvGobPk71ihwyZf=
rgGMbzA2pxJl6WKi4oljFW+sm8sFDyQHJV3bZu3z57MWb<BR>lzTRq4vL/uBY4R8d+FPJrvvb=
vvEkX6vow4K4RdMlWjSmcbtZp4AQ7FDLbvMfAm2hT21DC6NA3Orx<BR>Gk3NHChA7xDE1Y4Kb=
Z8ZNhZkvNCnstigwi2r01D89gpp76Gk9SIZNUhwFJTTXJIvkLP+wvVEzax8<BR>s7lesiZC2g=
wB5mD1yZXzkM1z9Y9V6rUMxv30owKRI6Kx8OkjVLpqZ23RVv65Y0fT5BXdj+7wxrPg<BR>lTd=
gJHFNPTAzTVpYPJiIiKxqjWXgITXfJd4UuCItm+XImHrQ06j9wps3BQ84TXpquULbxXc1+caR=
<BR>9oxo60O53xlDeygXe4A6OqrtRqiDg03NmsbjsLwuJ8vdcsO3Q9HIEVp/Ar9iRX7x7Dftz=
esL7er1<BR>P1+KnuID+k6okeZjJ26JrhP/wiq0hzeRDbpqJBppZErrvnffJHU13fkc8kq8Hr=
mCLc5expiqsfaY<BR>xLZjSngE0XuTt3W2vh6gAvByRHwba32stY+m1Bwsqq5D/cmv3XYjMXN=
jh6/cu21qz3Eu/8EWxAEo<BR>25Q3Qk9Fzzpxx8T1uOMpfR7yhkrR8wyqouFMPJO6eOMJLH62=
3eZ2m79zo1gP2SKcCyHEAd9hohdo<BR>fv5VMdX5iiPmh9X0WNpmiMinMh+iq69AQzNc8Y/Ui=
dTc4m1hbfGS2y1hnM+RDVOWD/HhsusmtNt0<BR>WNTPRj9f85GswU9aTEPRt9xtJ23uF/3jYf=
Jv9/V1V083sMGRRdgjdx71eRwVD/LmvxRJxfZap2kj<BR>n5wZN7QlULZ3o/Bzd5/X/uPZ5cX=
ri7+dQBphEtWi1u2QK74jNJ/5FF5h7AUhxr7vBUWHz0i7uBmU<BR>qbMtFLQfzombdxevcvUg=
rxoFyxi6eaWMZ0zHjVMh8bPr6AoqqKCCCiqooIIKKqigggoqqKCCCiqo<BR>oIIKKqigggoqq=
KCCCiqooIIKKqigggoq+JHwb17W0/4AUAAA</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0040_01C3FCE8.05C53B90--

