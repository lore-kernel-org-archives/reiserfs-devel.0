From: Andreas Abele <aba@IZS.FhG.de>
Subject: mkreiserfs and big RAID-Systems
Date: 15 Jul 2002 15:59:33 +0200
Message-ID: <1026741573.30600.25.camel@pallas.IZS.FhG.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

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






