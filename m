From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [ANNOUNCE] Reiser4: Different Transaction Models
Date: Tue, 11 Mar 2014 02:00:42 +0100
Message-ID: <531E603A.4040709@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=YJjIRQuxqTr0Oyi5zHHARKg5kfH0aG9Pz8y35KTZbZY=;
        b=NKrEnyTDjjn9Htv/y/DD2/2ieSbHONFKaeEy9rWHx3ZnetYmeIkCftZ6rWTgRT1IHA
         SDUkPZ+T+nGGbgYemvNL0v+2VrPJsTXo2grjpfbLwEg/0cvCFcLyZDjUscv27WS3fptd
         Jg8C4MrTqtPmDKFODFKm80fVr9iib2zOmI+J8n5HJqozhndYPtAkr2QPnT/7Z/2F+xME
         LzfmfvMfRv82ooQTdm+aSlswSvxwmRdTv0WW1t3/K9+KBn8/uwoZtyIaQFZ7e2Mn8Bc+
         Id1cl3PIqYb29eFXwz22gfPmMTGKVmpExOGefZ7vl4al7DByOsHgbn+h/JWNmu7K/nI5
         RW8Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Hi all,

I am glad to announce a new unique feature of simple reiser4 volumes.

As you probably know, all other file systems implement only a single
transaction model. That is, they all are either only journalling
(ext3/4, ReiserFS(v3), XFS, jfs, ...), or only "write-anywhere"
(ZFS, Btrfs, etc).

However, journalling file systems are not the best choice for SSD
drives (as they issue larger number of IOs because of double writes -
first you should write to journal, and then to the permanent location
on disk. As you guess, larger number of IOs means performance drop and
reduced life of SSD drives.

As to "write-anywhere" file systems: they work badly with HDD drives.
Indeed, in accordance with this transaction model you can not
overwrite blocks on disk. Instead, you should write the modified
buffers to different location, and after making sure that they have
been written successfully, deallocate old blocks (sometimes this
transaction model is called "Copy-on-Write", but we will use the
historically first name "Write-Anywhere"). Such mandatory relocations
lead to rapid external fragmentation, especially when you perform a
lot of overwrites at random offsets. Respectively, the performance
rapidly degrades. To improve the situation you need to incessantly run
defragmentation tools.

Reiser4 users now can choose a transaction model which is most
suitable for their devices. This is very simple: just specify it by
respective mount option. With the patch applied you will have 3
options:

1) Journalling (mount option "txmod=journal").

In this mode all overwritten buffers (nodes) will be committed via
journal (I remind that instead of obsolete "journal block devices"
Reiser4 uses more advanced technique of wandering logs).

This mode is for HDD users, who complained about fragmentation of
reiser4 volumes. I imagine, that this is not a 100% panacea against
fragmentation, but it is better than nothing: in this mode the
situation with fragmentation has to be not worse than in ReiserFS(v3)!
Alas, the 100% panacea (reiser4 repacker) is still a long-term todo.

2) Write-Anywhere, aka Copy-on-Write  (mount option "txmod=wa")

All modified nodes in this mode will get new location on disk (like
in ZFS, Btrfs, etc). In this mode reiser4 doesn't make active
attempts to defragment atoms. In this mode reiser4 will issue minimal
number of IOs, however reiser4 volumes will be rapidly fragmented.
This option is only for SSD users.

3) Hybrid transaction model (mount option "txmod=hybrid")

This is the default model suggested by Hans Reiser and Josh MacDonald
in ~2002. This model uses an advanced feature of reiser4 transaction
manager, so-called "compound checkpoints", which means that a part of
dirty nodes is committed via journal (overwrite), and another part is
committed via write-anywhere technique (i.e. gets another location on
disk). All relocate-overwrite decisions in this mode are results of
attempts to defragment locality of atoms that are to be committed.
Clean nodes of this locality also can be involved to the commit
process (their location on disk will be changed, if it provides
excellent results).

In this model number of issued IOs is not so large as in traditional
Journalling model, and fragmentation is not so rapid as in traditional
Write-Anywhere (CoW) model.

However, such local defragmentation doesn't help a lot in some cases
of workload, and I periodically get complaints from users about
degradation of reiser4 volumes. So, this model is for HDD users, who
don't perform a lot of random overwrites. Once the repacker is ready,
I'll recommend this mode for all HDD users (just because pure
journalling is anyway suboptimal for HDD drives).


                  WARNING!!! WARNING!!! WARNING!!!


Only default (hybrid) mode is safe. Other ones (Journalling and
Write-Anywhere) need more testing - don't use them for important data
for now.


                       Implementation details


We introduce a new layer/interface TXMOD (Transaction MODel) called
at flush time for reiser4 atoms. Every plugin of this interface is
a high-level block allocator, which assigns block numbers to dirty
nodes, and, thereby, decides, how those nodes will be committed.

Every dirty node of reiser4 atom can be committed by either of the
following two ways:
1) via journal;
2) using "write-anywhere" technique.

If the allocator doesn't change on-disk location of a node, then this
node will be committed using journalling technique (overwrite).
Otherwise, it will be committed via write-anywhere technique (relocate)

             relocate  <----  allocate  --- >  overwrite

So, in our interpretation the two traditional "classic" strategies in
committing transactions (journalling and "write-anywhere") are just
two boundary cases: 1) when all nodes are overwritten, and 2) when all
nodes are relocated.

Besides those 2 boundary cases we can implement the infinite set of
their various combinations, so that user can choose what is really
suitable for his needs.


                      How it looks in practice


Let's create a large enough file on a reiser4 partition (let it be a
645K /etc/services):

# mkfs.reiser4 -o create=reg40 /dev/sdb5
# mount /dev/sdb5 /mnt
# cp /etc/services /mnt/.
# umount /mnt
# debugfs.reiser4 -t /dev/sdb5

NODE (23) LEVEL=2 ITEMS=2 SPACE=3968 MKFS ID=0x4ed8c6de FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [24]
------------------------------------------------------------------------------
#1  EXTENT (extent40): [2a:4(FB):73657276696365:10000:0] OFF=36, LEN=16, 
flags=0x0
UNITS=1 [25(162)]
==============================================================================

We can see that file data is represented by a single extent of 162
blocks starting at block #25. Let's overwrite first 100K of this file
in journalling transaction model:

# mount /dev/sdb5 -o txmod=journal /mnt
# dd if=/dev/zero of=/mnt/services bs=100K count=1 conv=notrunc
# umount /mnt
# debugfs.reiser4 -t /dev/sdb5

NODE (23) LEVEL=2 ITEMS=2 SPACE=3968 MKFS ID=0x4ed8c6de FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [24]
------------------------------------------------------------------------------
#1  EXTENT (extent40): [2a:4(FB):73657276696365:10000:0] OFF=36, LEN=16, 
flags=0x0
UNITS=1 [25(162)]
==============================================================================

We can see that overwritten nodes occupy the same location on disk,
and our extent hasn't beed destroyed (fragmented). Moreover, the
modified parent node occupies the same location on disk (block #23).

Let's now overwrite first 100K of this file in Write-Anywhere
(Copy-on-Write) transaction mode:

# mount /dev/sdb5 -o txmod=wa /mnt
# dd if=/dev/zero of=/mnt/services bs=100K count=1 conv=notrunc
# umount /mnt
# debugfs.reiser4 -t /dev/sdb5

NODE (213) LEVEL=2 ITEMS=2 SPACE=3952 MKFS ID=0x4ed8c6de FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [187]
------------------------------------------------------------------------------
#1  EXTENT (extent40): [2a:4(FB):73657276696365:10000:0] OFF=36, LEN=32, 
flags=0x0
UNITS=2 [188(25) 50(137)]
==============================================================================

We can see, that first 100K (25 blocks) has been relocated in
accordance with "Write-Anywhere" transaction model: initial extent has
been split into 2 ones: first unit consists of 25 relocated blocks,
which start at block #188, and second unit consists of 137 blocks,
which occupy the same location on disk. Modified parent also got new
location (block #213 - was #23).

Let's calculate total number of IOs issued when overwriting the file
in different modes:

1) Journalling

50 blocks were submitted for data modification (25 has been
written to journal, and 25 to permanent location);
2 blocks were submitted to modify parent (block #23 in the dump)
(1 to journal, and 1 to permanent location);
2 blocks to modify bitmap (1 to journal, and 1 to permanent location)
2 blocks to modify superblock (1 to journal, and 1 to permanent
location)
--------------------
Total: 56 blocks.

2) Write-Anywhere (Copy-on-Write)

25 blocks were submitted (relocated) for data modifications;
1 block was submitted to modify parent, which got new location #213;
2 blocks were submitted to modify bitmap (1 to journal, and 1 to
permanent location);
2 blocks were submitted to modify superblock (1 to journal, and 1 to
permanent location);
NOTE: system blocks (bitmaps, superblock, etc) can not be relocated in
reiser4, so we always commit them via journal.
---------------------
Total: 30 blocks.

So we have 56 IOs issued in journalling mode against 30 IOs in
Write-Anywhere. However, fragmentation is a payment for the smaller
number of IOs in Write-Anywhere mode (see the last dump, where we have
2 extents). So this transaction model is only for SSD drives, as they
are not sensitive to external fragmentation. Again, "journal" is for
HDD, and "wa" is for SSD, please, don't confuse!

----------------------------------------------------------------------
  MOUNT OPTION                 INTENDED FOR                  DEFAULT
----------------------------------------------------------------------
txmod=journal            HDD users                             no
----------------------------------------------------------------------
txmod=wa                 SSD users                             no
----------------------------------------------------------------------
txmod=hybrid             HDD users, who don't perform          yes
                          a lot of random overwrites
----------------------------------------------------------------------

Please, find the patch against reiser4-for-3.13.1 here:
http://sourceforge.net/projects/reiser4/files/patches/

As usual, bugreports, comments, questions, experiences (and not only
negative ones) are welcome.

Thank you for choosing Reiser4!

Edward.

