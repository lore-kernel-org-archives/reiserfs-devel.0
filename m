From: Oleg Drokin <green@namesys.com>
Subject: Re: anyone port data-logging patches to -rc3?
Date: Fri, 23 May 2003 20:24:03 +0400
Message-ID: <20030523162403.GA9829@namesys.com>
References: <20030523003033.GC6586@zero> <20030523094633.GA1005@namesys.com> <20030523181504.34631d87.pgramoul@nerim.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030523181504.34631d87.pgramoul@nerim.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <pgramoul@nerim.net>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, May 23, 2003 at 06:15:04PM +0200, Philippe Gramoull? wrote:
>   | Ok, replacement patches are in
>   | ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/data-logging-and-quota-2.4.21-rc3/
>   | 
> Patches apply fine but i have compile errors after applying the quota patches for 2.4.21-rc3 starting after 07...
> Says: can't find files
> 
> <linux/dqblk_xfs.h>
> <linux/dqblk_v1.h>
> <linux/dqblk_v2.h>

Ah, stupid me.
I see.
Ok, then apply Chris' version of 07-... patch and then apply
07-quota_nospace_fix.diff.gz patch from our ftp that I just put there on top of it.

Bye,
    Oleg
