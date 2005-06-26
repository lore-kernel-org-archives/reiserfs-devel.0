From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Sat, 25 Jun 2005 21:32:15 -0700
Message-ID: <42BE2FCF.9010705@namesys.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl> <42BCD93B.7030608@slaphack.com> <200506251420.j5PEKce4006891@turing-police.cc.vt.edu>            <42BDA377.6070303@slaphack.com> <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu> <42BE1D9A.80006@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BE1D9A.80006@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Valdis.Kletnieks@vt.edu, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Think of reiser4 as being designed to be 90% library routines, and 10%
program.  Now, can these libraries be used by other filesystems?  Why
yes, some can.  How many of them should be used by other filesystems? 

Reality:  few people are going to rewrite their existing filesytems to
mostly use our code.  However, people writing new filesystems, if we
have done our job right, will decide that our code is the easiest code
base to use for implementing whatever differentiates them while avoiding
reinventing what they don't seek to be better at.  Detail: Regarding our
allocation and balance and compress and encrypt at flush time code,
unless your filesystem is also based on balanced trees it might be the
least reusable code in the filesystem.  It is the hardest code in the
filesystem, because the algorithms we implemented were simply hard. 
Number one task for me, after we go in and I can stop dealing with
prerequisites to inclusion, is to review the vm interaction from
beginning to end one more time (and kill the emergency flush code).

Good part: if you want to implement new filesystem semantics, our
storage layer is more suitable for your innovating on top of than any
other.  Less work to code it, more functionality and flexibility,
plugins are great for hacking on top of.  The storage layer is very very
high performance, and if semantics are your focus, using our storage
layer is likely to be a good choice because it is well abstracted and
works without understanding what it works on.  For example, you can
invent new items for the tree to balance (e.g. new directory entry
formats), and all you have to do is write an item handler for the item
and you don't have to touch the balancing code.

In general, if a new filesystem can do some narrow aspect better than
our existing library routine, it should do its aspect using its
innovative new code, and where it is not trying to be better than us, it
can reuse our code more easily than any alternative.   Many people who
would write a new filesystem from scratch, can, if they use our code
base, accomplish their objectives with just writing some new plugins and
contributing them to the collection.  Others can define a new filesystem
to consist of a particular configuration of plugins and glue that are
what you get when you mount fubarfs.  We would be happy to accomodate
that by creating subdirectories for different flavorings of reiser4 to
live in.

Because our code is 90% library routines (aka plugins), eliminating the
plugin layer is like eliminating main() in a user space program.

Hans

David Masover wrote:

> Actually, I'll have to go back on this a bit.  There are different kinds
> of plugins, and I'm not sure exactly which people want in the VFS.  This
> may be because nobody's said that, though.
>
> Still, while plugins may not depend on Reiser, Reiser depends on plugins.
>
>
