From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: r4 observations
Date: Thu, 21 Sep 2006 15:02:01 +0400
Message-ID: <200609211502.01497.vs@namesys.com>
References: <ees2cj$15h$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29958-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ees2cj$15h$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Wednesday 20 September 2006 22:47, Peter wrote:
> I booted from a non-reiser4 partition in order to make a backup of my main 
> / which was a r4 partition.
> 
> After the backup, I unmounted the drive explicitly, then rebooted.
> 
> I did not use the backed up drive for anything except tar-ring its files.
> 
> On next boot to the r4 / partition, all kinds of file not found errors
> occurred. I booted again to my non-r4 partition, and ran fsck.reiser4
> --check -y there were fatal errors on my r4 /.
> 
> The backup was fine. I downgraded back to reiserfs which does not exhibit
> this problem.
> 
> I have not experienced any problem with other r4 partitions. Just /.
> /home, /tmp, /src, etc. are fine.
> 
> Unfortunately, I don't have time to keep wondering where the problem is or
> why. Perhaps it's the kernel or the init scripts. Nonetheless, the
> instability of whatever the problem is is unnerving.
> 

Please provide information about which kernel and which reiser4 did you use.
Am I correct that you were trying to run gentoo on reiser4?
