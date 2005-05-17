From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: file as a directory
Date: Tue, 17 May 2005 19:57:28 -0400 EDT
Message-ID: <173348006180-BeMail@cr593174-a>
References: <428A7568.6080509@slaphack.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <428A7568.6080509@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

David Masover wrote on Tue, 17 May 2005 17:51:20 -0500:
> How much of a price do I pay?  And could that price be avioded by only
> enabling those features for directories where I want them?  Could that
> be done easily in Reiser4?

Interesting point.  A lot of those features require that file system
objects know which directories they are in (or whatever their parent
objects actually are, just think of them as directories for now).
That means extra pointers in each object back to all the parents it
belongs to.

Your idea leads to the idea of having both singly linked file system
objects and doubly linked ones.  Then when deleting items, the singly
linked subtrees don't need to have the full traversal to check for
cycles.  I'd leave that as a later optimization, if needed.

> My mind isn't able to easily wrap itself around the point of having this
> strange new kind of hard-links, but I'm willing to try it if there's no
> performance hit for the rest of my system.

The file creation and deletion time will be slower.  But hopefully not
by much, and that's about all that's affected.  The plus side is that
with the extra classifications (photos filed in both "Cottage" and "Aunt"
directories) you'd be able to find your data more easily!

- Alex
