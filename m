From: Roland =?iso-8859-1?q?H=E4der?= <webmaster@autoinstaller.de>
Subject: Bad root block 0
Date: Sun, 7 Sep 2003 14:23:56 +0200
Message-ID: <200309071423.56015.webmaster@autoinstaller.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello,

I have created an image on this way:

dd if=3D/dev/urandom of=3Dimage.file bs=3D1k count=3D98288

And I have latest 3.6.11 ReiserFS tools. So I setup the loop-back device:

losetup -e rc6 /dev/loop3 image.file

RC6 need a keysize. I use 256 Bits and entered a password.

I created a ReiserFS on it: mkreiserfs /dev/loop3

This happens all yesterday.

I never used any resizer tools and I did not run reiserfschk while it was m=
ounted. Also my box did not crash while it was mounted.

Today I setup the loop-back device on same way (and same password!) again a=
nd try to mount it:

$: mount /dev/loop3 /mnt
mount: Not a directory
$:

Well, /mnt *is* definely a directory...

When I do a reiserfschk --rebuild-tree I got this:

Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Sun Sep  7 14:22:00 2003
###########
=20
Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 8211 blocks marked used
Skipping 8211 blocks (super block, journal, bitmaps) 0 blocks will be read
=20
Could not find a hash in use. Using "r5"
        "r5" hash is selected
=46lushing..finished
        Read blocks (but not data blocks) 0
                Leaves among those 0
                Objectids found 2
=20
Pass 1 (will try to insert 0 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
=20
=46lushing..finished
        0 leaves read
                0 inserted
####### Pass 2 #######
=46lushing..finished
=20
=20
No reiserfs metadata found. ... ... ...

And debugreiserfs -d /dev/loop3 shows me this:

debugreiserfs 3.6.11 (2003 www.namesys.com)
=20
=20
=46ilesystem state: consistency is not checked after last mounting
=20
Reiserfs super block in block 16 on 0x703 of format 3.6 with standard journ=
al
Count of blocks on the device: 24492
Number of bitmaps: 1
Blocksize: 4096
=46ree blocks (count of blocks - used [journal, bitmaps, data, reserved] bl=
ocks): 24492
Root block: 0
=46ilesystem is cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x9cdd049]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
=46s state field: 0xfa02:
        FATAL corruptions exist.
sb_version: 2
inode generation number: 0
UUID: 7691903f-ec2b-4c06-9cf2-eaa545c7db77
LABEL: Haspa-Banking
Set flags in SB:
        ATTRIBUTES CLEAN
65534 expected, 0 found in 0
Block 0 contains unformatted data
print_disk_tree: bad block type (level=3D0, nr_items=3D0, free_space=3D0 rd=
key)
=46ile system uses 0 internal + 0 leaves + 0 unformatted nodes =3D 0 blocks

So, how can I safely fix the image? Or restore needed data (like my Online =
Banking Keyfile)

Chears,
  Roland H=E4der

