From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Tue, 04 Jun 2002 03:49:41 +0200
Message-ID: <3CFC1CB5.8040102@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/03/2002 05:51 AM, Chris Mason wrote:
> Hello everyone,
> 
> ftp.suse.com/pub/people/mason/data-logging
> 
> has beta code that gives you the following:
> 
> external logging devices
> data logging mount option (makes fsync and O_SYNC faster)
> ordered data mount option (no more garbage in your files after a crash)
> 
> optimizations to keep kupdate from triggering commits every 5 seconds
> optimizations for tiny transactions to reduce CPU usage and IO.
> optimizations for better locking and fewer calls to wakeup()
> 
> In short, it adds a bunch of features and makes everything faster.  The
> changes are very large, but they also build on older patches that have
> been circulating around for months.  It has been through a weekend of
> load testing here, but I still won't be surprised if people find
> corruption causing bugs.
> 
> It needs broad testing and benchmarking, in all the data modes, with a
> standard and external journal.
> 
> -chris
> 

I really got rid of my "usual setup": the speedup-compound-patch(with 
iicache-15?), akpm and aa patches for this testing now (mostly due to 
all these many rejects I got that Dieter had promised already... and due 
to the fact I have no time to understand->adjust them all manually at 
the moment).
I can't believe it, really, but I even left the other settings alone... ;-)

Now it is "only":
Kernel.2.4.19-pre9
ReiserFS.pending.01..03,05 (rest doesn't cooperate cleanly)
ReiserFS.mason.01..03 (maybe slightly modified for this)
rml.preempt-kernel (          -"-                 )

/ mounted -o noatime,notail,data=logging

Related to my previous state I once assumed to be lightning-fast I get 
-3secs (of former 17+1secs) load time of NS7 with all my plugins and 
-13+10secs (of former 27+10secs) load time of OOo.1.0 on a freshly 
booted machine. That is really nice!

Now I'll see VMwares results/reliability...
;-)

Very-very impressing, so far,

Manuel


