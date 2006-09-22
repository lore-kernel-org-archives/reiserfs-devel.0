From: David Masover <ninja@slaphack.com>
Subject: BitTorrent+Reiser4: curiouser and curiouser
Date: Fri, 22 Sep 2006 01:28:10 -0500
Message-ID: <4513827A.50809@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Azureus had a problem.  Once it got up to a good clip downloading, it 
would thrash the disk.  It would thrash the disk, and the system, so 
hard that even web browsing was difficult, due to disk access being 
many, many times slower than Internet access, even an Internet which is 
being hogged by BitTorrent.

After changing Azureus' cache to 32 megs, and telling it not to write 
files immediately, I thought I had the problem solved -- no thrashing at 
all.  Until the cache got full.  Then:  Thrashing.  Less freqent, but 
much more vigorous -- Azureus becomes extremely unresponsive for a few 
minutes.

It shouldn't be touching the disk AT ALL when there's over a gig of FREE 
RAM (as in, neither buffer nor cache nor actually used yet), and the 
file I'm attempting to download is less than 200 megs.  I tried an 
strace, but as I am not at all skilled in the ways of debugging or 
reverse engineering, I got syscall spam -- a 200 meg log file, and when 
I finally found a decent way to analyze it, I found most of Azureus' 
system call wall time is spent in futex().  Huh?

Looked up "futex" on Wikipedia, and I still have no clue how this makes 
any sense.  Either futex was somehow thrashing the disk, or Azureus has 
somehow managed to fork completely out of strace's control.  Or maybe 
it's somehow something that the kernel is doing on its own, which is 
somehow forcing azureus to block, but somehow not tripping strace's 
timers while doing so.

This problem did not always happen with my Reiser4, but unfortunately, I 
can't pin down exactly when it started doing this.  It might have been a 
kernel upgrade, a Reiser4 upgrade, or an Azureus upgrade.

Here's the catch, though -- when I finally tried another client 
(BitTornado, on the same file), I have had absolutely no thrashing yet. 
  It's hardly touched the disk.  I was thinking maybe Azureus synced 
somehow, and BT didn't, but running "sync" on the commandline took about 
2 seconds.  Which means that, with BitTornado, everything works exactly 
the way it's supposed to.

So I'm happy it works, but I'm still curious why Azureus thrashed so 
much, and BitTornado doesn't thrash at all.  Maybe it's the apps?  Or 
Python vs Java?  Or maybe it's something like Evolution and column 
resizing -- something so embarrassingly, retardedly inefficient as 
flushing the column width information to disk every couple of pixels, 
that went unnoticed for so long because fsync performs well enough on 
other filesystems.

That's what it seems like to me, but one thing's sure -- it is neither 
fsync nor fdatasync.  I've disabled those at the kernel level.  I've 
still got no clue as to what it is, but I'll be glad to be rid of 
Azureus just as soon as I can actually find the features I like from it 
in other BitTorrent clients.
