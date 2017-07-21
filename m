From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [DOC] Reiser4 Hybrid Transaction Model
Date: Sat, 22 Jul 2017 00:19:15 +0300
Message-ID: <59726FD3.3050903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-transfer-encoding;
        bh=LpHeXUC/3NCCc5CUeD9egbalueGDzO4cE+ypAiiRjUc=;
        b=j0aBedjYCIHhBZL9jK8fuWznXJhm0oMQcenDXfhX11y1G+BLmWbThBBedc2pIaSW2R
         8vKiQdBmFzAx4XOT0L7YkvUj9na2lcBcPR1thRfL6nfr6jhfSDxzw8pnHUuglGDairAv
         IrsOlIds+mmVmqOYBrQORMHNqGRM97rp61VKk2m8M62eL8fsdYKgoDe42GWXcmpyrAr/
         OclqbJkzgsUeLkAErJvwsmWKB0iTGK6WjWVCUJlbjAqiYKu0+eHTJJ3S0e4/YHQ5P8fC
         ORERyTdqcISB7gLF5yg+T3ysT3ngjqSx8VgGWt7iUFunVYxO8KSblQXTMPP3IvILEv+D
         uq8w==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Hi all,

After numerous requests I have documented the transaction model which
works in Reiser4 by default.


                Reiser4 Hybrid Transaction Model


Reiser4 transaction model is a high-level block allocator. User can
specify (by mount option) any of 3 currently existing transaction
models. First and second ones implement classic journaling and
write-anywhere (Copy-on-Write) transaction models. They are
implemented as a hard-coded models in various file systems. Here
we describe a unique Hybrid Transaction Model suggested by
Joshua Macdonald and Hans Reiser in 2001.


          I. Relocation Decision (relocate or overwrite)


In this transaction model a part of atom's blocks is scheduled to be
relocated (RELOCATE_SET). Another part - to be overwritten
(OVERWRITE_SET). All system blocks (super-block, bitmap blocks, etc)
for obvious reasons always fall to OVERWRITE set. All new nodes (which
haven't had block numbers yet) always fall to RELOCATE_SET. For other
blocks of the atom the relocation decision is based on the statistics
accumulated by a special scanning procedure. A positive decision
(relocate) is made in the case if enough (FLUSH_RELOCATE_THRESHOLD)
nodes were found for flushing (see comments and source code in flush.c
for details).


            II. Block allocation policy for RELOCATE_SET


For the RELOCATE_SET the high level block allocator first allocates
extents of free blocks. Moreover, the block allocator follows the
parent-first order on the RELOCATE_SET considered as tree.

Definition. Parent-first order on a tree is a linear order on tree
nodes determined by the following recursive procedure:

void parent_first(node)
{
     print_node (node);
     if (node->level > leaf) {
         for (i = 0; i < num_children; i += 1)
             parent_first (node->child[i]);
     }
}

Specifically, (node1 < node2) means that the procedure above prints
node1 before node2.

Comment. The definition above assumes that all tree nodes on the same
level were ordered by some linear manner (by the array child[i]).
In our case the mentioned order is determined by their natural
enumeration "from left to right" in the tree.

Reiser4 hybrid transaction model keeps parent-first order on the
RELOCATE_SET in terms of block numbers (disk addresses). It means
that the following implication is true:

     (node1 < node2) => (block_nr(node1) < block_nr(node2))

"<" in the second part of implication means usual linear order on the
set of disk addresses (block numbers).

It is achieved by finding and setting a "preceder" for the
RELOCATE_SET at the very beginning of its relocation. Preceder is the
maximal block number (disk address) with the following properties:

1) it is marked "busy" in the space map;
2) it is smaller than all old block numbers of the given RELOCATE_SET.

Further, during allocation of new block numbers for RELOCATE_SET the
variable containing the preceder gets updated and is passed as a
"hint" to the low-level space allocator.
