From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: labelling partitions with reiserfstune
Date: Mon, 16 Dec 2002 21:35:20 +0300
Message-ID: <200212162135.20414.vitaly@namesys.com>
References: <3DFDD5B5.7050000@dsvr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DFDD5B5.7050000@dsvr.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Burrett <nick@dsvr.net>, reiserfs-list@namesys.com


Hi, 

On Monday 16 December 2002 16:31, Nick Burrett wrote:
> Hi,
>
> It would be useful if the disk label of a mounted partition could be
> changed by reiserfstune.  Since I'm only after changing the label and

will be done someday. probably in reiser4 already.

> not the journal, the following assertion seems unreasonable.
>
> bash-2.05# reiserfstune -l / /dev/rd/c0d0p1
>
> <-------------reiserfstune, 2002------------->
> reiserfsprogs 3.6.4
>
> reiserfstune: can not rebuild journal of mounted filesystem

Oh, yes, thank you. 

-- 

Thanks,
Vitaly Fertman
