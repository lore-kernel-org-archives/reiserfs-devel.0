From: Yury Umanets <umka@namesys.com>
Subject: Re: reiserfsck question
Date: Mon, 28 Jul 2003 12:01:09 +0400
Message-ID: <1059379269.21591.6.camel@haron.namesys.com>
References: <005501c354dd$51a68900$8e0c43c2@sovintel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15090-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <005501c354dd$51a68900$8e0c43c2@sovintel.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir 'jd wuz here' Sopot <jd@artdesign.ru>
Cc: reiserfs-list@namesys.com

On Mon, 2003-07-28 at 11:53, Vladimir 'jd wuz here' Sopot wrote:
> hi there!
Hello Vladimir,

First of all use newer version of reiserfsprogs. I recommend 3.6.9 one
from out ftp. It contains some fixes related to checking filesystem on
boot and lots of another fixes since 3.6.2.

Speaking about unability to fix RO partition... Can you check it fully
unmounted? In other words, can you boot up from a CD? Say the CD of you
distro maker?

Regards.
>=20
> i have a situation here. my system is linux 2.4.19 with reiserfs 3.6. whe=
n i want to check the FS (single root partition) from usual environment i g=
et the following
>=20
> cloud9:~ # reiserfsck /dev/hda2
> reiserfsck 3.6.2 (2002)
> Will read-only check consistency of the filesystem on /dev/hda2
> Will put log info to 'stdout'
>=20
> Do you want to run this program?[N/Yes] (note need to type Yes):Yes
> ###########
> reiserfsck --check started at Mon Jul 28 11:47:24 2003
> ###########
> Device /dev/hda2 is mounted w/ write permissions, can not check it
>=20
> when i boot single mode i try the same command, but this time it says tha=
t --fix-fixable is ignored (because of RO partition?)
>=20
> the question is the following: how should i correctly run the fsck to get=
 my FS with errors fixed? follwing is the part from the syslog
>=20
> Jul 28 11:48:55 cloud9 kernel: vs-7000: search_by_entry_key: search_by_ke=
y returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by=
_key returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: search=
_by_key returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: sea=
rch_by_key returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: =
search_by_key returned item position =3D=3D 0<4>vs-7000: search_by_entry_ke=
y: search_by_key returned item position =3D=3D 0<4>vs-7000: search_by_entry=
_key: search_by_key returned item position =3D=3D 0<4>vs-7000: search_by_en=
try_key: search_by_key returned item position =3D=3D 0<4>vs-7000: search_by=
_entry_key: search_by_key returned item position =3D=3D 0<4>vs-7000: search=
_by_entry_key: search_by_key returned item position =3D=3D 0<4>vs-7000: sea=
rch_by_entry_key: search_by_key returned item position =3D=3D 0<4>vs-7000: =
search_by_entry_key: search_by_key returned item position =3D=3D 0<4>vs-700=
0: search_by_entry_key: search_by_key returned item position =3D=3D 0<4>vs-=
7000: search_by_entry_key: sea
> Jul 28 11:49:48 cloud9 kernel: ch_by_key returned item position =3D=3D 0<=
4>vs-7000: search_by_entry_key: search_by_key returned item position =3D=3D=
 0<4>vs-7000: search_by_entry_key: search_by_key returned item position =3D=
=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned item position =
=3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned item positi=
on =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned item pos=
ition =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned item =
position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned it=
em position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key returned=
 item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key retur=
ned item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key re=
turned item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_key=
 returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_by_=
key returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: search_=
by_key returned item position
>=20
> hoping to get your answer asap, as this is a production server.
>=20
> thank you in advance
>=20
> Vladimir Sopot
> http://photofile.ru
> project manager
--=20
We're flying high, we're watching the world passes by...

