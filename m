From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 00:47:18 +0300
Message-ID: <3E496F66.9050603@namesys.com>
References: <3E494808.413781E@interface-ag.com> <3E495CC6.8020202@namesys.com> <20030211144144.A5A9.MIKE@mystica.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030211144144.A5A9.MIKE@mystica.cx>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Hodson <mike@mystica.cx>
Cc: reiserfs-list@namesys.com

Mike Hodson wrote:

>
>In my years of running ext2 and ext3, I can't see any reason why you
>would think they require fscks at every reboot. 
>

Sorry, my experience with kernel hacking (I used ext2 for a long time 
while debugging reiserfs)  led me to forget that it is possible to 
reboot for reasons other than that the kernel oopsed on my latest 
changes to it.;-)

Now that we can user reiser3 while debugging reiser4, oopses are much 
less painful.

I regret that you had a bad experience with reiserfs.  I have never seen 
reiserfs convert a partition to nothing but nulls.  Are you sure that 
you were not repartitioning at the time you had this experience?

I don't mean to slam ext2, sorry if it sounded like that, I just don't 
think that being unwilling to run fsck after bad blocks occur is a 
reasonable complaint about our design.

Unfortunately, fsck programs take a long time to mature, and ext2's fsck 
is more mature than ours.  It is important that users use the latest fsck.

With reiser4 we have built into the node format a number of features 
that will make reiser4 fsck more effective than reiser3.


-- 
Hans


