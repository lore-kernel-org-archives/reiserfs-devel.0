From: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Subject: Split trees and locking during insertions
Date: 09 Jun 2003 18:09:39 +0200
Message-ID: <1055174978.20597.321.camel@arabia.home.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14503-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kevinbealer@yahoo.com
Cc: reiserfs-list@namesys.com

A question from Hans Reiser made me think of some advantages that could
be obtained for skip lists, skip trees and split trees by making the
level a predictable function of the key. 

One could for instance seed the random number generator with a hash of
the key just before generating the next level number. Then the level
should still have the same distribution and randomness, yet if two
processes simultaneously try to insert the same key they compute the
same level for the key.  Those versed in number theory might know of far
more efficient computations than this, but this shows that at least one
method exists.

Without such seeding we have the following:

During insertion, if duplicated keys are to be avoided, the algorithm
first finds the position P in the tree where the new node will be
placed, then searches the tree below P to see if there is already
another node with the same key.

It would be an error to lock P only after the nodes below have been
inspected and the decision to insert below P has been taken. While the
algorithm descends the subtrees below P another process could insert a
node with the same key anywhere above the node we are currently
inspecting. So, we have to write lock the node above the assigned level
of the new node, and keep the node locked while we descend the levels to
see if the key is already present. 

If we keep P locked, a competing process cannot insert a new node with
the same key above P, (say at P') because it too has to look below P' to
see if there is already a node with that key, and then it will have to
wait on P to be released, and it will find the key we are inserting.

With seeding, when we find the location where we want to insert the new
node, we need not look any further to make the decision. We can begin
the insertion right away. The algorithm does no longer need to be
two-pass or one-and-a-half-pass. 

Once the decision to do the insertion is made, the procedure is the same
with or without seeding. The node above the new node can be released as
soon as the new node is inserted into the tree and write locked. The
lock on the new node can be released when both child pointers have been
assigned its final value and the nodes having the left and right
receiver pointer have been write locked. When a right receiver pointer
is assigned to, the new right receiver pointer is found and its owner
node is write locked before the lock on the old right receiver pointer
owner is released.

If the level function is sufficiently cheap, also lookups might benefit
slightly, by first computing the level of the key we are looking for and
then deciding the node is not there if it is not at that level.

This would save one comparison half the times, plus two comparisons a
quarter of the time, etc.  But most comparisons are cheap when the keys
are different.

Regards, Enrique

