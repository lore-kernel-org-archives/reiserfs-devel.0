From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Marking bad blocks
Date: Sun, 20 Jul 2003 14:39:05 +0400
Message-ID: <200307201439.05189.vitaly@namesys.com>
References: <20030720033004.GA6519@free.transpect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14970-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030720033004.GA6519@free.transpect.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Whit Blauvelt <whit@transpect.com>, reiserfs-list@namesys.com


Hi, 

On Sunday 20 July 2003 07:30, Whit Blauvelt wrote:
> Hi,
>
> I'm trying to use the add-bad-blocks.c script provided on the site, but
> with both gcc 2.95.3 and 3.2.2 I get:

this is strange -- I have no problem with gcc 3.3 and 2.96.  

> "undefinded reference to `concat'"

it seems to be a problem with your gcc.

> when I try to do "gcc add-bad-blocks.c".
>
> Is there something else I need to do to compile it successfully? Or is it
> just bad code? Why isn't whatever the necessary step is spelled out on the
> site?
>
> And, the instruction page only mentions patches to old versions of the
> kernel. Is the patch to support this now standard in the Reiserfs of kernel
> 2.4.21?

Only those patches are available, actually bad block handling support is 
going to be included into reiserfsprogs soon (likely into the next release).

> I like Reiserfs a lot, and use it extensively, but for the second time I'm
> having serious trouble because of its lack of bad block handling. The
> Website is full of posturing about "If you have a problem, it's probably
> your hardware, not a real bug." Fine, this is hardware. The first time
> around a drive problem totally trashed a system. Now it looks like the
> Reiser code is better (in 2.4.21 it doesn't crash the system as it does on
> the same drive with 2.4.19 - looks like something was improved either in
> Reiser or general file system support in the kernel). But an out of date
> page on handling bad blocks with a utility that doesn't compile doesn't
> evidence thorough care.
>
> Thanks for any advice on how to actually take care of this problem short of
> throwing out a drive (or going to another file system) just because a
> couple of blocks are bad.
>
> Whit

Have you tried to dd into these bad blocks? This command can make the 
harddrive to move bad blocks into internal harddrive bad block list (remap 
them). If it fails that means that bad block list is full and you have a lot of 
bad blocks on your harddrive and it is strongly recommended to change the 
harddrive ASAP - you will get more of them soon.

-- 
Thanks,
Vitaly Fertman
