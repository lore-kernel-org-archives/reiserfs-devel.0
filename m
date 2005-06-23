From: Jens Axboe <axboe@suse.de>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 21:32:49 +0200
Message-ID: <20050623193247.GC6814@suse.de>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel> <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com> <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com> <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de> <20050623114318.5ae13514.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24508-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050623114318.5ae13514.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, reiser@namesys.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, penberg@cs.helsinki.fi

On Thu, Jun 23 2005, Andrew Morton wrote:
> Jeff Mahoney <jeffm@suse.de> wrote:
> >
> > >>+	assert("nikita-955", pool != NULL);
> >  > 
> >  > These assertion codes are meaningless to the rest of us so please drop
> >  > them.
> > 
> >  As someone who spends time debugging reiser3 issues, I've grown
> >  accustomed to the named assertions. They make discussing a particular
> >  assertion much more natural in conversation than file:line.
> 
> __FUNCTION__?

Doesn't help a lot. I've also been annoyed several times in the past
when having to lookup a BUG() for a kernel source I don't exactly have
at hand right then and there. If you have constructs ala

function()
{
        if (cond_a)
                BUG();
        if (cond_b)
                BUG();
        if (cond_c)
                BUG();

        do_stuff...
}

then it's impossible to know which one it is without the identical
source at hand.

That said, I don't like the reiser name-number style. If you must do
something like this, mark responsibility by using a named identifier
covering the layer in question instead.

        assert("trace_hash-89", is_hashed(foo) != 0);

or whatever.

-- 
Jens Axboe

