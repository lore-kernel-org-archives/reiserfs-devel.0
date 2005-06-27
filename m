From: "Pekka J Enberg" <penberg@cs.helsinki.fi>
Subject: Re: verbose BUG_ON reporting
Date: Mon, 27 Jun 2005 15:45:12 +0300
Message-ID: <courier.42BFF4D8.000010AF@courier.cs.helsinki.fi>
References: <84144f0205062223226d560e41@mail.gmail.com>
            <42BB0151.3030904@suse.de>
            <20050623114318.5ae13514.akpm@osdl.org>
            <20050623193247.GC6814@suse.de>
            <1119717967.9392.2.camel@localhost>
            <20050627072449.GF19550@suse.de>
            <20050627072832.GA14251@wotan.suse.de>
            <Pine.LNX.4.58.0506271048310.26869@sbz-30.cs.Helsinki.FI>
            <20050627082046.GC14251@wotan.suse.de>
            <Pine.LNX.4.58.0506271525240.3200@sbz-30.cs.Helsinki.FI>
            <20050627123821.GE14251@wotan.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24696-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050627123821.GE14251@wotan.suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Pekka J Enberg <penberg@cs.Helsinki.FI>, Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, reiser@namesys.com, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, joern@wohnheim.fh-wedel.de

Andi Kleen writes:
> It's still useless - it is too bloated to turn on by default
> and then if you need it you still won't have it.  And when you
> explicitely turn it on then you likely don't need it because
> you control the source.

Hmm. Would a BUG_ON_WITH_TEXT be a better solution? The home-grown assert 
macro in reiser4 can't be a long-term solution if people really want this 
kind of functionality. Btw, the bloat argument applies to assertion codes 
too. 

                   Pekka 
