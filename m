From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 03 Jun 2002 22:20:28 -0400
Message-ID: <1023157228.31475.38.camel@tiny>
References: <1023076301.22608.1778.camel@tiny> 
	<3CFC1CB5.8040102@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CFC1CB5.8040102@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Mon, 2002-06-03 at 21:49, Manuel Krause wrote:
> 
> I really got rid of my "usual setup": the speedup-compound-patch(with 
> iicache-15?), akpm and aa patches for this testing now (mostly due to 
> all these many rejects I got that Dieter had promised already... and due 
> to the fact I have no time to understand->adjust them all manually at 
> the moment).
> I can't believe it, really, but I even left the other settings alone... ;-)

;-)

> 
> Now it is "only":
> Kernel.2.4.19-pre9
> ReiserFS.pending.01..03,05 (rest doesn't cooperate cleanly)
> ReiserFS.mason.01..03 (maybe slightly modified for this)
> rml.preempt-kernel (          -"-                 )
> 
> / mounted -o noatime,notail,data=logging
> 
> Related to my previous state I once assumed to be lightning-fast I get 
> -3secs (of former 17+1secs) load time of NS7 with all my plugins and 
> -13+10secs (of former 27+10secs) load time of OOo.1.0 on a freshly 
> booted machine. That is really nice!
> 
> Now I'll see VMwares results/reliability...
> ;-)
> 
> Very-very impressing, so far,

Great to hear, thanks for trying things out.

data=logging will be the slowest mode for everything except mail servers
and write heavy databases (or other apps that hammer on O_SYNC/fsync). 
This is because all the data gets written twice, once to log and once to
the main disk.  It helps synchronous writes by writing to the log in
quick sequential bursts, and then writing back to the main disk in
larger chunks.

data=ordered will usually be fastest for streaming appends to a file. 
The rest of the time it will be the same or slightly slower than the
default (data=writeback).

To answer your other question, you can only select one data mode at a
time.

-chris


