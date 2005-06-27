From: Andi Kleen <ak@suse.de>
Subject: Re: -mm -> 2.6.13 merge status
Date: Mon, 27 Jun 2005 10:20:46 +0200
Message-ID: <20050627082046.GC14251@wotan.suse.de>
References: <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com> <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de> <20050623114318.5ae13514.akpm@osdl.org> <20050623193247.GC6814@suse.de> <1119717967.9392.2.camel@localhost> <20050627072449.GF19550@suse.de> <20050627072832.GA14251@wotan.suse.de> <Pine.LNX.4.58.0506271048310.26869@sbz-30.cs.Helsinki.FI>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0506271048310.26869@sbz-30.cs.Helsinki.FI>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka J Enberg <penberg@cs.Helsinki.FI>
Cc: Andi Kleen <ak@suse.de>, Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, reiser@namesys.com, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, Jun 27, 2005 at 10:49:19AM +0300, Pekka J Enberg wrote:
> On Mon, 2005-06-27 at 09:28 +0200, Andi Kleen wrote:
> > You can just dump the expression (with #argument). That is what
> > traditional userspace assert did forever.
> > 
> > It won't help for BUG_ON(a || b || c || d || e) but these
> > are bad style anyways and should be avoided.
> 
> Sounds good to me. Jens, would this work for you?

It won't work for me because it'll bloat the kernel .text
considerable. There is a reason why BUG is implemented
like it is. Compare it.

-Andi

