From: "David Dabbs" <david@dabbs.net>
Subject: RE: Fibration questions
Date: Wed, 21 Jul 2004 00:44:27 -0500
Message-ID: <20040721054418.1150715C23@mail03.powweb.com>
References: <40FDFB81.3080701@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19716-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FDFB81.3080701@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Masover' <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com


> |>
> |>I must not understand fibration.  Do you have to know the fibration of
> |>an object to find it?
> |>
> |
> | Fibration is simply a means to physically group together filesystem
> objects
> =>> MEGA SNIP <<=
> 
> So, what you're trying to say is, yes, because it's part of the key?
> 

No, not really, at least you (as a filesystem client) don't specify the
fibration when searching for an object. Yes, when the key is generated, of
course the fibration bits matter, but they simply come from a blackbox
plugin function that simply operates on the name and which may differ per
directory. As Hans pointed out, there may be an opportunity to offer some
explicit support for * via the syscall interface -- as to whether or not the
implementation would even involve fibration is open for discussion.

It seems like we are violently agreeing, as my father sometimes says. I too
think it would be great to have an enhanced or more structured typing
system. And it would be interesting to work on at some point, but not just
yet, for me at least. There's still so much to learn about what's here.
Anyway, I've kind of lost track of what it is you were looking to accomplish
in the thread. 

Best,

David


