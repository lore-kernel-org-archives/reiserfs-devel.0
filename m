From: Chris Worley <chrisw@lnxi.com>
Subject: Re: 2GB limit won't go away
Date: Sun, 9 Jun 2002 18:52:25 +0000 (UTC)
Message-ID: <1023754048.4654.1821.camel@xserver>
References: <1023708533.4654.301.camel@xserver> 
	<200206091608.g59G8ISI021286@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200206091608.g59G8ISI021286@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm using glibc-2.2.4-21; would that be the problem?

My ulimits:

#  ulimit -a
core file size (blocks)     0
data seg size (kbytes)      unlimited
file size (blocks)          unlimited
max locked memory (kbytes)  unlimited
max memory size (kbytes)    unlimited
open files                  1024
pipe size (512 bytes)       8
stack size (kbytes)         unlimited
cpu time (seconds)          unlimited
max user processes          8192
virtual memory (kbytes)     unlimited

Thanks,

Chris

On Sun, 2002-06-09 at 10:08, Valdis.Kletnieks@vt.edu wrote:
> On Mon, 10 Jun 2002 05:28:53 MDT, Chris Worley <chrisw@lnxi.com>  said:
> 
> > But,  I can't create a file greater than 2GB.
> 
> Two quick guesses:
> 
> 1) Old/busticated/crufty libc that doesn't have large-file support
> 1a) other userspace tools that don't have it (dd, cat, etc)
> 
> 2) a 'ulimit -f' value for max filesize.
> -- 
> 				Valdis Kletnieks
> 				Computer Systems Senior Engineer
> 				Virginia Tech
> 


