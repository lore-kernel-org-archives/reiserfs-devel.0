From: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: 27 May 2003 03:38:56 +0200
Message-ID: <1053999535.7962.172.camel@arabia.home.lan>
References: <20030508042237.35435.qmail@web40007.mail.yahoo.com>
	 <3ECCED08.2050709@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3ECCED08.2050709@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: kevinbealer@yahoo.com


Hello,

Prompted by this discussion I wrote some code to make sense of the
structures described, and they work wonderfully.

However, I found that in the split trees it is not necessary to
manipulate the levels of the remaining nodes after a deletion. It is
possible to reverse the effects of the split that occurs during
insertion; it is quite easy.

The reversal procedure merges two non-overlapping trees, the left and
right subtrees of the node that was removed. By non-overlapping I mean
that the largest key in the tree with small keys is smaller than the
smallest key in the other tree.

The procedure retains the desirable property of working downwards and
not looking back, so two processes could lock and update different parts
of the tree and propagate effects downwards, automatically avoiding
deadlocks. The procedure also avoids having to traverse entire subtrees
to update levels. It only touches nodes along the left edge of the right
subtree, and along the right edge of the left subtree. This should be
O(ln n).

The code can be found at http://home.online.no/~enrio/b3.c

Regards, Enrique

