From: Russell Coker <russell@coker.com.au>
Subject: kswapd CPU usage and heavy disk IO
Date: Thu, 9 Jan 2003 14:31:54 +0100
Message-ID: <200301091431.54451.russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>
Cc: Rik van Riel <riel@nl.linux.org>

I have a server with 4G of RAM running ReiserFS for everything that matters.

It has 2G of swap space free, but so far I have not seen swap usage go above 
1.6M (so in normal use I could turn off swap entirely and expect not to see 
much difference).

When it's under really heavy load (when I have a maintenance task involving a 
"find /" and there are lots of POP/IMAP clients hitting the server as well as 
mail delivery) and the load average gets to about 40, the "kswapd" kernel 
thread starts using excessive CPU time.  It will stay on ~4% but have spikes 
of up to 45%!!!  This is a two-processor machine so 45% CPU reported by top 
means 90% of a single CPU I guess.  90% of a 1.8GHz P4 CPU is a lot of CPU 
and I think that something is wrong.

In the meager documentation in the kernel source kswapd is described as being 
involved in paging to disk.  I don't think that this is what it is doing as 
there is no noticable paging activity (it generally has at least 600M of 
"buffers" so there is no real shortage of memory).

Would the activity of kswapd be involved with ReiserFS in any way?  What can I 
do to improve this situation?

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

