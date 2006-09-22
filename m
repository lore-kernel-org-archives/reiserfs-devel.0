From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: BitTorrent+Reiser4: curiouser and curiouser
Date: Fri, 22 Sep 2006 12:45:47 +0400
Message-ID: <200609221245.47857.zam@namesys.com>
References: <4513827A.50809@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4513827A.50809@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: David Masover <ninja@slaphack.com>

Hi,

On 22 September 2006 10:28, David Masover wrote:
> Azureus had a problem.  Once it got up to a good clip downloading, it
> would thrash the disk.  It would thrash the disk, and the system, so
> hard that even web browsing was difficult, due to disk access being
> many, many times slower than Internet access, even an Internet which
> is being hogged by BitTorrent.
>
> After changing Azureus' cache to 32 megs, and telling it not to write
> files immediately, I thought I had the problem solved -- no thrashing
> at all.  Until the cache got full.  Then:  Thrashing.  Less freqent,
> but much more vigorous -- Azureus becomes extremely unresponsive for
> a few minutes.
>
> It shouldn't be touching the disk AT ALL when there's over a gig of
> FREE RAM (as in, neither buffer nor cache nor actually used yet), and
> the file I'm attempting to download is less than 200 megs.  I tried
> an strace, but as I am not at all skilled in the ways of debugging or
> reverse engineering, I got syscall spam -- a 200 meg log file, and
> when I finally found a decent way to analyze it, I found most of
> Azureus' system call wall time is spent in futex().  Huh?

I guess futex (, FUTEX_WAIT, ) calls can be ignored in this analysis. 
They just wait another threat to call futex(, FUTEX_WAKE, ).  
Interesting to find that thread and look what it was doing before 
FUTEX_WAKE? Or FUTEX_WAIT returns ETIMEDOUT?

> Looked up "futex" on Wikipedia, and I still have no clue how this
> makes any sense.  Either futex was somehow thrashing the disk, or
> Azureus has somehow managed to fork completely out of strace's
> control.  Or maybe it's somehow something that the kernel is doing on
> its own, which is somehow forcing azureus to block, but somehow not
> tripping strace's timers while doing so.
>

[ ... ]

-- 
Alex.

