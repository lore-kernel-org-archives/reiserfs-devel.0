From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiserfs using too much space on my HD
Date: Fri, 28 Oct 2005 12:29:40 -0500
Message-ID: <1130520580.10015.7.camel@gentoo>
References: <f18a8d980510261002w303b4180le69b63667cee31ce@mail.gmail.com>
	 <4360A5A4.6030809@namesys.com>
	 <f18a8d980510270949r2b74fa62jd7dccd2cc5e83fba@mail.gmail.com>
	 <f18a8d980510281019s4156fd08nac134d1e445152c3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26695-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d980510281019s4156fd08nac134d1e445152c3@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bedros Hanounik <2bedros@gmail.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

p will preserve permissions, but I'd add l to avoid traversing the
virtual proc and sys filesystems. You'll also need a minimal set of
device nodes. I find it easiest to tar up my current /dev (p is all you
need here too) rather than making only the devices needed before udev
starts.

On Fri, 2005-10-28 at 10:19 -0700, Bedros Hanounik wrote:
> Vlad,
> 
> fsck.reiserfs version is  3.6.19; when I run it, it reports no
> corruption errors found at the end; or something like that.
> 
> I'll tar the whole partition to an external drive, then format it and
> untar it again.
> 
> Anyone knows if "tar cvjpf file /" is suffecient to keep all
> permisions etc. (including for system directories such as /proc /dev)
> and restoring exactly as it was before format?
> 
> Thanks,
> 
> -B
> 
> 
> 
> On 10/27/05, Bedros Hanounik <2bedros@gmail.com> wrote:
>         
>         "du -shx" reports 9.5GB
>         
>         I'm running latest from gentoo, so I assume it's 3.6.19. 
>         
>         I ran fsck.reiserfs from gentoo liveCD 2005.1 and at the end I
>         got zero errors.
>         
>         The problem could be fixed, I could tar the whole root
>         directory to an external drive, format the partition and then
>         tar it back. but I'm not sure what's going on?
>         
>         I'll post all logs on this list tomorrow.
>         
>         -Bedros
>         
>         
>         
>         On 10/27/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
>                 Hello
>                 
>                 Bedros Hanounik wrote:
>                 > Hi,
>                 >
>                 > I've been using reiserfs for several years now and
>                 it's been choice
>                 > number one for me; I'll probably switch to reiser4
>                 once it's in the main
>                 > kernel. 
>                 >
>                 > on my home file server machine, one hard drive
>                 (120GB) reports 80 GB
>                 > used, but I have no idea how and where it's used.
>                 >
>                 > df -h reports 80GB used
>                 >
>                 
>                 what does du -s / report? 
>                 
>                 > but when I run kdirstat, I get about 10GB used for
>                 directory /.
>                 >
>                 > I ran fsck.reiserfs from liveCD and it reported no
>                 errors.
>                 >
>                 
>                 is it reiserfsck 3.6.19?
>                 Please send output of reiserfsck 3.6.19.
>                 
>                 > is there any better way to tell what's eating up my
>                 hard drive?
>                 >
>                 > Regards,
>                 >
>                 > -Bedros
>                 >
>                 >
>                 
>         
>         
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

