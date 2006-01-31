From: abc1237@freenet.de
Subject: Re: Re: Wtr.: Re: 2.6.15.1+reiser4 Kernel Panic
Date: Tue, 31 Jan 2006 14:52:44 +0100
Message-ID: <E1F3vw4-0007bn-7V@www5.emo.freenet-rz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

 =09

Hi,
I don't think that this is an error of the Disc, because I have a brand new=
 Harddisk (2 day's old).

greets
----- original Nachricht --------

Betreff: Re: Wtr.: Re: 2.6.15.1+reiser4 Kernel Panic
Gesendet: Di 31 Jan 2006 04:18:49 CET
Von: "Clay Barnes"<clay.barnes@gmail.com>

> To amplify what Hans (accurately) wrote, once you see bad sectors, that=
=20
> means that you already have many more than you see, and that your hard=20
> drive is all out of spare sectors to silently swap out for when it finds=
=20
> one.
>=20
> Basically, there's so much wrong with the surface that your hard drive=20
> can't hide any more flaws, and has given up trying.
>=20
> Hans is right:  If you see a single bad sector, the drive is considered=
=20
> unsafe and trash for even the tightest owner.
>=20
> --Clay
>=20
> Hans Reiser wrote:
> > Wow, are we at last actually stable enough that hardware errors are mor=
e
> > of a problem than software errors for our Reiser4 users?
> >
> > Rudekjan, you have a bad sector, buy a new drive, use dd_rescue to copy
> > to it, don't run reiser4.fsck until you get the data onto the new
> > drive.  Why buy a new drive?  Because after the first user visible bad
> > sector, your odds of more bad sectors over time go WAY up.  Your
> > time+data are too valuable.....
> >
> > Hans
> >
> > rudekjan@freenet.de wrote:
> >
> >  =20
> >> i'm again... here are some more informations. i haven't encrypted my d=
ata
> and the error above the reiser4 panic is:
> >>
> >> end_request: I/O error, dev sdb, sector 64412
> >>
> >> hope thats help finding the bug
> >>
> >> greets
> >>
> >> Jan
> >>
> >> ----- weitergeleitete Nachricht ---------
> >>
> >>
> >> Subject: Re: 2.6.15.1+reiser4 Kernel Panic
> >> Date: Di 31 Jan 2006 01:49:38 CET
> >> From: rudekjan@freenet.de
> >>
> >> =20
> >>
> >>    =20
> >>> Hi,
> >>> i have the same Problem witch 2.6.16-rc1 with the reiser4 Patch from
> >>> ftp.namesys.com.
> >>> Same error and the System is frozen to. But I wanted to copy data fro=
m
> >>> Partition A (Reiser3) to Partition B (Reiser4).
> >>>
> >>> greets
> >>>
> >>> Jan
> >>>
> >>> From: "Vladimir V. Saveliev" <vs@namesys.com>
> >>>        To: Ps <Ps_Mail@freenet.de>
> >>>        Date: Mon, 30 Jan 2006 11:29:18 +0300
> >>>        Subject: Re: 2.6.15.1+reiser4 Kernel Panic
> >>>        Hello
> >>>       =20
> >>>        On Sun, 2006-01-29 at 11:44 +0100, Ps wrote:
> >>>        > Hi,
> >>>        >
> >>>        > i've got a kernel panic with kernel 2.6.15.1 + reiser4 patch
> from
> >>>        > ftp.namesys.com, when writing data to a usb harddisk.
> >>>        >
> >>>        > kernel output:
> >>>        > loop4: loop_end_io_transfer err=3D-95 bi_rw=3D0x5=20
> >>>        > reiser4 panicked cowardly: reiser4[pdflush(6748)]:
> >>> commit_current_atom
> >>>        > (fs/reiser4/txnmgr.c:1130)[zam-597]
> >>>        > write log failed (-5)
> >>>        >
> >>>        > reiser4 panicked cowardly: reiser4[pdflush(6748)]:
> >>> commit_current_atom=20
> >>>        > (fs/reiser4/txnmgr.c:1130)[zam-597]
> >>>        > write log failed (-5)
> >>>        >
> >>>        > and the machine is *frozen*
> >>>        >
> >>>        > the harddisk is encrypted via loop-aes v3.1c (loop4). i thin=
k
> it's
> >>> a
> >>>        > reiser4 or kernel 2.6.15 bug, because loop-aes with kernel
> <2.6.15
> >>> is
> >>>        > running quite perfekt. fsck.reiser4 1.0.5 says the filesyste=
m
> is
> >>> clear.
> >>>        >
> >>>       =20
> >>>        can you reproduce the problem?
> >>>       =20
> >>>        > Best Regards,
> >>>        > Patrick=20
> >>>        >
> >>>        >
> >>>       =20
> >>>
> >>>
> >>>
> >>> "Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! Hier klicken"
> >>> www.klarmobil.de/index.html?pid=3D73025
> >>>
> >>>
> >>>   =20
> >>>
> >>>      =20
> >>
> >> ---- weitergeleitete Nachricht Ende ----
> >>
> >>
> >>
> >>
> >> "Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! Hier klicken"
> >> www.klarmobil.de/index.html?pid=3D73025
> >>
> >>
> >>
> >> =20
> >>
> >>    =20
> >
> >
> >  =20
>=20
>=20

--- original Nachricht Ende ----
=0A=0A=0A=0A"Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! Hier kli=
cken"=0Awww.klarmobil.de/index.html?pid=3D73025=0A
