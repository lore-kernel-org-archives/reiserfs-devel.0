From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Tue, 04 Jun 2002 05:28:50 +0200
Message-ID: <3CFC33F2.7080009@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny> 	<3CFC1CB5.8040102@mb.tu-ilmenau.de> <1023157228.31475.38.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10497-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/04/2002 04:20 AM, Chris Mason wrote:
> On Mon, 2002-06-03 at 21:49, Manuel Krause wrote:
> 
>>I really got rid of my "usual setup": the speedup-compound-patch(with 
>>iicache-15?), akpm and aa patches for this testing now (mostly due to 
>>all these many rejects I got that Dieter had promised already... and due 
>>to the fact I have no time to understand->adjust them all manually at 
>>the moment).
>>I can't believe it, really, but I even left the other settings alone... ;-)
> 
> 
> ;-)

   :-))

Makes some things and testings easier, I see, and some things faster??? 
;-) Mmh...

> 
> 
>>Now it is "only":
>>Kernel.2.4.19-pre9
>>ReiserFS.pending.01..03,05 (rest doesn't cooperate cleanly)
>>ReiserFS.mason.01..03 (maybe slightly modified for this)
>>rml.preempt-kernel (          -"-                 )
>>
>>/ mounted -o noatime,notail,data=logging
>>
>>Related to my previous state I once assumed to be lightning-fast I get 
>>-3secs (of former 17+1secs) load time of NS7 with all my plugins and 
>>-13+10secs (of former 27+10secs) load time of OOo.1.0 on a freshly 
>>booted machine. That is really nice!
>>
>>Now I'll see VMwares results/reliability...
>>;-)
>>
>>Very-very impressing, so far,
> 

So, VMware is stable with it, too, on my well known "heavy-private-test" 
of it (running Norton SpeedDisk at least twice within a most recent 
VMware Win98). It doesn't show greatly different timings than to my 
setup before though having a different disk i/o pattern (due to the 
missing aa patches)... and me having a reduced RAM from 512to256MB at 
the moment. And I should be honest to say I can't give exact timings as 
the important disk contents changed during last weeks. But the 
disk-access-times/related-to-the-content are definitively _not_ higher 
than before!

> 
> Great to hear, thanks for trying things out.
> 
> data=logging will be the slowest mode for everything except mail servers
> and write heavy databases (or other apps that hammer on O_SYNC/fsync). 
> This is because all the data gets written twice, once to log and once to
> the main disk.  It helps synchronous writes by writing to the log in
> quick sequential bursts, and then writing back to the main disk in
> larger chunks.

Yes, I assumed/learnt that from your very previous explanations. But I 
don't see the point "slowest", so far, on here.

This is a home/single session ?non?-production system on here. 1 to 2 
IDE disks, one processor... notebook, you'd remember this setup from my 
  mails.

> 
> data=ordered will usually be fastest for streaming appends to a file. 
> The rest of the time it will be the same or slightly slower than the
> default (data=writeback).

What would be my recommended mount option later then (mentionned in the 
manpages or on the webpage?!) Mmmh: I see I test that at the moment...

> 
> To answer your other question, you can only select one data mode at a
> time.

Why is no combo possible? Meant as: Could/would that bring advantages in 
future?!!

> 
> -chris
> 

Thanks,

Manuel


