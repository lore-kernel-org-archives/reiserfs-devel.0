From: Andi Kleen <ak@suse.de>
Subject: Re: -mm -> 2.6.13 merge status
Date: Mon, 27 Jun 2005 09:28:32 +0200
Message-ID: <20050627072832.GA14251@wotan.suse.de>
References: <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com> <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com> <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de> <20050623114318.5ae13514.akpm@osdl.org> <20050623193247.GC6814@suse.de> <1119717967.9392.2.camel@localhost> <20050627072449.GF19550@suse.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24676-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050627072449.GF19550@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@suse.de>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, reiser@namesys.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

> > On Thu, 2005-06-23 at 21:32 +0200, Jens Axboe wrote:
> > > That said, I don't like the reiser name-number style. If you must do
> > > something like this, mark responsibility by using a named identifier
> > > covering the layer in question instead.
> > > 
> > >         assert("trace_hash-89", is_hashed(foo) != 0);
> > 
> > A human readable message would be nicer. For example, "foo was hashed".
> 
> Indeed.

You can just dump the expression (with #argument). That is what
traditional userspace assert did forever.

It won't help for BUG_ON(a || b || c || d || e) but these
are bad style anyways and should be avoided.

-Andi
