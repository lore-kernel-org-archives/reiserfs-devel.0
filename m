From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: can't find a reiserfs file ssytem! 3.b
Date: Thu, 18 Mar 2004 14:16:27 +0300
Message-ID: <200403181416.27564.vitaly@namesys.com>
References: <20040317145013.B6D3B3982E7@ws5-1.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17293-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317145013.B6D3B3982E7@ws5-1.us4.outblaze.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mite pascoff <ttl@linuxmail.org>
Cc: reiserfs-list@namesys.com

> > what do you see in the syslog related to this mount failure?
>
> This is what "says" syslog when I try to mount the 2GB image.file of the
> problem partition: 
> Mar 17 16:27:37 ttl kernel: reiserfs: checking transaction log (device 07:00) ... 
> Mar 17 16:27:37 ttl kernel: reiserfs: journal-837: IO error during journal replay 
> Mar 17 16:27:37 ttl kernel: Replay Failure, unable to mount 
> Mar 17 16:27:37 ttl kernel: reiserfs_read_super: unable to initialize journal space

it looks like some hardware problem (bad block, cable, etc) on the partition where 
you have this fat32.  reiserfsck just did not touch this block and evth was fine then.

please make the full copy first to a relable partition, to a block device itselt or to 
a regular file.

-- 
Thanks,
Vitaly Fertman
