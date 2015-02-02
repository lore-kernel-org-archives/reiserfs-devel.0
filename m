From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4: Precise real-time discard support for SSD devices
Date: Mon, 02 Feb 2015 23:33:01 +0100
Message-ID: <54CFFB1D.6090906@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=w7pgQ/pOTe7CDWlFWydM4IFeScylb+X/Gq1nYITlnpk=;
        b=PwKz1IYkhCsJNt8ktNxyFZ+mDpSH30IIRrqRq/AVpoezPVnPTlmVBGgA9v9nbT4r9X
         +jnXNgZI7/kexbiz7QZjaz7h3+iqfhJUe0ITQQtZSwpysvKXWlmnl7XImElODwbBduk8
         nPC6x67AkRRreYDBRDUeUz8Xr+pV0dv3qFBi0eIxK1NOF5uSsI94lvDsPKQ0ByCxO888
         VJvo3VY+Qs76VebELhfMXX9eCFNlxknnelYX2loDOsQQiKrFMOInZLj9AAt9orxZWF9U
         Wt6vY2bw03HXMYoXqC40eqSi/moZMTyttki3KbGT4kxUp42u8kzjMy79DnYMgCRfBvhb
         oyCw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Ivan Shapovalov <intelfx100@gmail.com>


              Precise real-time discard in Reiser4
                        for SSD devices


        Efficient implementation of real-time discard which
        doesn't lead to accumulation of garbage on disk (set of
        erase units which are marked as free in the file system
        space map, but discard requests wasn't issued for them),
        and, hence, rids of need to periodically run fstrim
        (batch discard) on the device



                           Introduction



Real-time discard support(*) means that file system issues discard
requests, i.e. informs the block layer about extents of freed space.

Currently all Linux file systems with announced feature of real-time
discard support issue so-called "lazy" (or "non-precise") discard
requests. It means that such file systems report exactly about blocks
that were freed. Since erase units in general don't coincide with file
system blocks, such "lazy" technique leads to accumulation of garbage
on disk.

DEFINITION. Garbage is a set of erase units on disk, which are marked
free in the file system space map, but discard requests for them were
not issued.

Indeed, for example, if erase unit is larger than file system block,
then it can happen that "lazy" discard request contains partial erase
units, so that the block layer will round up the start and round down
the end of such discard request. This is because on the one hand trim
operation is defined only for whole erase units. On the other hand,
the block layer doesn't know the status of erase unit, which is freed
only partially, and hence it makes an assumption that it its other
part is "busy" in the file system's space map (the alternative
assumption can lead to data corruption). Note, however, that if such
"forced" assumption is incorrect, and the whole erase unit becomes
free, then such erase unit will become a garbage.

With lazy discard policy user needs to run special tools to clean up
the accumulated garbage.

So, it would be nice to check the status of partially freed erase
units and issue discard request for such unit, if its other part is
also free (marked as free in the file system's space map). The block
layer is not able to perform such checks for obvious reasons: this is
a business of the file system. Below we prove that such checking of
partially freed erase units and issuing discard requests for the
padded extents (we'll call it "precise discard requests") doesn't lead
to accumulation of garbage.

Efficient issuing precise discard requests without performance drop
and ugly workarounds is possible only if the file system possesses an
advanced transaction manager like the one of Reiser4.

Initial idea of precise discard and its implementation of complexity
N_u (where N_u is total number of erase units (including partial ones)
in the resulted set of sorted and merged discard requests) belongs to
Ivan Shapovalov.

Edward Shishkin suggested implementation of complexity 2*N_e, where
N_e is total number of extents in such resulted set.

(*) For more details about trim/discard see
http://en.wikipedia.org/wiki/Trim_(computing)



         1. (De)allocation, discard units and alignment.
               Non-precise and precise coordinates



The minimal unit of all (de)allocation operations in a file system is
a file system block of blk_size.

The minimal unit of all discard operations is a so-called erase unit
of EUS size.

Every file system block can be addressed by its (block) number.
In this case we'll say about addressing in the system of non-precise
coordinates 0Y.

In contrast with non-precise coordinates we'll also consider a system
0X of precise coordinates, where every individual byte on the disk can
be addressed.

In the system 0Y we'll consider (non-precise) extents of blocks (U,V),
where U is the number of the start block, and V is the width of the
extent (in blocks).

In the system 0X we'll consider precise extents of bytes [AB], where A
(A < B) is offset of the first byte and (B-1) is offset of the last
byte of the extent. So, the length of such segment is B-A.

Erase unit size in bytes (EUS) is a property of SSD drive.
Generally erase units don't coincide with file system blocks, so
we'll address erase units in the system OX of precise coordinates
by precise extents. In particular, every erase unit of some SSD
partition is represented in precise coordinates as extent
[EUO + N * EUS, EUO + (N+1)*EUS] for some natural N, where
EUO is the offset of the first complete erase unit (0 <= EUO < EUS).
That is, EUO is a property of individual partitions of SSD drives.
EUO is also called as "alignment".



               3. Lazy (non-precise) discard policy.
                   Accumulation of garbage on disk



The policy of lazy (non-precise) discard is rather simple: if any
extent of blocks (U,V) is freed by the file system, then we issue
discard request for the extent [U * blk_size, (U+V) * blk_size].

Suppose now that EUS != blk_size, or EUO != 0

Suppose, the file system deallocates an extent (2,5) and issue the
respective "lazy" discard request [2 * blk_size, 7 * blk_size],
see the picture below. The block layer assumes that the neighboring
blocks #1 and #7 are busy, and, hence, issues discard request for
the smaller segment [AB].

Note, however, that if this assumption is incorrect, and blocks #1
and (or) #7 were actually free, then after freeing the extent (2,5)
we'll have that the whole erase units [A - EUS, A] and [B, B + EUS]
are marked as free in the file system space map, and hence, will
replenish the garbage. So, the lazy (non-precise) discard policy
leads to accumulation of garbage on disk.



*       *       *       *       *       *       *       *       * > Y
0       1       2       3       4       5       6       7       8
0    blk_size      3*blk_size
*-------*-------*-------*-------*-------*-------*-------*-------*--> X
---+--------+--------+--------+--------+--------+--------+--------+> X
0 EUO     A-EUS      A                          B       B+EUS



Comment. There are 2 independent "sources" of garbage in "lazy"
discard policy:

1) "bad" values of erase unit size (EUS != blk_size);
2) "bad" values of alignment (EUO != 0);



                       4. Precise discard



The idea is to check all "partially deallocated" erase units. If the
whole such unit is marked as free in the file system space map, then
we (file system) issue a discard request for the whole unit. That is,
in contrast with the lazy discard policy, the file system provides
correct status of every partially deallocated discard unit and issues
precise discard request for the larger (padded) extents.

Let's consider the previous example. In accordance with the precise
discard policy file system checks the status of blocks #1 and #7.

If both blocks #1 and #7 are free, then file system issues a discard
request [A - EUS, B + EUS].

If block #1 is free and block #7 is busy, then file system issues
a discard request [A - EUS, B].

If block #1 is busy and block #7 is free, then the file system will
issue discard request [A, B + EUS].

Finally, if both blocks #1 and #7 are busy, then the file system
issues discard request [A, B].

Note that block layer won't restrict such "precise" discard requests,
and, moreover, the following statement takes place:

THEOREM. The policy of precise discard doesn't lead to accumulation
of garbage on disk.

Proof (sketch). Indeed, suppose that disk doesn't contain "garbage".
That is dicard request was issued for every erase unit, which is
marked as free in the file system space map.

Suppose, the file system deallocates extent (2, 5).

If the block #1 is busy and block #7 is free, then, in accordance with
precise discard policy, the file system issues "precise" discard
request [A, B + EUS]. Note that we must not discard the unit
[A - EUS, A], since it contains bytes of the busy block #1. Also,
note that we don't need to discard other units due to the assumption,
that before deallocation disk didn't contain garbage.
Thus, we have that discard requests have been issued for every
erase unit, which is marked as free in the file system space map.

By the similar way we can prove that "precise" discard policy doesn't
leave garbage on disk in other 3 cases (when block #1 is free and
block #7 is busy, both blocks #1 and #7 are free, and both blocks #1
and #7 are busy.



              5. Implementation of precise discard



The straightforward solution is to check the status of partially
deallocated erase units in the file system's space map. However,
efficient implementation of such solution requires an advanced
transaction manager and not less advanced block allocator.
In particular, you need to make sure that nobody will occupy the
other parts of your partially deallocated erase units while you are
issuing precise discard requests for them (otherwise, data
corruption is possible).

Reiser4 block allocator manages the following in-memory
data-structures:

. working space map (W)
. commit space map (C)
. deallocation set (D)

Allocation in Reise4 is always going on the working space map:

(1)   W' = alloc(W, R); - allocate a set R of block numbers in the
       working space map W.

Deallocation is a bit more complicated: all freed block numbers at
first are recorded in a special data structure - deallocation set D:

(2)   D' = dealloc(D, R);

Before committing a  transaction we update the commit space
map C at so-called pre_commit_hook():

(3)   C' = apply(C, D);

After committing the transaction, that is  after issuing all write
requests (including the commit space map C) we prepare and
issue discard requests in so-called post_write_back_hook():

(4)   prepare_and_issue_discard_requests();

After issuing discard requests we update the working space map:

(5)   W' = apply(W, D');


               Handling paddings of partial erase units


When preparing discard set at stage (4) we check head (tail) padding
of every partial erase unit. If it is free, we allocate it at the
working space map:

W" = alloc(W', R');

At the same time we record the allocated paddings to the deallocation
set:

D" = dealloc(D', R');

Updating the working space map at the stage (5) automatically
deallocates the paddings:

apply(W", D") = W" \ R' = (W' + R')\ R'= W'.



                        6. How to test



Apply the patch against reiser4-for-3.17.3:
http://sourceforge.net/projects/reiser4/files/patches/3.17.3-reiser4-precise-discard-support.patch.gz

Format a reiser4 partition with reiser4progs-1.0.9. Use mkfs option
-d to "discard" the whole partition on your SSD drive at format time.

We recommend to use compression for SSD drives (by default it is
turned on).

Mount a reiser4 partition with mount option "discard".
Find a kernel message about discard support:
reiser4: sdX: enable discard support (erase unit Y bytes,
alignment Z bytes)

We recommend to use Write-Anywhere (AKA Copy-On-Write) transaction
model for SSD drives (mount option "txmod=wa").

Also we recommend to use mount option "noatime" for SSD drives.

