From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Problem with the latest auto snapshot
Date: Tue, 15 Jun 2004 12:06:53 +0400
Message-ID: <20040615080653.GY8091@backtop.namesys.com>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <20040612194649.GF4990@nysv.org> <200406131537.54853.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406131537.54853.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: Markus T?rnqvist <mjt@nysv.org>, reiserfs-list@namesys.com

On Sun, Jun 13, 2004 at 03:37:54PM +0200, Henning Westerholt wrote:
> Am Samstag, 12. Juni 2004 21:46 schrieb Markus T?rnqvist:
> > I had something similar, with an old auto-snapshot, but I didn't get
> > those log messages. It also repeated on, 2004.06.09 under some mild load,
> > compiling .11-19.36 and doing a dist-upgrade. I'll dig out some traces
> > if it still repeats with this kernel, as they seem to have systematically
> > receeded.
> >
> > I wonder if we have something different concerning debug?
> > mjt@shrike:~$ zgrep -i reiser4 /proc/config.gz
> > [snip]
> 
> Hello Markus,
> 
> i'm using the same reiser4 config like you.
> 
> I just rebuild the partition, and start a small compile job. After them i 
> started a fsck. It reported a new fatal error about a broken node. I attached 
> the output from fsck. I could reproduce this error two times. 

new fsck 0.5.5 is available for testing
(http://www.namesys.com/snapshots/2004.06.14-internal.testing/), please try it.

Can you also enable CONFIG_REISER4_CHECK and CONFIG_REISER4_DEBUG?  It may help to
catch a bug faster.

-- 
Alex.
