From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 23:53:33 -0700
Message-ID: <432E606D.9020009@namesys.com>
References: <432AFB44.9060707@namesys.com> <200509181321.23211.vda@ilport.com.ua> <20050918102658.GB22210@infradead.org> <200509181406.25922.chrivers@iversen-net.dk>            <432E499B.7000003@namesys.com> <200509190556.j8J5utH0024042@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509190556.j8J5utH0024042@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Christoph Hellwig <hch@infradead.org>, Christian Iversen <chrivers@iversen-net.dk>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Valdis.Kletnieks@vt.edu wrote:

>
>
> Hans, unfortunately the most obvious reading of the above is
> "Reiser4 is so damned fast because it doesn't bother doing
> sanity-checking".

Hmm, you seem to have forgotten the Hellwig complaints about too many
assertions..... ;-)

Algorithms make a difference Valdis, they make a big difference.
> If there's still more "fixmes" to be inserted that *you* know of,
> and there are so many that there's no time to fix them, why is this
> being submitted for inclusion?

The fixmes are not bugs, those got fixed, they are "this code would be
cleaner if written another way", or, most commonly, "where is the
comment that ought to be here?"

> On Sun, 18 Sep 2005 22:09:08 PDT, Hans Reiser said:
>
>> Of course, the reiser4 code is not as stable as it was before the
>> changes Christoph asked for.
>
>
> This sort of claim requires proof - can you point at *specific*
> things that were less stable after you fixed the code, including
> explaining why they're less stable?

The 4k stacks got a bug report or two.   Generally speaking, I don't
trust any large number of lines of code of changes to be bug free, and
the VFS stuff was a large number of lines.

