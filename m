From: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: 04 Jun 2003 07:17:52 +0200
Message-ID: <1054703871.3739.68.camel@arabia.home.lan>
References: <20030523192440.7221.qmail@web40015.mail.yahoo.com>
	 <3EDCDFAA.5050802@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EDCDFAA.5050802@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Kevin Bealer <kevinbealer@yahoo.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, reiserfs-list@namesys.com

On Tue, 2003-06-03 at 19:49, Hans Reiser wrote:
> Kevin Bealer wrote:

> >Skip lists (turned 90 degrees) look like:
> >
> >topnode--x------x
> >C0
> >A1-----A1-----A1
> >C2
> >C3
> >B4-----B4
> >C5
> >A6-----A6-----A6
> >C7
> >C8
> >B9-----B9
> >C11
> >A12----A12----A12
> >
> >With pointers vertically between all aligned letters
> >(conceptually at least).

> I don't understand the diagram above, which means I don't understand the 
> rest.  I think you are explaining something you understand too well to 
> explain....;-)

This is a skip list. 

Each line in the diagram represents a single node.

Each node is given a randomly chosen "level", a small number. A node
never changes level in its lifetime. Diagram lines with three items,
like A6---A6---A6, are level three nodes. All level three nodes are here
shown with the letter A, level two nodes with B, etc.

The vertical order of the node is that of the keys, i.e., the nodes are
shown sorted by key. The number 6 in "A6" corresponds to key number 6.

There is potentially no limit to the number of levels. Practically, it
is limited by the implementors expectation of maximal number of nodes.
(If the list grows larger than expected the skip list will still work,
but perform gradually worse than it would with a higher number of
levels.)

The columns of the diagram represent linked lists. The rightmost linked
list links only the A nodes. The middle linked list links the A and the
B nodes. Nodes of level n are members of n distinct lists. The order of
the nodes in the lists is that of the keys.

By the way the levels are chosen, there will normally be just 1-3 nodes
in the rightmost list. This list could be compared to the root node of a
B-tree. The next lower level list has on average twice as many nodes.
(Actually, this is a design parameter.) This means that walking down the
second list, starting from an A node, there are on average 1 B-node
before the next A node. Since the assignment of levels is random there
is no upper limit, but more than three happens only once in 16 cases,
etc.

To locate a particular node, say C5, by key, you could scan the leftmost
list linearly, but that would be O(N). Instead you can start scanning
the rightmost list. When you reach A6 you notice that you are too far,
so you back up to A1. Then you continue down the middle list, etc. This
traversal is actually quite similar to B-tree traversal, where scanning
the B nodes between A1 and A6 corresponds to scanning a B-tree node
below the root, and scanning the Cs between two Bs corresponds to
scanning a B-tree node two levels below the root.

> >
> >Now here is the reason why SkipTrees do NOT need
> >variable sized nodes:
> >
> >The Pointer from A1 to A6 is used, so is the pointer
> >from A1 to B4 and from B4 to C5.
> >
> >However, the pointers from C2 and C3 to B4, B4 to A6,
> >and B9 to A12 are NEVER USED for example.  You are

Well, from C2 to C3 _is_ used, since there is no B node between them.

> >sacrificing
> >pointers to get to a binary tree, but the pointers you
> >lose
> >are the pointers you don't need anyway.
> >
> >In SkipList, you need those pointers only to copy
> >their value to
> >other pointers which will not be used.  The nodes
> >can't shrink,
> >because an insertion changes which pointers are used
> >and which
> >are not.
> >
> >If * is a wildcard, the rule is:
> >
> >No pointer from C* to B* or B* to A* is ever used.  If
> >you were
> >going to get to A6, you would have gotten there while
> >traversing
> >the "A" list, and if you are at the C list level, you
> >have already left 
> >the A and B lists behind.
> >
> >To convert a Skip List to a Skip Tree, note that every
> >decision
> >you need to make is based on a NODE->VALUE comparison.
> >After each decision, processing can go in two
> >directions, so there
> >are two "edges" from that decision.
> >
> >Decisions become binary tree nodes.  EDGES become left
> >and
> >right pointers.
> >
> >The first decision in following the skip list is "Is
> >the search
> >value greater than "1" (i.e. node A1's value is 1). 
> >Thus the
> >top node of the Skip Tree is A1.  If the value is less
> >than 1,
> >we look at C0.  Thus C0 is on the left hand side of
> >A1.
> >
> >Just traverse the skip list, and wherever you make a
> >decision
> >based on a value, there is a node.  Note that this
> >skip list is
> >not really balanced.  Due to the extra pointers, the
> >policy is
> >normally to have FEWER high-level nodes in a Skip List
> >than
> >would be predicted by the (1/2, 1/4, 1/8) progression
> >from the
> >bottom up.  Usually 3/4 on the bottom level, then 3/4
> >of the
> >remaining on the next level, etc.
> >
> >With a skip tree, we actually want the balanced
> >version, i.e.
> >ratios of 1/2 on each level, although other ratios can
> >be used.
> >
> >Kevin

Regards, Enrique

