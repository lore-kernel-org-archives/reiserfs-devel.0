From: Oleg Drokin <green@namesys.com>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Sat, 15 Mar 2003 11:21:38 +0300
Message-ID: <20030315112138.B24872@namesys.com>
References: <200303141942.00679.phma@webjockey.net> <3E728FFB.90905@mb.tu-ilmenau.de> <200303142143.58096.phma@webjockey.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303142143.58096.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Fri, Mar 14, 2003 at 09:43:58PM -0500, Pierre Abbat wrote:
> > If you already did a --rebuild-tree with that _old_ (~2years!!!)
> > reiserfsck I pray you have a backup somewhere.
> If I couldn't cat a single file without the cat hanging, how could I make a 
> backup?

You could have made a copy of whole partition with dd.

> I have 3.6.4 on this laptop. I can modify the spell and recast it. Is it OK to 
> copy the binary to the other box (they're both AMD processors) and run it? 

We saw some reports about problems arising if glibc is notably different.
So you should either gave statically linked reiserfsck or run in on the system close
to one where reiserfsck was built.

Bye,
    Oleg
