From: "David Fendrich" <david@fendrich.net>
Subject: reiserfsck 3.6.11 locks up
Date: Sun, 21 Dec 2003 05:27:58 -0800
Message-ID: <196401c3c7c6$3ff2e1c0$74cb010a@mail2world.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_1965_01C3C783.31CFA1C0"
Return-path: <reiserfs-list-return-16360-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_1965_01C3C783.31CFA1C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I have a disaster on my hands. I have important data on a HD which
crashed a few days ago. It turns out that the back up system has been
down for 1 month, so I really need to recover data from this HD. I used
dd_recover to rescue what I could to a clean drive (very few blocks were
damaged, fortunately).

I then mounted this 200 gig file with losetup and ran reiserfsck --check
on it. Reiserfsck said that I needed to run with --rebuild-tree. So I
did. Pass 0 went fine. Pass 1 locked up everything after 40%. I
downloaded the latest reiserfsck (my first version was 3.6.6 or
something like that) and tried again. Same result at the exakt same
position.

I am almost certain that there is nothing wrong with the new HD, so what
am I to do?

Is is wrong to run from a loopback device? Should I copy the large file
right on to an empty partition with dd if=/dev/loop0 of=/dev/hda1 -bs=1M
? Does it matter on hda1 is larger than the original partition?

If the output from debugreiserfs helps, here it is:
debugreiserfs 3.6.11 (2003 www.namesys.com)


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x700 of format 3.6 with standard
journal
Count of blocks on the device: 49520336
Number of bitmaps: 1512
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 49520336
Root block: 0
Filesystem is cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
Device [0x0]
Magic [0x0]
Size 8193 blocks (including 1 for journal header) (first block 18)
Max transaction length 1024 blocks
Max batch size 900 blocks
Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa02:
FATAL corruptions exist.
sb_version: 2
inode generation number: 1721538
UUID: 68aba5d9-12cf-48f5-aa3e-648bda76c37c
LABEL:
Set flags in SB:
ATTRIBUTES CLEAN



------=_NextPart_000_1965_01C3C783.31CFA1C0--

