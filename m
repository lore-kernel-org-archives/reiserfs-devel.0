From: "Torsten Scholz" <t.scholz@alfeld.de>
Subject: Big Problem with my server reiserfs partition
Date: Sun, 20 Oct 2002 17:41:33 +0200
Message-ID: <010b01c2784f$2ba57b50$0a00a8c0@nemesis>
Reply-To: "Torsten Scholz" <t.scholz@alfeld.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0107_01C2785F.EE509580"
Return-path: <reiserfs-list-return-11726-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0107_01C2785F.EE509580
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0108_01C2785F.EE509580"


------=_NextPart_001_0108_01C2785F.EE509580
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all together,

I hope I made every thing right with this mail system....

Here comes my big Problem, in the hope that some one can help me out.

Up to last week I had a reiser partition 80GB (called /public/ the only =
one
on this hd) besides some backuped data the partition carried all of the
pictures of my digital camera. That's the real big loss! As they where
collected over some special occasions...

I have a small backup on another hd, but unfortunately this hd died a =
few
days earlier head crash... (murphy)

Then from one day to the other the partition table was not readable =
anymore
(so said mount)

So I start to repair it with reiserfsck Version3.x.0k-pre10 (the one =
witch
comes with my Distribution [SuSE 7.3])

Later on I used reiserfsck Version 3.6.3.

Here is what I have done so fare:

1.) I made a reiserfsck --check /dev/hdd1 --> and it reports some very =
heavy
damage.

2.) So I followed its suggestion and start a reiserfsck --rebuild-tree
/dev/hdd1 --> after that it looked not so bad. About the half of my date =
has
been repaired (I thought) and the rest had been moved to lost+found.

3.) Now I made a mistake (maybe) I moved all the repaired data to =
another hd
and started to see what I can repair from lost+found. In this folder I =
found
(sorted by Inodes) a lot of my data bat all where corrupted. It seams =
that
each file is only a small peace of the hole file and also it looks like =
it
where cut some where from the hd.

4.) After I took a closer look to the moved files. I found out that the =
same
happened to them. :-(((

5.) Than I downloaded the newest Version of reiserfsck (Version 3.6.3). =
I
run it with the -S option to get back the moved files.
reiserfsck -S --rebuild-tree --logfile reiserfsck.log /dev/hdd1 --> but =
also
this one did not repair my files.

6.) I tried a second reiserfsck --check /dev/hdd1 --> and this one says
every thing all right.

7.) took a closer look to one of the image (hexdump) files and found out
that if I cut away the rubbish (properly some other data (from a other
picture or file) I could open the picture but most part of it is =
missing, it
is only the beginning of the files.

At this point I relay on some help from a crack. Most of the data I have
lost I don't need so much, but I had all my digital photos on this =
partition
(about 3000) The hole live of my little sunshine Simon, my honeymoon,
wedding, and so on......

And this data could not be given back except some one discovers a time
travel machine.

I have uploaded the logfile (as tgz 1.1 mb) (from
reiserfsck -S --rebuild-tree --logfile reiserfsck.log /dev/hdd1 ) and =
some
of the pictures to http://www.exolon.de/reiserfs/

I hope that some one can give me a hint how I can repair this partition =
(or
the pictures only). Maybe there is a other option (or hash) I have to =
use
for reiserfsck for rebuilding the tree. If you have some more questions =
or
if you need some more information's you can also contact me at
t.scholz@alfeld.de.

--
cu t.scholz (exolon)
______________________________________
Web: http://eXnet-online.de   Email: t.scholz@alfeld.de
Tel.: 05187/2052   Fax.: 05187/2053   ICQ: 20794370   PGP: DFFEF426
"Linux is like a wigwam: no windows, no gates, but apache inside!"



------=_NextPart_001_0108_01C2785F.EE509580
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>Hello all=20
together,<BR><BR>I hope I made every thing right with this mail=20
system....<BR><BR>Here comes my big Problem, in the hope that some one =
can help=20
me out.<BR><BR>Up to last week I had a reiser partition 80GB (called =
/public/=20
the only one<BR>on this hd) besides some backuped data the partition =
carried all=20
of the<BR>pictures of my digital camera. That's the real big loss! As =
they=20
where<BR>collected over some special occasions...<BR><BR>I have a small =
backup=20
on another hd, but unfortunately this hd died a few<BR>days earlier head =

crash... (murphy)<BR><BR>Then from one day to the other the partition =
table was=20
not readable anymore<BR>(so said mount)<BR><BR>So I start to repair it =
with=20
reiserfsck Version3.x.0k-pre10 (the one witch<BR>comes with my =
Distribution=20
[SuSE 7.3])<BR><BR>Later on I used reiserfsck Version 3.6.3.<BR><BR>Here =
is what=20
I have done so fare:<BR><BR>1.) I made a reiserfsck --check /dev/hdd1 =
--&gt; and=20
it reports some very heavy<BR>damage.<BR><BR>2.) So I followed its =
suggestion=20
and start a reiserfsck --rebuild-tree<BR>/dev/hdd1 --&gt; after that it =
looked=20
not so bad. About the half of my date has<BR>been repaired (I thought) =
and the=20
rest had been moved to lost+found.<BR><BR>3.) Now I made a mistake =
(maybe) I=20
moved all the repaired data to another hd<BR>and started to see what I =
can=20
repair from lost+found. In this folder I found<BR>(sorted by Inodes) a =
lot of my=20
data bat all where corrupted. It seams that<BR>each file is only a small =
peace=20
of the hole file and also it looks like it<BR>where cut some where from =
the=20
hd.<BR><BR>4.) After I took a closer look to the moved files. I found =
out that=20
the same<BR>happened to them. :-(((<BR><BR>5.) Than I downloaded the =
newest=20
Version of reiserfsck (Version 3.6.3). I<BR>run it with the -S option to =
get=20
back the moved files.<BR>reiserfsck -S --rebuild-tree --logfile =
reiserfsck.log=20
/dev/hdd1 --&gt; but also<BR>this one did not repair my =
files.<BR><BR>6.) I=20
tried a second reiserfsck --check /dev/hdd1 --&gt; and this one =
says<BR>every=20
thing all right.<BR><BR>7.) took a closer look to one of the image =
(hexdump)=20
files and found out<BR>that if I cut away the rubbish (properly some =
other data=20
(from a other<BR>picture or file) I could open the picture but most part =
of it=20
is missing, it<BR>is only the beginning of the files.<BR><BR>At this =
point I=20
relay on some help from a crack. Most of the data I have<BR>lost I don't =
need so=20
much, but I had all my digital photos on this partition<BR>(about 3000) =
The hole=20
live of my little sunshine Simon, my honeymoon,<BR>wedding, and so=20
on......<BR><BR>And this data could not be given back except some one =
discovers=20
a time<BR>travel machine.<BR><BR>I have uploaded the logfile (as tgz 1.1 =
mb)=20
(from<BR>reiserfsck -S --rebuild-tree --logfile reiserfsck.log /dev/hdd1 =
) and=20
some<BR>of the pictures to </FONT><A =
href=3D"http://www.exolon.de/reiserfs/"><FONT=20
face=3D"Times New Roman"=20
size=3D3>http://www.exolon.de/reiserfs/</FONT></A><BR><BR><FONT=20
face=3D"Times New Roman" size=3D3>I hope that some one can give me a =
hint how I can=20
repair this partition (or<BR>the pictures only). Maybe there is a other =
option=20
(or hash) I have to use<BR>for reiserfsck for rebuilding the tree. If =
you have=20
some more questions or<BR>if you need some more information's you can =
also=20
contact me at<BR></FONT><A href=3D"mailto:t.scholz@alfeld.de"><FONT=20
face=3D"Times New Roman" size=3D3>t.scholz@alfeld.de</FONT></A><FONT=20
face=3D"Times New Roman" size=3D3>.<BR><BR>--<BR>cu t.scholz=20
(exolon)<BR>______________________________________<BR>Web: </FONT><A=20
href=3D"http://eXnet-online.de"><FONT face=3D"Times New Roman"=20
size=3D3>http://eXnet-online.de</FONT></A><FONT face=3D"Times New Roman" =

size=3D3>&nbsp;&nbsp; Email: </FONT><A =
href=3D"mailto:t.scholz@alfeld.de"><FONT=20
face=3D"Times New Roman" size=3D3>t.scholz@alfeld.de</FONT></A><BR><FONT =

face=3D"Times New Roman" size=3D3>Tel.: 05187/2052&nbsp;&nbsp; Fax.:=20
05187/2053&nbsp;&nbsp; ICQ: 20794370&nbsp;&nbsp; PGP: DFFEF426<BR>"Linux =
is like=20
a wigwam: no windows, no gates, but apache=20
inside!"</FONT><BR><BR></FONT></DIV></BODY></HTML>

------=_NextPart_001_0108_01C2785F.EE509580--

------=_NextPart_000_0107_01C2785F.EE509580--

