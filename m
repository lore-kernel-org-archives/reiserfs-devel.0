From: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: 09 Jun 2003 17:33:58 +0200
Message-ID: <1055172836.20593.283.camel@arabia.home.lan>
References: <20030608052613.19341.qmail@web40008.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030608052613.19341.qmail@web40008.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kevin Bealer <kevinbealer@yahoo.com>
Cc: reiserfs-list@namesys.com

On Sun, 2003-06-08 at 07:26, Kevin Bealer wrote:

> I may have accidentally called my version a skip
> tree.  If skip tree is another version, I'm not

I won't discard completely the possibility that it was me that
short-circuited to skip trees when seeing "split tree" some lines below
"skip list"...

In any case, this is my description of a skip tree:

A skip tree is just like a B-tree except that the number of keys in a
node may be zero, and has no upper bound. Keys are not repeated at lower
levels, and "payload data" associated with a key is stored with the key,
usually in the form of a pointer. 

These data pointers are not further mentioned. In what follows all
pointers are pointers to skip tree nodes.

Thus a skip tree of 

   height 0     is empty,
   height 1     is a node with zero or more keys in ascending order, 
   height h > 1 is a node with zero or more keys, k_1,...,k_n, in
                ascending order, and n+1 pointers p_0,...p_n to height
                h-1 skip trees. 

The keys accessible directly or indirectly through pointer p_i in a
node, have values between the keys k_{i-1} and k_i in the node.

On insertion, a level h is randomly assigned to the new key. 

If the skip tree already has height h (sub)trees, the key is inserted
into the root node of the unique height h (sub)tree where the key is
permitted by the ordering constraints. If the new key becomes k_i in the
node, the node pointed to by p_{i-1} is split in two, one node becomes
the new p_{i-1}, the other becomes the new p_i. Former keys k_i,...,k_n
are renumbered k_{i+1},...,k_{n+1}, and the former pointers p_i,..,p_n
are renumbered p_{i+1},...,p{n+1}. Nodes two levels below h are not
changed.

If no level-l node exists, one is created with the new key, and as many
empty nodes are created as needed to make the tree have two subtrees of
height l-1. The original tree's root node is split in two if required
and the parts used instead of empty nodes at the appropriate place in
the subtrees below the new root node.

Converting a skip list into a skip tree is straightforward.

The head and nil nodes of the skip list are not included in the skip
tree.

A skip tree whose highest level with nonzero population is L, is
converted to a skip tree of height L.

The elements in the top-level list are placed in the root node of the
skip tree.

In a skip list, if a and b are level l nodes that are consecutive in the
level l list, then the nodes between a and b in the lower level lists
form a skip list with a and b as head and nil respectively.

This (sub)skip list is converted in the same way as the original skip
list, so the keys of the level l-1 nodes between a and b form the root
node of a skip (sub)tree. Notice that there may be zero keys in this
(subtree) root node, since there may be no level l-1 nodes between a and
b.

The skip tree is a structure where the power-of-two  distribution of the
levels is often not optimal. Using a block size that can accommodate N
keys per one-block node, I guess something near 3N/4 keys of level l-1
for each level l key is optimal. The trade-off is between the cost of
having a linear list of blocks to constitute a single logical node when
there are too many keys (and most of the time the second block will have
very few keys in it), against the cost of having more levels if each
node has few keys. 3N/4 corresponds to a p value of 4/(3N). Then level 1
must be chosen (1-p) of the time, level 2 (1-p)*p of the time, etc. If
you expect your data to have less than MAX keys over the lifetime of the
tree, you would clamp the level to be no more than log_{3N/4}(MAX) + 1.

Regards, Enrique

