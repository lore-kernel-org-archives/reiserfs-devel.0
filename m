From: "Vladimir 'jd wuz here' Sopot" <jd@artdesign.ru>
Subject: reiserfsck question
Date: Mon, 28 Jul 2003 11:53:22 +0400
Message-ID: <005501c354dd$51a68900$8e0c43c2@sovintel.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0052_01C354FE.D8519F00"
Return-path: <reiserfs-list-return-15089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0052_01C354FE.D8519F00
Content-Type: text/plain;
	charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

hi there!

i have a situation here. my system is linux 2.4.19 with reiserfs 3.6. =
when i want to check the FS (single root partition) from usual =
environment i get the following

cloud9:~ # reiserfsck /dev/hda2
reiserfsck 3.6.2 (2002)
Will read-only check consistency of the filesystem on /dev/hda2
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Mon Jul 28 11:47:24 2003
###########
Device /dev/hda2 is mounted w/ write permissions, can not check it

when i boot single mode i try the same command, but this time it says =
that --fix-fixable is ignored (because of RO partition?)

the question is the following: how should i correctly run the fsck to =
get my FS with errors fixed? follwing is the part from the syslog

Jul 28 11:48:55 cloud9 kernel: vs-7000: search_by_entry_key: =
search_by_key returned item position =3D=3D 0<4>vs-7000: =
search_by_entry_key: search_by_key returned item position =3D=3D =
0<4>vs-7000: search_by_entry_key: search_by_key returned item position =
=3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned item =
position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned =
item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key =
returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: =
search_by_key returned item position =3D=3D 0<4>vs-7000: =
search_by_entry_key: search_by_key returned item position =3D=3D =
0<4>vs-7000: search_by_entry_key: search_by_key returned item position =
=3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned item =
position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned =
item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key =
returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: =
search_by_key returned item position =3D=3D 0<4>vs-7000: =
search_by_entry_key: sea
Jul 28 11:49:48 cloud9 kernel: ch_by_key returned item position =3D=3D =
0<4>vs-7000: search_by_entry_key: search_by_key returned item position =
=3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned item =
position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned =
item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key =
returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: =
search_by_key returned item position =3D=3D 0<4>vs-7000: =
search_by_entry_key: search_by_key returned item position =3D=3D =
0<4>vs-7000: search_by_entry_key: search_by_key returned item position =
=3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned item =
position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned =
item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key =
returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: =
search_by_key returned item position =3D=3D 0<4>vs-7000: =
search_by_entry_key: search_by_key returned item position =3D=3D =
0<4>vs-7000: search_by_entry_key: search_by_key returned item position

hoping to get your answer asap, as this is a production server.

thank you in advance

Vladimir Sopot
http://photofile.ru
project manager

------=_NextPart_000_0052_01C354FE.D8519F00--

