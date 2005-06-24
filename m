From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 18:02:59 -0700
Message-ID: <42BB5BC3.7000902@namesys.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB31E9.50805@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24524-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB31E9.50805@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

David Masover wrote:

>
>
> But, there are some things Reiser does better and faster than ext3, even
> if you don't count file-as-directory and other toys.  There's nothing
> ext3 does better than Reiser, unless you count the compatibility with
> random bootloaders and low-level tools.

In fairness, there are some things that I am aware of.  In Reiser4 fsync
performance needs optimizing, truly random modifications and anything
else that write twice logging is best for needs optimizing, workloads
dominated by dirtying more mmap'd pages than can fit into RAM need
optimizing.

>
> >>                                               Not everyone will want
> >>to reformat at once, but as the reiser4 code matures and proves itself
> >>(even more than it already has),
>
>
> >I for one have seen mainly people with wild claims that it will make
> their
> >machines much faster, and coming back later asking how they can recover
> >their thrashed partitions...
>
>
> You know how many I've had thrashed on Reiser4?  Two.  The first one was
> with a VERY early alpha/beta, and the second one was when I dropped a
> laptop and the disk failed.
>
> And it does make certain things faster.  For one thing, "emerge sync" on
> Gentoo is twice to four times as fast, and /usr/portage is 75% as big,
> as on ReiserFS (3).

Wow.  You know, Nikita complains about my benchmarks, but what I usually
hear from users is that their performance when they use their favorite
app is mostly similar to my benchmarks.

I would be really happy if our compression code was working before we
went in.  Half the space and thus twice the speed to disk.  Edward could
use some help with it.  If only we could work on that plus fsync plus
mmap dirtying plus random modification optimized journaling rather than
these flamefests. 

Hans
