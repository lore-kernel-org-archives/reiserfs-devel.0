From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfs Data Recovery (SOLVED)
Date: Mon, 15 Mar 2004 19:32:41 +0300
Message-ID: <200403151932.41036.vitaly@namesys.com>
References: <404E8665.7090305@nsanity.com> <200403130001.57937.vitaly@namesys.com> <4055D064.1000604@nsanity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4055D064.1000604@nsanity.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Vahalik <nick@nsanity.com>
Cc: reiserfs-list@namesys.com

On Monday 15 March 2004 18:48, Nick Vahalik wrote:
> Alright, so apparently it was the hardware... I'm not quite sure how,
> exactly, but something appears to be up.  I borrowed a 200 G drive and
> just dd'ed /dev/sda to /dev/sdb, and then reiserfscked /dev/sdb1... it
> took a lot longer, but when It finished it got through pass 4 completely
> and  had finished.  It had 6430 leaves it couldn't place, so they were
> put in lost+found, and most (85%) of the files are completely intact,
> but some of the bigger ones (divx/iso) were pretty tore up.  I also have
> a couple of files that nautilus thinks are 1.5 exabytes, yes exabytes.

It is legal to have a file with the size greater then the real file 
body size. But if you do not want it, there is an option in reiserfsck 
--adjust-size that allows you to adjust the file size fo the real file 
body size.

> It still amazes me that even after both the drives completely passed the
> DFT, they are still acting strange.  Heh, silly Hitachi drives.
>
> Thanks for your time, guys.
>
> Nick Vahalik

-- 
Thanks,
Vitaly Fertman
