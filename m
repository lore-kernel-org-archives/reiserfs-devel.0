From: Walter Landry <wlandry@ucsd.edu>
Subject: Re: reiser4 non-free?
Date: Mon, 10 May 2004 21:49:15 -0400 (EDT)
Message-ID: <20040510.214915.74754947.wlandry@ucsd.edu>
References: <1084188152.26226.196158678@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18592-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084188152.26226.196158678@webmail.messagingengine.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: humberto.massa@almg.gov.br
Cc: debian-legal@lists.debian.org, reiser@namesys.com, reiserfs-list@namesys.com, ed@debian.org, cavok@debian.org

This just caught my eye

"Humberto Massa" <humberto.massa@almg.gov.br> wrote:
> 2 (a) Now, we should think: does Debian /need/ to aggresively rebrand,
> removing the credits -- which Mr. Reiser state are part of his revenue
> generation? Take in consideration the excellent work namesys has been
> doing before answering.

The question is rarely what Debian needs to do, but rather what Debian
promises that the users will be able to do.  Suppose that someone
wanted to use Reiser4 on a miniature burnable CD for elections.  The
mini-CD holds the person's vote, but it has to be initialized before
it can be used.

So whenever the poll worker initializes the mini-CD, they have to
mentally remove the credits before they can parse the results of the
filesystem initialization.  Poll workers are more likely to make
mistakes if they have to do this, so the only sensible thing to do is
to remove the credits.  The credits can still be in the documentation,
but if the license doesn't allow you to remove the credits, then it is
not DFSG-free.

Regards,
Walter Landry
wlandry@ucsd.edu
