From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Lost Files
Date: Wed, 29 Oct 2003 14:20:38 +0100
Message-ID: <3F9FBEA6.6020007@gmx.net>
References: <200310290906.h9T96nsO020624@mail02.webpoint.co.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310290906.h9T96nsO020624@mail02.webpoint.co.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Alexander Waller <a.waller@webpoint.at>
Cc: reiserfs-list@namesys.com

Alexander Waller wrote:
> Hi !
> Yesterday it was the third time I lost important files on a
> reiserfs-partition.
> This time I had a reasonable backup.
> So i could minimize the time my server was offline.
> I use S.u.S.E 8.2.
> The first to times reiserfsck was not able to repair any file. I found all
> of them in the directory /lost+found, but that was not good for me. ( 110=
00
> files there )
> This time about 5000 files were in /lost+found and the rest in the right
> place.
>=20
> Is this a normal behavior or do you think I have a hardware problem ?
> Is the S.u.S.E implementation wrong ?
> Shall I change to ext3 ? ( It=B4s slower, I know )
>=20
> Whats the right strategie to recover a defetive partition ?
>=20
> Alex.
>=20
>=20

I once had a similiar problem, the problem was the AMI Megaraid (now LSI=20
   Logic) controller. It didn't detect failed disks which resulted in 3=20
failed disks of 5 in a raid 5 array and an unused hot spare.
I had to build a completely new raid array. The thrust in megaraid is gone.

If you want to try various methos for disk recovery, you will have to
use dd_rescue to do a complete backup of the data on your disk into a file.
Use the newest reiserfsck.
Copy the backup to a new name, set up a loop back device and run=20
reiserfsck --check on it. Then do what reiserfsck suggests.
If --rebuild-tree recovers to less files you can try --scan-whole-partition.
I don't know a way how to recover the filenames, though.
On a mailstore the files residing in lost+found could be scanned by a=20
script to be placed into the right mailboxes, but that doesn't work
on a webspace :-(

--=20
lg, Chris

