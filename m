From: Whit Blauvelt <whit@transpect.com>
Subject: Re: Marking bad blocks
Date: Sun, 20 Jul 2003 10:23:13 -0400
Message-ID: <20030720142313.GA11319@free.transpect.com>
References: <20030720033004.GA6519@free.transpect.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030720033004.GA6519@free.transpect.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Thanks for the various responses. The drive in question is a few years old,
so its own bad-block handling capabilities may not be the latest. 

The suggestion to "dd into the blocks" is intriguing. Does anyone have an
example of how to do that based on the "badblock" output of block numbers?
dd's man and info pages are terse, and I've only ever used dd for writing
images to floppies.

As for the suggestion that there's a problem with my gcc since I can't
compile add-bad-blocks.c - well, this is trying it with gcc on two different
systems: the first being an originally Red Hat 6.0 system where gcc has been
upgraded and compiled from the GNU sources, the second on a very current
Gentoo system where the gcc has is compiled from the Gentoo sources - so
what are the odds that two different versions of gcc on two different
systems and flavors of Linux both have the same problem, and it's gcc's
fault?

As for whether it's wise to replace hard drives at the first sign of
trouble. Yeah, it is. But there are instances like today where it's Sunday,
I'm in a rural location far from anyplace selling hard drives, I don't have
an equivalent drive on hand (wouldn't it be wonderful if we could all always
have a total supply of backup parts for our systems?). The important thing
for software is to keep the system going, with messages to the system
operator about anything consequential. Allowing a failure of a bad block on
a hard drive to be a cause of system failure - when programming a file
system to gracefully handle bad blocks is old hat - isn't consistent with
the belt-and-suspenders philosophy that's the heart of good systems
administration. (Of course, not having a complete set of spare parts isn't
consistent either - but software features are cheaper to distribute than is
hardware).

It's encouraging that some sort of bad block handling is planned for the
next version of Reiser utilities.

Whit
