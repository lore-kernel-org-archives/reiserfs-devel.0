From: "Alexander Saers" <alex@saers.com>
Subject: Re: mkreiserfs and big RAID-Systems
Date: Mon, 15 Jul 2002 17:47:44 +0200
Message-ID: <003a01c22c16$f6ab2870$e4d22fc2@acealex>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Abele <aba@IZS.FhG.de>, reiserfs-list@namesys.com

Are you sure that you dont have looked at the wrong valus. I mean, when
running raid-5 you loose some storage space and gain some redundance. You do
that by adding checksum on one or several disks. Very often you also have
stand in disks "spare - disks" that actually not are used at all. But when
one disk fails they are connected in.

So my advice are to check your raid config and se what the actual raid size
is. Also check what harddrive that are in the raid array and start counting
and se if it all matches your numbers

/Alexander

----- Original Message -----
From: "Andreas Abele" <aba@IZS.FhG.de>
To: <reiserfs-list@namesys.com>
Sent: Monday, July 15, 2002 3:59 PM
Subject: [reiserfs-list] mkreiserfs and big RAID-Systems


Hello,

I have a RAID5-Set with 840 GB netto here.

1.) fdisk shows:

Festplatte /dev/sdf: 255 K=F6pfe, 63 Sektoren, 104623 Zylinder
Einheiten: Zylinder mit 16065 * 512 Bytes
    Device boot.  Start       End    Blocks   Id  Dateisystemtyp
/dev/sdf1   *         1    104623 840384216   83  Linux
                                  ^^^^^^^^^
2.) mkreiserfs /dev/sdf1
3.) mount /dev/sdf1 /users1/p1
4.) df /dev/sdf1
Dateisystem          1K-Bl=F6cke    Benutzt Verf=FCgbar Ben% montiert auf
/dev/sdf1            720312060     32840 720279220   1% /users1/p1
                     ^^^^^^^^^

Where are the remaining 120 GBytes?

Cross-Test with ext2

2a.) mke2fs /dev/sdf1
3a.) mount /dev/sdf1 /users1/p1
4a.) df /dev/sdf1
Dateisystem          1K-Bl=F6cke    Benutzt Verf=FCgbar Ben% montiert auf
/dev/sdf1            827197400        20 785178172   1% /users1/p1
                     ^^^^^^^^^

What is happening here? When i run mkreiserfs, the programs last
blocknumber seen is 180060160, which is exactly a1/4 of the mounted
kilobytes (4k-Blocks okay). But where are the remaining 120 G-Blocks?

Any ideas? According to the reiserfs-specs a filesystem can hold 17.6
TBytes.

kind regards
Andreas Abele









