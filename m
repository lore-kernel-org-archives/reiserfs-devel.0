From: =?ISO-8859-15?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Strange problems/bugs with reiserfs and reiserfschk
Date: Mon, 08 Aug 2005 00:02:22 +0200
Message-ID: <42F684EE.7010201@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Folks!

There seems to be something I would call a bud in ReiserFS at least in
kernel 2.6.11.11 which can cause the system/computer to freeze. It is
caused by a corruption of the FS but at that point I expected to have
some inaccessable files which I already know from FS corruptions but not
to hang the system. If someone thinks it's worth investigating, please
read further.

Yes, I know that working with a corrupt FS is nothing good but my
intention was simply to save as much of the files as possible before
doing a rebuild-tree just in case it's all gone after that. As I said,
my experience with corrupt ReiserFS was good with the knowledge that
some files/direcories would be incaccessible. But this time the System
was rendered unuseable when accessing certain directories - no more
mount/umount or even sync were possible (they simply did not return) so
there was no way to shutdown the machine. IMHO this should be considered
as a severe bug - refusing to read a corrupt portions of a FS is OK but
rendering the system unuseable is bad.

I'm wondering what kind of information I can provide so the source of
this can be found. Here some but if you want more, please tell me:

Kernel 2.6.11.11, Gentoo-Linux, SMP (HyperThreading P4, 3GHz)

Here some portions of /var/log/messages which may show what's about:
 the messages just before the system got unuseable:

**************
Aug  5 22:17:22 master ReiserFS: sdc1: warning: vs-5150: search_by_key:
invalid format found in block 27594920. Fsck?
Aug  5 22:17:22 master ReiserFS: warning: is_tree_node: node level 57345
does not match to the expected one 1
(****snip****)
Aug  5 22:17:22 master ReiserFS: sdc1: warning: vs-5150: search_by_key:
invalid format found in block 27594920. Fsck?
Aug  5 22:17:22 master ReiserFS: warning: is_tree_node: node level 57345
does not match to the expected one 1
Aug  5 22:17:22 master ReiserFS: sdc1: warning: vs-5150: search_by_key:
invalid format found in block 27594920. Fsck?
Aug  5 22:17:22 master ReiserFS: warning: is_tree_node: node level 57345
does not match tond in block 27594920. Fsck?
Aug  5 22:17:22 master ReiserFS: warmatch to the expected one 1
Aug  5 22:17:22 master unparseable log message: "<nd in block 27594920.
Fsck?"
Aug  5 22:17:22 master ReiserFS: warning: is_tree_node: node levematch
to the expected ond in block 27594920. Fsck?
Aug  5 22:17:22 master ReiserFS: warning: is_tree_node: nmatch to the
expected one 1
Aug  5 22:17:22 master unparseable log message: "<nd in block 27594920.
Fsck?"
Aug  5 22:17:22 master ReiserFS: warning: is_tree_node: node lmatch to
the expected ond in block 27594920. Fsck?
Aug  5 22:17:22 master ReiserFS: warning: is_tree_node: node match to
the expected ond in block 27594920. Fsck?
(****snip****)
Aug  5 22:17:26 master ReiserFS: warning:nd in block 27608085. Fsck?
Aug  5 22:17:26 master ReiserFS: warninmatch to the expected onend in
block 2760 nd in block 27608085. Fsck?
Aug  5 22:17:26 master ReiserFS: warning: is_tree_node: nodematch to the
expected nd in block 27608085. Fsck?
(****snip****)
Aug  5 22:18:03 master ReiserFS: sdc1: warning: vs-5150: search_by_key:
invalid
format found in block 122418791. Fsck?
Aug  5 22:18:03 master ReiserFS: warning: is_tree_node: node level 18499
does no
t match to the expected one 1
Aug  5 22:18:03 master ReiserFS: sdc1: warning: vs-5150: search_by_key:
invalid
format found in block 122418791. Fsck?
Aug  5 22:18:03 master init_special_inode: bogus i_mode (177777)
Aug  5 22:18:03 master ReiserFS: warning: is_tree_node: node level 65471
does no
t match to the expected one 1
Aug  5 22:18:03 master ReiserFS: sdc1: warning: vs-5150: search_by_key:
invalid
format found in block 82406293. Fsck?
**************

The interesting point is that the messages are getting weird at some
point - see portion after the first (****snip****). As if something is
overwriting an internal buffer or something. Maye caused by high
frequency of messages or some race condition between processors? I have
no idea if this is an indication of the suspected bug but that seems
likely to me. The last portion are the last messages just before the
next boot of the computer. Just if you ask - CPU/Memory of that server
are fine as long as Memtest86(+) can tell. So, what's next?

Now to the second part. After giving up to save more data (well, I saved
the important 30% of these 400GB) I started a reiserfsck --rebuild-tree.
It worked quite good until about the end. There it seems to be frozen
and consumes 100% CPU. Here some data:

reiserfsprogs-3.6.19, messages of reiserfsck:

**************
.pass1: block 145817616, item 1, entry 0: The entry ".." of the [259961
259992 0x2 DIR (3)] is hashed with not set whereas proper hash is "r5" -
deleted
100%                         left 0, 212 /sec
Flushing..finished
        268526 leaves read
                203192 inserted
                        - pointers in indirect items pointing to
metadata 1890 (zeroed)
                65334 not inserted
        non-unique pointers in indirect items (zeroed) 28669
####### Pass 2 #######

Pass 2:
0%....20%....40%..vpf-10260: The file we are inserting the new item
(2198390 2199894 0x381 DRCT (2), len 1088, location 3008 entry count
65535, fsck need 0, format new) into has no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (2195955 2195990 0x1
DRCT (2), len 792, location 3304 entry count 65535, fsck need 0, format
new) into has no StatData, insertion was skipped
(****snip****)
vpf-10260: The file we are inserting the new item (563378 563928 0x1
DRCT (2), len 1384, location 2712 entry count 65535, fsck need 0, format
new) into has no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (563378 564627 0xa9
DRCT (2), len 688, location 3408 entry count 65535, fsck need 0, format
new) into has no StatData, insertion was skipped
                                 left 32269, 422 /sec
**************

And that's the point where it's staying for hours now consuming 100%
CPU. I didn't try to abort and start again (yet) as it takes about 20
hours to get so far (the device is big and not so fast) so I'm still
hoping it may finish by itself...

So, is it worth investigating and if, what other info I could provide?
If nobody is interested I will create a fresh FS on the drive and forget
about it. I have my important data so that would be OK.

Keep doing the great job!
Konstantin
