From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4
Date: Mon, 22 Dec 2003 22:19:50 +0300
Message-ID: <200312222219.50179.vitaly@namesys.com>
References: <200312212203.52775.janfengler@web.de> <200312221702.07705.vitaly@namesys.com> <3FE73020.6060000@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16384-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FE73020.6060000@libero.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@libero.it>, flx@msu.ru
Cc: reiserfs-list@namesys.com

On Monday 22 December 2003 20:55, Domenico Andreoli wrote:
> Vitaly Fertman wrote:
> > you need the latest libaal to be installed first.
> > bk clone bk://bk.namesys.com/bk/libaal
> > prepare
> > configure
> > make
> > make install
> > ldconfig
>
> i've already done this, i have installed libaal 0.4.15

oh, it is still reiser4progs 0.4.16 there, it should be 0.4.20.
It seems that our public reiser4progs repository does not 
get updated for a long time. Flx, would you fix it?

-- 
Thanks,
Vitaly Fertman
