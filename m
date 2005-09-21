From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: Reiser4 on CentOS 4.1
Date: Tue, 20 Sep 2005 22:48:15 -0500
Message-ID: <1127274495.10856.10.camel@gentoo>
References: <4330D3E2.4020908@sourcelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4330D3E2.4020908@sourcelabs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Jacobson <steve@sourcelabs.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

reiser4 is a completely different filesystem. reiserfsprogs will not
work. Use reiser4progs from ftp://ftp.namesys.com/pub/reiser4progs/.
You'll need to install libaal first.

You shouldn't be using insmod. Use modprobe instead. A clean rebuild of
your kernel might fix the symbol error.

On Tue, 2005-09-20 at 20:30 -0700, Steve Jacobson wrote:
> All,
> 
> I've compiled a new version of the 2.6.9-11.EL kernel for reiser 4 
> support.  I applied the reiser4 patch, and rebuilt the kernel with it as 
> a module.  I've installed the resultant kernel, and everything seems 
> fine with it, in general.  I downloaded and compiled the reiser tools - 
> reiserfsprogs-3.6.19 as I couldn't find a reiser4 specific set.  I can 
> create a reiser file system running mkreiserfs with no problem.  When I 
> go to mount it, with 'mount -t reiser4 /dev/sda4 /data' I get 'mount: fs 
> type reiser4 not supported by kernel'.  Same with type reiserfs.  lsmod 
> doesn't show it installed, so I try to insmod the module: 'insmod 
> reiser4.ko'  I get :
> 
> insmod: error inserting 'reiser4.ko': -1 Unknown symbol in module
> 
> 
> I'm running (and building on) CentOS 4.1, new install with not much on it.
> 
> any thoughts or direction?
> 
> Thanks!
> 
> -steve j
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

