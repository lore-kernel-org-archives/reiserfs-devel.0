From: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: 06 Jun 2003 00:34:17 +0200
Message-ID: <1054852456.3738.457.camel@arabia.home.lan>
References: <20030523192440.7221.qmail@web40015.mail.yahoo.com>
	 <3EDCDFAA.5050802@namesys.com> <1054703871.3739.68.camel@arabia.home.lan>
	 <3EDDBEA1.6040708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EDDBEA1.6040708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 2003-06-04 at 11:40, Hans Reiser wrote:
> So if I understand right, the level is determined by what the key is.  

Hans, I am afraid this discussion is getting confusing, because we are
actually discussing three different data structures, and with you
traveling around attention gets spotty and concepts get mixed up. :)

I will try to sum up:

First there were the "skip list", invented by Puig in 1991, I think.

Skip lists are interesting because they need no re-balancing. Their
structure is completely independent of the history of insertions and
deletions. Operations are fast and very elegant. It is claimed they beat
AVL-trees and many other structures by constant factors.

However, skip lists are not easy to use in a massively parallel
algorithms. One has to lock a large portion of the skip list before
updating it, and keep this lock until finished. Also, the nodes have a
varying number of pointers in them (constant for a given node, though).
This leads to some allocation issues.

Then came the skip trees. Somebody (forgot his name) discovered that
every skip list could be transformed into an equivalent skip tree, and
vice versa.

Skip trees are rather similar to B-trees. However there is no upper
bound to the number of keys in a node, so the node might have to occupy
multiple disk blocks. Probability laws will keep the vast majority of
the nodes small. (Just how small is tunable.)

The Skip tree algorithms have the nice feature that you can lock a node
to operate on it, then lock some of its children, release the parent,
etc, proceeding toward the leafs. This is nice because two processes
could work on the tree at the same time without risking deadlocks. This
makes skip trees interesting for parallel algorithms.

Now Kevin has observed that rather than converting a skip list into a
skip tree, one can convert it into what he calls a "split tree". Split
trees are binary trees where every node has an attribute "level", a
small integer. Thus, nodes are of fixed size (provided keys are). 

Besides the usual key-ordering invariants, split trees obey the law that
the children of a node have no higher level than the node itself. The
level is assigned the same way as in skip lists: at random when the node
is created, with low levels chosen more often. It is not necessarily a
function of the key, but your question made me think that was another
interesting idea.

Split trees have the same downward lock propagation as skip trees,
making them interesting for parallel processing applications.

However, the last few mails have been describing the skip list to you.
Originally I think the skip lists were only mentioned as a supposedly
known reference when describing the split tree. 

A skip list is at first a singly lined list containing all nodes and
ordered by ascending keys. There are additionally two dummy nodes Head
and Tail (or Nil in the literature), with suitable dummy keys. Scanning
this list for a given key is O(N).

But then there is a second list, which includes on average some fraction
of all nodes, typically half of them. These nodes are then members of
both lists at once. They must have multiple "next" pointers one for each
list. Scanning this list for a given key is faster than the first list,
but you might not find the key. However, if you don't find the node with
key K, you can locate consecutive nodes with keys J and L in this list
such that J < K < L.  Since node(J) is member of list one too, you can
switch to scanning list one starting from node(J) . That gives you the
speed of list two, yet the completeness of list one.

But just as list two is a fast lane compared to list one, there is a
list three whose members is a subset of those of list two, and further
lists, each a faster lane to get quickly at any point in the previous
list.

Notice that Head and Nil are members of all lists. The following search
procedure is O(lnN): Start at Head and scan the fastest list and drop
subsequently down to lower-level (slower/more complete) lists whenever
you would otherwise step into nodes with larger keys than the one you
are looking for.

When a node is created, a random number "level" is assigned to it, and
then then node is inserted into the first "level" lists in its correct
place according to the key ordering.  A node never changes its level. It
remains a member of the same lists until it is eventually removed from
all of them.

> Suppose that for key K the determined level is 3, but there are no 
> other 
> records in the tree?  Is K then stored at a node at level 1 until such 
> time as a level 1 key is created for it to be attached to, or does one 
> create empty level 1 and level 2 nodes?

If we are still describing the skip list, no. K is stored at level 3,
and no empty nodes of level 1 or 2 are created. However, node(K)
is simultaneously member of three lists. One list holds nodes with level
>= 1, i.e. all nodes. Another is for nodes with level >= 2, and that is
usually about half the nodes. The third list contains all nodes with
levels 3 and higher.

Using a variation of Kevin's diagram notation, we could depict the list
with a single node with key K and level three: Horizontally repeated
letters are the same node, but the node is member of multiple lists.
Vertical lines are pointers, 'v' are arrowheads.

A----A----A----A...  (This is a single node called Head and with a dummy
|    |    |    |      key smaller than any legal key. It is member of
|    |    |    |      all lists. )
v    v    v    |
K----K----K    |     (K is simultaneously member of three lists. It is 
|    |    |    |      not member of the fourth list (or any higher
|    |    |    |      list.)
v    v    v    v
Z----Z----Z----Z...  (This is the final node, a dummy node of infinite
                      level, and thus (final) member of all lists. Its
                      key is a dummy key larger than any legal key.)

Regards, Enrique

