From: rudekjan@freenet.de
Subject: Wtr.: Re: 2.6.15.1+reiser4 Kernel Panic
Date: Tue, 31 Jan 2006 02:15:00 +0100
Message-ID: <E1F3k6m-0007gB-2D@www7.emo.freenet-rz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

i'm again... here are some more informations. i haven't encrypted my data a=
nd the error above the reiser4 panic is:

end_request: I/O error, dev sdb, sector 64412

hope thats help finding the bug

greets

Jan

----- weitergeleitete Nachricht ---------


Subject: Re: 2.6.15.1+reiser4 Kernel Panic
Date: Di 31 Jan 2006 01:49:38 CET
From: rudekjan@freenet.de

> Hi,
> i have the same Problem witch 2.6.16-rc1 with the reiser4 Patch from
> ftp.namesys.com.
> Same error and the System is frozen to. But I wanted to copy data from
> Partition A (Reiser3) to Partition B (Reiser4).
>=20
> greets
>=20
> Jan
>=20
> From: "Vladimir V. Saveliev" <vs@namesys.com>
>         To: Ps <Ps_Mail@freenet.de>
>         Date: Mon, 30 Jan 2006 11:29:18 +0300
>         Subject: Re: 2.6.15.1+reiser4 Kernel Panic
>         Hello
>        =20
>         On Sun, 2006-01-29 at 11:44 +0100, Ps wrote:
>         > Hi,
>         >
>         > i've got a kernel panic with kernel 2.6.15.1 + reiser4 patch fr=
om
>         > ftp.namesys.com, when writing data to a usb harddisk.
>         >
>         > kernel output:
>         > loop4: loop_end_io_transfer err=3D-95 bi_rw=3D0x5=20
>         > reiser4 panicked cowardly: reiser4[pdflush(6748)]:
> commit_current_atom
>         > (fs/reiser4/txnmgr.c:1130)[zam-597]
>         > write log failed (-5)
>         >
>         > reiser4 panicked cowardly: reiser4[pdflush(6748)]:
> commit_current_atom=20
>         > (fs/reiser4/txnmgr.c:1130)[zam-597]
>         > write log failed (-5)
>         >
>         > and the machine is *frozen*
>         >
>         > the harddisk is encrypted via loop-aes v3.1c (loop4). i think i=
t's
> a
>         > reiser4 or kernel 2.6.15 bug, because loop-aes with kernel <2.6=
.15
> is
>         > running quite perfekt. fsck.reiser4 1.0.5 says the filesystem i=
s
> clear.
>         >
>        =20
>         can you reproduce the problem?
>        =20
>         > Best Regards,
>         > Patrick=20
>         >
>         >
>        =20
>=20
>=20
>=20
> "Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! Hier klicken"
> www.klarmobil.de/index.html?pid=3D73025
>=20
>=20



---- weitergeleitete Nachricht Ende ----
=0A=0A=0A=0A"Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! Hier kli=
cken"=0Awww.klarmobil.de/index.html?pid=3D73025=0A
