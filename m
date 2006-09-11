From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Mon, 11 Sep 2006 11:30:39 +0400
Message-ID: <200609111130.39647.vs@namesys.com>
References: <ee1gcu$dgb$1@sea.gmane.org> <45047190.2040101@slaphack.com> <ee1vth$dgb$2@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ee1vth$dgb$2@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Monday 11 September 2006 01:26, Peter wrote:
> On Sun, 10 Sep 2006 15:12:00 -0500, David Masover wrote:
> > Peter wrote:
> >> Using: gentoo
> >> kernel 2.6.17.11 with beyond patchset
> >> reiser patch 2.6.17-3
> >> reiser4progs 1.0.5
> >>
> >> At the end of the gentoo shutdown script is a short function which
> >> remounts / as ro.
> >
> > There's also one in the Gentoo startup script, which attempts to remount
> > / ro, then remount it rw.  I commented that out, because it was causing
> > similar problems.  I figure if it runs sync when it shuts down, that's
> > good enough.
>
> The errors I note only occur on shutdown (halt.sh) not startup. 

Sorry, I am confused. In the first mail you said:
"On reboot or after a poweroff, root does not mount properly, and after
some modules are loaded, there are segfaults when running init scripts."

This looks like  you have problems on startup. Would you, please, describe the 
sequence of operations which leads to the problem with more details.


> Do you 
> think it could be an IDE timing thing similar to what was described on
> another thread on this ml? What's interesting is that this problem is
> recent and I am trying to look back and see what system-level packages
> were updated recently (I just converted to the 2006.1 profile before this
> occured and that caused a lot of programs to recompile. A week earlier,
> it was gcc-4.1.1. I know base layout was updated recently). Maybe something
> in mount changed? The shutdown scripts look the same. Something is left
> unhinged somewhere. Glad I was not hallucinating! Thanks for confirming
> for me.
>
> > Still, it's an annoying problem, I think it's a kernel oops.  Namesys,
> > what kind of information would be helpful?
>
> Yes, it's annoying and disconcerting at the same time. If it was a kernel
> oop then, wouldn't it have shown itself earlier? I
