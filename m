From: j_kanev@arcor.de
Subject: reiserfsck --rebuild-tree aborted
Date: Tue, 14 Mar 2006 19:29:56 +0100 (CET)
Message-ID: <8706922.1142360996567.JavaMail.ngmail@webmail13>
References: <33411075.1142359382625.JavaMail.ngmail@webmail13>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28252-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-list@namesys.com

=20
(sorry for multiple posts)

After a crash my reiserfs partition behaved strangely (space usage 100%, ro=
ot wasn't allowed to see some files or write into some directories, and som=
e error messages when accessing files).
fsck.reiserfs found errors which it said must be corrected with --rebuild-t=
ree.=20
fsck.reiserfs --rebuild-tree aborted with the message "low on disk space". =
Why is this? And:

What should I do now?=20

Lots of regards, Jacob.

P.S.:
I don't really have a larger partition.

P.P.S.:=20
The reiserfs-partition was used last with a 2.6.15-1 kernel, and fsckreiser=
fs (see above) was run with a 2.6.14 kernel from Kanotix. The reiserfsprogs=
 version was 3.6.19-1. Output of debugreiserfs was the following:=20

Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x301 of format 3.6 with standard journ=
al
Count of blocks on the device: 749936
Number of bitmaps: 23
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] bloc=
ks): 749936
Root block: 0
Filesystem is clean
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
=09Device [0x0]
=09Magic [0x25eec705]
=09Size 8193 blocks (including 1 for journal header) (first block 18)
=09Max transaction length 1024 blocks
=09Max batch size 900 blocks
=09Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa02:
=09FATAL corruptions exist.
sb_version: 2
inode generation number: 881401
UUID: 9bcc8b2b-97e6-4a66-aae6-6d6808e3ac15
LABEL:=20
Set flags in SB:
=09ATTRIBUTES CLEAN


   ____________________
   jacob kanev
   mail: j_kanev@arcor.de
      (any eMail with attached Microsoft-only files
      will be regarded as spam)
   phone: +49 30 42087590


Viel oder wenig? Schnell oder langsam? Unbegrenzt surfen + telefonieren
ohne Zeit- und Volumenbegrenzung? DAS TOP ANGEBOT JETZT bei Arcor: g=FCnsti=
g
und schnell mit DSL - das All-Inclusive-Paket f=FCr clevere Doppel-Sparer,
nur  44,85 =80  inkl. DSL- und ISDN-Grundgeb=FChr!
http://www.arcor.de/rd/emf-dsl-2
