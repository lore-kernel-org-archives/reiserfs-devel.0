From: =?ISO-8859-15?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Reiser3 bug in 2.6.11.11
Date: Tue, 15 Nov 2005 00:13:07 +0100
Message-ID: <43791A03.9030305@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello!

A few days ago I encountered a reiser3 bug in vanilla kernel 2.6.11.11.
I have no idea if it has been fixed in a recent kernel but here some
info if somebody is interested.

Short: some values seem to be untested and a corrupted fs generates
kernel oopses.

Details: on a laptop something caused a fs corruption (probably in
connection with swsusp but that's only a guess as I got it a few days
later) which caused it to oops/panic/hang shortly after first accesses
to the disk. Grub seems to have no problems and initial access was OK as
init started and first system startup messages appeared. But then a
bunch of oopses appeared fast so I was not able to find which part of
the kernel was causing the first error and then the keyboard stops
responding so I couldn't scrollback. At that point only powering down
was possible. I can't tell if it happens while fs was RO or when/after
it was remounted RW. And as there was no network or disk access at that
point recovering some information was not possible.

But maybe the log files of reiserfsck can help identify the culprit
(could it be something with the blocksize messages?):

reiserfsck:
---------------------------------
bad_path: block 8435, pointer 11: The used space (3888) of the child
block (32773) is not equal to the (blocksize (4096) - free space (224) -
header size (24))
bad_path: block 2283225, pointer 29: The used space (4072) of the child
block (6160385) is not equal to the (blocksize (4096) - free space (180)
- header size (24))
block 1049101: The number of items (59) is incorrect, should be (57)
 the problem in the internal node occured (1049101), whole subtree is
skipped
bad_path: block 3145901, pointer 40: The used space (2432) of the child
block (557840) is not equal to the (blocksize (4096) - free space (1740)
- header size (24))
vpf-10640: The on-disk and the correct bitmaps differs.
---------------------------------

reiserfsck -rebuild-tree:
---------------------------------
####### Pass 0 #######
block 1049101: The number of items (59) is incorrect, should be (57) -
corrected
block 1049101: The free space (65504) is incorrect, should be (68) -
corrected
block 1545017: The number of items (2) is incorrect, should be (0) -
corrected
block 1545017: The free space (43432) is incorrect, should be (4072) -
corrected
block 4131356: The number of items (7) is incorrect, should be (0) -
corrected
block 4131356: The free space (0) is incorrect, should be (4072) - corrected
508677 directory entries were hashed with "r5" hash.
####### Pass 1 #######
####### Pass 2 #######
####### Pass 3 #########
vpf-10650: The directory [2 5300] has the wrong size in the StatData
(5544) - corrected to (5504)
vpf-10680: The file [397629 106971] has the wrong block count in the
StatData (0) - corrected to (8)
rebuild_semantic_pass: The entry [397629 111711] ("xinetd.pid") in
directory [397629 403911] points to nowhere - is removed
vpf-10680: The file [397629 111702] has the wrong block count in the
StatData (8) - corrected to (0)
vpf-10650: The directory [397629 403911] has the wrong size in the
StatData (432) - corrected to (400)
vpf-10650: The directory [102361 1849502] has the wrong size in the
StatData (840) - corrected to (808)
####### Pass 3a (lost+found pass) #########
---------------------------------

As you can see, it seems to be a tiny corruption but with devastating
results ;-). No data seemed to be lost after rebuild-tree.

Have a nice day,
--=20
Konstantin M=FCnning
