From: Sander <sander@humilis.net>
Subject: Re: Partition full after deleting a large file
Date: Fri, 2 Feb 2007 09:35:34 +0100
Message-ID: <20070202083533.GA27851@cumulus>
References: <eptjl6$dd5$1@sea.gmane.org>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30517-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <eptjl6$dd5$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcus Better <marcus@better.se>
Cc: reiserfs-list@namesys.com

Marcus Better wrote (ao):
> a buggy mail client (kmail) filled up my 4 Gb /home partition by filling
> the .xsession-errors with several gigabytes of the same error message. I
> removed the file, which was well over 2 Gb. But "df" still shows zero free
> space, and I cannot create new files.

The .xsession-errors file is still open, and therefor not deleted from
disk (although you can't see it anymore). It will be deleted as soon as
you exit X. The same goes for logfiles.

Next time you can empty the file with: echo -n > .xsession-errors

> The /home partition is on a dmcrypt volume on LVM. The system is a Thinkpad
> R60 (Core 2 Duo) running Debian unstable with custom kernel 2.6.20-rc6
> (from the wireless-dev tree).
> 
> Here is some debug info:
> ~# df /home/
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/mapper/home       4193596   4193596         0 100% /home

I think you should get your space back if you exit X.

	With kind regards, Sander

-- 
Humilis IT Services and Solutions
http://www.humilis.net
