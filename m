From: Hans Reiser <reiser@namesys.com>
Subject: Re: Improved performance by reformatting?
Date: Fri, 10 May 2002 05:35:11 +0400
Message-ID: <3CDB23CF.7050804@namesys.com>
References: <20020509234806.GA4635@jensbenecke.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10293-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jens Benecke <mail-020509@jensbenecke.de>
Cc: ReiserFS Mailingliste <reiserfs-list@namesys.com>

Jens Benecke wrote:

>Hi,
>
>recently I have begun to notice that my server (Duron 650, Via chipset,
>UDMA harddisks, hdparm says 30-35MB/sec on the raw device) have been
>slowing down during long copy actions. If I copy a 300MB file, e.g.
>midnight commander pauses frequently, sometimes over ten seconds, while
>the CPU Load (according to xosview) is stuck at 100%.
>
>DMA and so on is enabled on all harddisks.
>
>The file systems in question were created with early 2.4 kernels (2.4.4
>IIRC) and one of them is a LVM volume which was resized and moved
>several times until now. Would a backup & reformat & restore noticeably
>improve performance to make it worth the effort?
>
>I'm asking this because I will have the chance to do this shortly (new
>harddisks) and if it will make a difference, I will not just copy the
>stuff over, but recreate the FS.
>
>
>  
>
using tar rather than dd to copy things will improve performance.  The 
repacker is scheduled for v4.1....

