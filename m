From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: A Word of Warning about Linux Software Raid
Date: Fri, 11 Aug 2006 21:34:50 +0200
Message-ID: <20060811213450.cf67e32e.reiser4@blinkenlights.ch>
References: <1155319786.8121.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1155319786.8121.43.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> Eventually the problem was diagnosed to be caused by the data on the two
> mirrored disks not being identical.

I guess you didn't disable the write-cache of your Harddrives?
With write-cache enabled (/ no USV) it's somewhat unfair to
blaime 'md'..


> It seems that the kernel does not check the integrity of the data on mirrored raid,

It does if you tell the kernel to do so:

# echo check > /sys/block/md0/md/sync_action 

Quote from 'Documentation/md.txt'
>       check         - A full check of redundancy was requested and is
>                       happening.  This reads all block and checks
>                       them. A repair may also happen for some raid
>                       levels.



Regards,
 Adrian



-- 
            A. Top posters
            Q. What's the most annoying thing on Usenet?
