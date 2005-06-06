From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: extract files without mounting a partition?
Date: Mon, 06 Jun 2005 12:34:55 +0400
Message-ID: <1118046894.3188.51.camel@tribesman.namesys.com>
References: <200506061130.38536.rdeepak@nmsworks.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506061130.38536.rdeepak@nmsworks.co.in>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: R Deepak <rdeepak@nmsworks.co.in>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2005-06-06 at 10:00, R Deepak wrote:
> Greets!
> 
> Can I ask support questions here? If not, sorry.. :(
> 
> I have a RAID0 config with 2 80GB SATA disks. I screwed up during an install 
> and the super block got overwritten. 
> 
> When I ran reiserfsck on /dev/md0, it asked me to use --rebuild-sb Which I 
> did. It reported quite a few errors and moved lots of files to lost+found.
> 
> Now the problem is that I am not able to mount this partition. I've tried 
> with different kernels, gentoo 2005.0 live CD (amd64), knoppix (32bit), and 
> an old gentoo 2004.1 (x86) live CD. 
> 
> As soon as I try to mount it, I get something like the following
> 
> ReiserFS: md0: found reiserfs format "3.6" with standard journal 
> <kernel panic>

There should be more than that. Can you please show all kernel logs
related to the problem.

> ---------
> 
> Whole system freezes.
> 
> reiserfsck (latest reiserfsprogs) reports no errors with the device. I'm 
> just not able to mount it.
> 
> What should I do? I atleast need to pull important files out..
> 
> Regards
> Deepak
> 

