From: Hans Reiser <reiser@namesys.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Thu, 22 May 2003 19:30:16 +0400
Message-ID: <3ECCED08.2050709@namesys.com>
References: <20030508042237.35435.qmail@web40007.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030508042237.35435.qmail@web40007.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kevin Bealer <kevinbealer@yahoo.com>
Cc: reiserfs-list@namesys.com, jmacd <jmacd@cs.berkeley.edu>

Forgive me for asking some bonehead questions.....

Are skip lists height balanced?  (All paths to the leaves are equal?)

Kevin Bealer wrote:

>Here is how 'Split Trees' work.
>
>Each node has four components; Left, Right,
>Value, and Level.  Every operation is the same
>as a 'simple' binary tree except insert and
>delete.
>
>Need to preserve two invariants:
>  1. Basic binary tree ordering invariant.
>  2. No node's level is higher than its parent's.
>
>Insert:
>
>Basically, you select a 'level' for each node,
>the same way you would in a skip list, i.e. half
>the nodes are level 0, half the remaining are
>level 1; 2^32 nodes implies 32 different levels.
>
How do you determine which level a node is?

>No 'maximum level' has to be chosen initially.
>
>If the node level is zero, insertion is exactly
>the same as a 'simple' binary tree - traverse to
>the bottom of the tree and attach to one side of
>a bottom level leaf node.
>
>Insertions of other nodes are more complex,
>because that is where balancing is done.
>
>Given a new node with value V and level N,
>traverse down the tree until you get to a node
>whose level is LESS than N.
>
>To preserve the invariant, insert the new node
>ABOVE the node which is of a lower level.
>
Interesting.  Also, this suggests that skip lists are not height 
balanced.....?

What is the average fan-out?  Is all data in leaves and are all pointers 
in internal nodes?

>
>(If you look at only the subset of nodes of the
>same or higher level as the new node, they form
>a normal binary tree, rooted at the "top" node.
>We are inserting a new leaf a the bottom of this
>'subset' tree.)
>
>
>Now we have the problem: what to do with the
>node which we are inserting ABOVE.  We split it
>into two halves - nodes which are less than (or
>equal to) the new node in value, and nodes which
>are higher in value.  This preserves the order
>of the tree of course.
>
>Suprisingly, splitting a binary tree is very
>easy and can be done in O(ln n) time.
>
Why does splitting of a tree not a node occur?

>
>The split algorithm is conceptually simple.
>There are two sides of the subtree which is
>being split, the left half, and the right half,
>with a jagged line down the middle.  This jagged
>line will follow the pointers (edges) which we
>would follow if we were to insert the new node
>at the actual bottom-level leaf.
>
>Now I introduce several terms: the left-receiver
>and the right-receiver.  The left receiver is
>where we attach nodes with values less than or
>equal to V and the right is where we attach
>nodes with values greater than V.  OLDTREE is
>the tree we are splitting (it was attached where
>newnode is now attached).  The 'disputed area'
>is the subtree which contains nodes that may
>belong in the left or right reciever.
>
>
>At first, the left receiver is the Left side of
>the NEWNODE, the right receiver is the RIGHT
>side.  We attach the OLDTREE to whichever side
>it belongs to (based on its value).
>
>If OLDTREE->value is less than V, attach OLDTREE
>to NEWNODE->left.  Then we need to split the new
>'disputed area', which is OLDTREE->right, over
>the new left and right receivers.  The right
>receiver is still the same, but now the left
>receiver is OLDTREE->right.
>
>If the OLDTREE->value is greater than V, we do
>the symmetric operation (switch R & L in the
>paragraph above).
>
>When you reach a NULL value for OLDTREE, you are
>done - the division is complete.
>
>There is a tiny wrinkle -- At first the left
>receiver is the "left" pointer of NEWNODE, but
>once a left-attachment is made, it is always a
>"right" pointer, and vice versa.  Therefore,
>there are four almost-identical "Split"
>functions.
>SplitLR() - calls down to SplitRR if it makes a
>    Left attachment, otherwise calls SplitLL.
>
>SplitRR() - recurses to SplitRR if it makes a
>    Left attachment, otherwise calls SplitRL.
>
>SplitLL() - calls SplitRL if it makes a Right
>    attachment, otherwise recurses to SplitRL.
>
>SplitRL() - always recurses to itself, because
>    an attachment had been made to both sides
>    of NEWNODE.
>
>Actually, in the code the recursion has mostly
>been removed because it was so easy to do.
>
>
>Delete:
>
>I haven't written the code for this yet, but
>it should be trivial.
>
>Deletion is basically the same as with a
>'simple' binary tree.  Basically, replace the
>node with the highest-valued node not higher
>than V; or with the lowest-valued node not lower
>than V.
>
>The only trick is that you need to promote the
>moved node to whatever level the deleted node
>was, by assigning the deleted node's level to
>its 'level' variable.
>
>After a lot of deletion, the tree could become
>biased with a lot of high level nodes.  This
>is easy to prevent - when traversing the tree
>during deletion, if you see a leaf node, lower
>its level to zero (which is always a legal thing
>to do).
>
>For non-leaf nodes, demote them by one level if
>they are 2 or more levels above both children.
>This will 'comb out' the inequality, in an
>amortized way.
>
>I'll follow up with the code and an example
>in two more emails.
>
>
>Kevin
>
>
>
>__________________________________
>Do you Yahoo!?
>The New Yahoo! Search - Faster. Easier. Bingo.
>http://search.yahoo.com
>
>
>  
>


-- 
Hans


