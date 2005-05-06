From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser4 support on parted ...
Date: Fri, 6 May 2005 23:19:41 +0400
Message-ID: <200505062319.41991.vitaly@namesys.com>
References: <427A0834.7080201@futuretg.com> <427AFB43.7090406@namesys.com> <427B3978.8030100@futuretg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <427B3978.8030100@futuretg.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Andrew Clausen <clausen@gnu.org>

On Friday 06 May 2005 13:31, Dr. Giovanni A. Orlando wrote:
> Hans Reiser wrote:
> 
> >I think someone is going to pay us to write the online repacker in the
> >very near future, though I can't say their name.
> >
> >Giovanni, if by parted support you mean that you are going to write a
> >resizer (and now that I take a moment to remember what parted does it
> >seems certain you do mean that), I wish you would not.  We are so
> >amazing far in debt right now....
> >  
> >
> Hi,
> 
>     It is important to fix some points to clarify.
> 
>     At first, "parted" is a binary that interact with the "libparted" 
> library to run
>     some features about partitions, like:
>        * mkfs
>        * fsck
>        * cp
>        * mv
>        * resize
>        * and others.
> 
>     Actually, parted have zero support for Reiser4.
> 
>     Why we need Reiser4 support inside parted?
> 
>     We need that parted support Reiser4, because our installer actualy a 
> hacked version of RedHat anaconda
>     uses pyparted that need parted to create the partitions on the FS on 
> a new installation.
>     (Therefore also RH people and Linux distro that uses anaconda, like 
> YellowDog will benefit for this code).
> 
>     Therefore, we don't need to resize Reiser4 partitions actually.
> 
>     The necessary code is not necessarely complicated, because libraries 
> are well written.
>     However, I need to understant how Reiser4 do jobs like fsck and mkfs 
> and this code

they are wrappers to libreiser4 & librepair. also have a look at 
reiser4progs/demos/busy (it is able to create file on reiser4, 
copy them to/from, rm, stat, truncate, etc) which is the wrapper 
to libreiser4 too.

>     cannot be a simple or equivalent (system("mkfs.reiser4")).
> 
>     It is necessary to use the parted API to do that.
> 
>     FTOSX 2004 includes "reiser4" packages, including "libaal", from Sep 
> 2004.
>     (Check ftp://ftp.futuretg.com/pub/FTOSX/FTOSX_Desktop_2004/i386/SRPMS)
> 
>     I create some directories, one for parted 1.6.15 (my hacked version) 
> and another for (1.6.22), latest one.
> 
>     People that want to know more about the internal of this code, can 
> browse:
>        
> ftp://ftp.futuretg.com/pub/Projects/parted+Reiser4/Actual_without_support/parted-1.6.15/doc/TUTORIAL
> 
>     I need to update around 111 chapters in six courses, and therefore I 
> will dedicate only 1/2 hours per day to move on
>     on this matter.
> 
> Thanks,
> Giovanni.
> 
> 
> 
> -- 
> 
> 
> -- 
> -- 
> 
> Check FT Websites ... http://www.futuretg.com  - ftp://ftp.futuretg.com
> http://www.FTLinuxCourse.com
>     http://www.FTLinuxCourse.com/Certification
> http://www.RPMParadaise.org
> http://www.YourPersonalOperatingSystem.com
> 
> Mobile: +39 393 665 4239
> 	Lancelot is back!

-- 
Thanks,
Vitaly Fertman
