From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Wed, 28 May 2003 09:44:35 -0700 (PDT)
Message-ID: <20030528164435.90359.qmail@web40012.mail.yahoo.com>
References: <1053999535.7962.172.camel@arabia.home.lan>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14283-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1053999535.7962.172.camel@arabia.home.lan>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Cc: reiserfs-list@namesys.com


Sounds great.  I thought that merging as you describe
might be possible but never figured out the details. 
(I haven't looked at
your code, I'll assume for now all works as
described).

Have you tested performance of merge-delete versus
simple
deletion?

Note that in my (simple delete with adjustments)
version you don't need to modify levels of the whole
tree, only the nodes on the path to the one you are
moving.  Asymptotically, this should keep the tree on
the correct average level.

If you don't adjust levels at all, I think the
performance cost would be small in practice.  But I
never actually implemented the delete in my version.

Kevin Bealer


--- Enrique Perez-Terron
<enrique.perez-terron@norway.online.no> wrote:
> 
> Hello,
> 
> Prompted by this discussion I wrote some code to
> make sense of the
> structures described, and they work wonderfully.
> 
> However, I found that in the split trees it is not
> necessary to
> manipulate the levels of the remaining nodes after a
> deletion. It is
> possible to reverse the effects of the split that
> occurs during
> insertion; it is quite easy.
> 
> The reversal procedure merges two non-overlapping
> trees, the left and
> right subtrees of the node that was removed. By
> non-overlapping I mean
> that the largest key in the tree with small keys is
> smaller than the
> smallest key in the other tree.
> 
> The procedure retains the desirable property of
> working downwards and
> not looking back, so two processes could lock and
> update different parts
> of the tree and propagate effects downwards,
> automatically avoiding
> deadlocks. The procedure also avoids having to
> traverse entire subtrees
> to update levels. It only touches nodes along the
> left edge of the right
> subtree, and along the right edge of the left
> subtree. This should be
> O(ln n).
> 
> The code can be found at
> http://home.online.no/~enrio/b3.c
> 
> Regards, Enrique
> 


__________________________________
Do you Yahoo!?
Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
http://calendar.yahoo.com
