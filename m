From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] various allocator optimizations
Date: 13 Mar 2003 20:34:22 -0500
Message-ID: <1047605662.8215.1068.camel@tiny.suse.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
	 <1047499021.8219.604.camel@tiny.suse.com>  <3E6F9DE3.2070902@namesys.com>
	 <1047571151.8219.956.camel@tiny.suse.com>  <3E711F34.4060309@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E711F34.4060309@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Thu, 2003-03-13 at 19:15, Hans Reiser wrote:

> >
> >Ok, more testing showed that patch wasn't bad, but wasn't great either. 
> >Under a multiprocess test, the buffers in the path would get moved away
> >and there wasn't enough data to make a good decision.  So the patch
> >below changes things around a little, and records the span during
> >search_by_key instead of trying to compute it after the search is over.
> >
> Hunh?  Why don't you maintain a counter in the directory of the number 
> of nodes in it?  Or are you afraid of causing extra IO?
> 

That would mean the parent directory counter would have to be updated
every time we allocated a block in any sub directory.  Plus the counter
would have to be inherited down the chain in deep directory structures. 
More importantly, I'd rather not waste space in the stat data to store
the information when we can get it during a search ;-)

Basing the span on the tree allows us to detect a highly used locality
regardless of what kind of tree object was using it, and we can do it
with almost zero overhead.

> >In other words, I think this is a really good compromise between the
> >current defaults and a more optimal case for fragmentation, and I expect
> >its performance to hold up much better as the filesystem ages.
> >
> Let's get lots of different testers.  You may have a nice heuristic here 
> though....
> 

If everyone agrees the approach is worth trying, I'll make a patch that
enables it via a mount option.

> How big are your packing localities tending to be?

Not more than can be pointed to by the leaf level and the level directly
above it.  I know that's not very specific, but it varies by the
dataset.  packed tails and long directory names lead to more packing
localities per MB.

My 100MB subset of /usr/share/doc has 732 directories in it, and the
copy phase of stress.sh -n 10 -s for that directory tree will produce
1400 packing localities, so it depends on size of the tree in general.

-chris


