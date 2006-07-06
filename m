From: Joe Feise <jfeise@feise.com>
Subject: Re: Reiser4 cowardly panic 2.6.17-mm5
Date: Thu, 06 Jul 2006 10:18:09 -0700
Message-ID: <20060706171809.4602.qmail@pv105234.reshsg.uci.edu>
References: <44A6FA33.1000305@feise.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44A6FA33.1000305@feise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

This seems to be fixed with 2.6.17-mm6. 

 -Joe 

Joe Feise writes: 

> I consistently get cowardly panic errors during bootup with 2.6.17-mm5 (I also
> had that with -mm3, and had hoped -mm5 would have fixed it.)
> It corrupts the partition this is happening on (/var)
> I don't have dmesg or syslog output, though, since this happens during bootup,
> and /var gets corrupted... 
> 
> -Joe 
> 
