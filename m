From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: 12 Oct 2002 16:34:34 +0200
Message-ID: <1034433275.1266.14.camel@kakapo>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain>
	<001b01c26fff$26d23850$0101a8c0@bummer>
	<20021010165854.4381ed7e.philippe.gramoulle@mmania.com>
	<3DA5B971.3040400@namesys.com>
	<20021010195338.138dffcf.philippe.gramoulle@mmania.com>
	<20021011104041.GC29452@marowsky-bree.de> 
	<20021011125412.2fe02af7.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11662-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021011125412.2fe02af7.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: teodarren@myrealbox.com

Am Fre, 2002-10-11 um 12.54 schrieb Philippe Gramoull=E9:
>=20
> Hi,
>=20
> On Fri, 11 Oct 2002 12:40:41 +0200
> Lars Marowsky-Bree <lmb@suse.de> wrote:
>=20
>   |  On 2002-10-10T19:53:38,
>   |     Philippe Gramoull=E9 <philippe.gramoulle@mmania.com> said:
>   | =20
>   |  > Yes, that's what i meant by "not *out of the box* snapshots".
>   | =20
>   |  Well, LVM functionality comes out of the box with all modern distrib=
utions.
>=20
> Ok let me rephrase it: First i didn't want to start a thread on pros/cons=
 of LVM.
>=20
> And i only wanted to say that LVM (though part of all modern distribution=
s) doesn't
> come installed out of the box,at least not on Debain , which we use mainl=
y.
> Whereas snapshots on Netapp comes out of the box with DATAONTAP.
>=20
> But LVM is there of course if one needs snapshot functionnality.
>=20
Some years ago I was responsible for buying some filers for a very
critical environment (a dealing room), so I got some experiences (also
with errors).

The snapshot functionnality of the filers makes a snapshot on the block
layer on a big filesystem in a minute or so. The mainly needed overhead
are the used blocks between the snapshot (or after the snapshot). This
is not comparable to a snapshot of EMC, which is simply a copy of the
hole disk to another one (with RAID under it and so on ...).

Is LVM comparable to netapp or to EMC snapshot?

I was very impressed by the netapp snapshot because you can make a
snapshot very fast (mainly the inodes are copied) and also online during
the day (which we did). The users could themselfes restore there data
via normal filesystem operations. We had nearly no need anymore to
restore data from tapes.
(This was the reason why I wrote storeBackup, a simple tool which has
some disadvantages and also some advantages compared to a filer.)

Hope this clearyfies the functionality of the Netapp snapshot, which I
think is patented!

--=20
Heinz-Josef Claes			hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
	-> snapshot-like backup to another disk

