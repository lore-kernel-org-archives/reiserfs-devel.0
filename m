From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: Manual example of operation of Split Trees
Date: Wed, 7 May 2003 23:27:34 -0700 (PDT)
Message-ID: <20030508062734.21856.qmail@web40014.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, jmacd <jmacd@cs.berkeley.edu>
Cc: kevinbealer@yahoo.com


I should mention that proportion of nodes at
each level can be tuned slightly depending on
how important lopsidedness is versus how much
balancing should happen.  1/2 at level 0, 1/4
at level 1, 1/4 at level 2, etc. is called at
'branch factor' of 2.  This is the lowest
useful branch factor;  higher values decrease
the amount of balancing that happens, but
increase the potential for lopsidedness.  If
you think you inputs are very randomly ordered,
use a higher branch factor.  Branch = 2 works
very well though.

Here is a 'manual' example of how Split trees
work.  This is the 'ideal' example, where the
randomized numbers save the day.  Half the
nodes are level 0, half the rest are level 1,
etc.  Also the best possibly choice was made
as to which nodes were which levels.  The
randomization won't do as neat a job, etc, but
in large set tests (as described before), the
algorithm seems to run fast as a bat.


Insertion values in order (value:level):
1:0 3:0 5:0 7:0 2:1 6:1 4:2


First, inserting the level 0 nodes is like a
simple binary tree, so I'll do that 'off-stage':

    top-> (1:0)
              \
              (3:0)
                  \
                  (5:0)
                      \
                      (7:0)

Then, the level 1 nodes.

First (2:1). We insert it above the (1:0) node.
We have to split the (1:0) node.  Here I will
use LR to denote 'left receiver' and 'RR' to
denote Right Receiver.  [] is used to mark the
node which is going to be split (assigned to
either LR or RR, depending on value; though
often it is already attached to one of these.)

    top-> (2:1)
         LR   RR

          [1:0]
              \
              (3:0)
                  \
                  (5:0)
                      \
                      (7:0)


First, we attach it to the left receiver.  The
new left receiver will be the [1:0]->right.  The
(3:0) node is the disputed node now.


    top-> (2:1)
          /    RR
      (1:0)
         LR
          \
          (3:0)
              \
              (5:0)
                  \
                  (7:0)


It has to switch sides.  First, we attach it to
the left receiver.  The new left receiver will
be the [1:0]->right.

    top-> (2:1)
          /    \
      [1:0]    (3:0)
         LR   RR   \
                   (5:0)
                       \
                       (7:0)

The new right-receiver would be (3:0)->left; But
this is empty, so we set LR and RR to NULL and
we are done.


Next, insert (6:1).  It is greater than 2:1, so
insert into right hand subtree of 2:1;  But that
has a lower level, so we can't traverse down, and
have to split again:


    top-> (2:1)
          /    \
      (1:0)    (6:1)
              LR   RR

               [3:0]
                   \
                   (5:0)
                       \
                       (7:0)

Three attaches to the left as before.

    top-> (2:1)
          /    \
      (1:0)    (6:1)
               /   RR
           (3:0)
              LR
               \
               [5:0]
                   \
                   (7:0)

Now (5:0) is disputed.  It stays where it is,
so [7:0] is disputed next.

    top-> (2:1)
          /   \
      (1:0)   (6:1)
              /   RR
          (3:0)
              \
              (5:0)
                 LR
                  \
                  [7:0]

7 is greater than 6, so (7:0) jumps
to the RR point.

    top-->(2:1)
          /   \
      (1:0)   (6:1)
              /    \
         (3:0)      (7:0)
             \      LR
             (5:0)
                RR

The (7:0)->left would be disputed but there is
none.


Finally to insert the (4:2). Rather than spell
it out, I will just show the pointers (edges)
which need to change and the final result.
Edges which change are marked with *.


    top**>(2:1)
          /   *
      (1:0)   (6:1)
              *    \
          (3:0)      (7:0)
              *
              (5:0)

Note how this neatly cuts along the line where
(4) would be inserted in the simple-binary-tree
algorithm.

After the above tree is split on the value 4, we
get the final version:

     top-->(4:2)
          /     \
     (2:1)       (6:1)
    /    \       /    \
 (1:0)  (3:0) (5:0)  (7:0)


Note how pretty it is; Also note that ANY
INSERTION ORDER would have produced this tree,
so long as the levels are chosen this way.

Of course, real node values will cause randomly
heaped up trees with poor (but exponentially
rare) worst case performance and good amortized
average performance.


I invented this based on Skip Lists.  After I
had a running copy, I did some web searches to
determine if anyone had done this before.  There
is an algorithm called the 'treap' which is
similar.  The invariants are the same, but the
random numbers in a treap are simple
uniform-distribution random numbers, and the
balancing is done in a 'rotation' method like an
AVL or Red/Black tree.

The treap's uniform random number distribution
would require enough bits to express N, whereas
mine requires only enough bits to express ln(n).

In other words, for 2^32 items, they need a
"level" number from 0 to 2^32-1, or the tree
will start to become linked-list-like in
performance.  Mine only needs a number from 0 to
31.  This saves a few bytes, probably not too
important.

I like my rotation better; their rotation method
looks like it would be impossible to synchronize
(i.e. with mutexes) unless you want to lock the
whole tree with one mutex, because it iterates
down then up.  All of my tree operations run
straight down through the structure and dont
look back.  Locking order is always the same,
which means automatic deadlock avoidance
assuming one lock per node.

Mostly I like my algorithm because I thought it
up; it is possible that both algorithms are
exactly mathematically equivalent.  They have
the same invariants and node structure after
all.


I should also mention that I thought of a
simpler way to think of a Skip Tree:

A Skip Tree is either empty, or a binary
tree of nodes of the same level (the highest
level nodes) with Skip Trees of lesser
levels attached as some of the leaf nodes.

Each node is chosen to live at a random distance
from the top of the whole SkipTree, so that no
sub-tree gets too lopsided.

Kevin Bealer



__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
