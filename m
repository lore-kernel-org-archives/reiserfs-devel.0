From: Oleg Drokin <green@namesys.com>
Subject: Re: kswapd CPU usage and heavy disk IO
Date: Thu, 9 Jan 2003 19:56:17 +0300
Message-ID: <20030109195617.A17148@namesys.com>
References: <200301091431.54451.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200301091431.54451.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>, Rik van Riel <riel@nl.linux.org>

Hello!

On Thu, Jan 09, 2003 at 02:31:54PM +0100, Russell Coker wrote:

> I have a server with 4G of RAM running ReiserFS for everything that matters.
> It has 2G of swap space free, but so far I have not seen swap usage go above 
> 1.6M (so in normal use I could turn off swap entirely and expect not to see 
> much difference).
> When it's under really heavy load (when I have a maintenance task involving a 
> "find /" and there are lots of POP/IMAP clients hitting the server as well as 
> mail delivery) and the load average gets to about 40, the "kswapd" kernel 
> thread starts using excessive CPU time.  It will stay on ~4% but have spikes 
> of up to 45%!!!  This is a two-processor machine so 45% CPU reported by top 
> means 90% of a single CPU I guess.  90% of a 1.8GHz P4 CPU is a lot of CPU 
> and I think that something is wrong.

Sounds exactly like yesterday/todays topic on lkml.
You have highmem box, during heavy IO all of the lowmempages are
occupied with bounce buffers and bh's.
Kernel needs more low memory and tries to free some with no much success though.
Known non-reiserfs related problem. Not easy to fix unfortunatelly.

Relevant lkml topic was "2.4.20, .text.lock.swap cpu usage? (ibm x440)"
Mail from Andrew Morton with msgid <3E1A16C5.87EDE35A@digeo.com>
He recommended to try http://www.kernel.org/pub/linux/kernel/people/andrea/kernels/v2.4/2.4.20aa1.bz2
"and send a report on the outcome"

Bye,
    Oleg
