From: Russell Coker <bofh@coker.com.au>
Subject: Re: need for benchmarking system?
Date: Fri, 20 Dec 2002 08:37:43 +0100
Message-ID: <200212200837.43327.bofh@coker.com.au>
References: <9135.1040347243@www36.gmx.net>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9135.1040347243@www36.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: grobe@gmx.net, reiserfs-list@namesys.com

On Fri, 20 Dec 2002 02:20, grobe@gmx.net wrote:
> As we are going to get a quite big new server in january, and as I have
> taken a lot of advantage from the reiserfs development, I wonder if I could
> contribute a bit by making a "reiserfs-large-server-test-day"?

I'm not sure that 2TB is really a large server any more.  I know people with 
home machines of 1TB, and on the IDE-arrays list about half the regulars are 
pushing up against the 2TB block device limit in kernel 2.4 (and a 2TB limit 
in 3Ware hardware).

That said, my latest servers are at ~220G.  But that's due to not wanting any 
external storage and wanting a hot-spare, combined with the limit of 76G for 
a SCSI disk.

> The system will be a redundant fibrechannel storage with two dual processor
> systems, about 2 Terabytes raid5. I am going to install SuSE ES8 (I usually
> install on LVM).

I'll be interested to see the results of that.  Every time I've checked out 
the performance of FC devices in the past I've been very unimpressed by the 
results.  The best I've seen from FC is 60MB/s sustained for a single process 
(which isn't THAT much better than a single new IDE hard drive).

> If the reiserfs-team thinks this could be useful, please tell me the
> configuration you need (e.g. kernel 2.4.xx, 2.5.xx, reiserfs 3.xx or 4?)
> and how we should do this (benchmark scripts etc), I will try to get the
> specs of the system and see how to put this into the schedule.

I suggest benchmarking 2.4.x vs 2.5.x.  2.5.x has many changes that should 
improve performance.  Also see if you can show the benefits of the 
pre-emptable kernel support in recent 2.5.x.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

