From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4
Date: Mon, 22 Dec 2003 17:02:07 +0300
Message-ID: <200312221702.07705.vitaly@namesys.com>
References: <200312212203.52775.janfengler@web.de> <200312221523.26888.vitaly@namesys.com> <3FE6F7DD.7000503@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FE6F7DD.7000503@libero.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@libero.it>, reiserfs-list@namesys.com

On Monday 22 December 2003 16:55, Domenico Andreoli wrote:
> hi Vitaly,

hello, 

> Vitaly Fertman wrote:
> > It seems this bug was already fixed, we have not released
> > another reiser4progs snapshot yet, so you can wait a bit for
> > the coming release or you can get the code from our bk
> > repositories:
> >
> > bk clone bk://bk.namesys.com/bk/libaal
> > bk clone bk://bk.namesys.com/bk/reiser4progs
>
> i just checked out reiser4progs but i had some problems building it :(

you need the latest libaal to be installed first.
bk clone bk://bk.namesys.com/bk/libaal
prepare
configure
make 
make install
ldconfig

Then you can build the reiser4progs.

-- 
Thanks,
Vitaly Fertman
