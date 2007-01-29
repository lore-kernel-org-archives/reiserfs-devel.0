From: John Gilmore <jgilmore@warpdriveonline.com>
Subject: Re: Reiser4 terribly slow
Date: Sun, 28 Jan 2007 18:01:55 -0700
Message-ID: <200701281801.56634.jgilmore@warpdriveonline.com>
References: <6ec7a4340701240605x43297e01xdee68fb7f1d69746@mail.gmail.com> <200701241942.l0OJgFGM021169@turing-police.cc.vt.edu> <6ec7a4340701241657o6e160e33ue221abf3c318a7a5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6ec7a4340701241657o6e160e33ue221abf3c318a7a5@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I agree, reiser4 has been very slow for me, and as I've upgraded the kernel, 
it's gotten, if anything, worse. 

I'm currently running 2.6.18-mm3. I upgraded (as I have before) in the hope 
that the "generally very slow" issue had been fixed in this kernel release, 
and if I knew that it was fixed in the latest mm, I would upgrade in a 
heartbeat.

I'd like to see this fixed, as it's the only real issue that I have. Is this 
something that can be fixed in a reasonable time, or am I SOL and it's time 
to switch back to ext3? Have money problems/Han's arrest stopped development?

I would think with a 1Ghz K7, I would have a fast enough processor.... But I 
don't. Read/write maxes processor usage. I have a regularly scheduled backup 
that rsyncs with a ext3 disk on the same machine. It slows the machine to a 
standstill, processor time is 90%+ system. And that's just reading. Forget 
burning a CD/DVD in a reasonable time. Although now that I have 1Gig of 
memory inseat of the 128Mb that I had before, I can CACHE the CD image and 
write it out in a reasonable timeframe. But accessing the disk is SLOW.

I disabled fsync in the kernel, and that helped some, but not that much.

I've had Reiser4 as my root file system for a number of years now, but I've 
just about given up. I lust after the advanced features, encryption and 
change logging in particular, but without a reasonably fast filesystem, I 
don't see the point.


On Wednesday 24 January 2007 17:57, Xu CanHao wrote:
> AFAIK, vim fsyncs, azureus fsyncs, and may be many other applications
> fsyncs but not only databases.
>
> Definitly turn off fsync() is a bad idea. I just wonder how bad r4's
> fsync() performance is.
>
> It seems the result is: "disabled fsync() r4" is even slower than
> "enabled fsync() ext3.o"
>
> Is it never be possible to improve that? I found in the mailing-list
> that Hans talked it for many years. this must be a CRITICAL
> performance flaw for r4.
>
> 2007/1/25, Valdis.Kletnieks@vt.edu <Valdis.Kletnieks@vt.edu>:
> > On Wed, 24 Jan 2007 22:05:53 +0800, Xu CanHao said:
> > > extremely low performance, i managed to turn off fsync() in
> > > fs/reiser4/plugin/file/file.c (nullify the sync_unix_file() function),
> >
> > (Maybe you understand the following, if so, feel free to ignore.  I'm
> > mostly making sure the list archives have this note so anybody else
> > tempted to do this will think twice)...
> >
> > Note that this can be *very* dangerous to the health of your database
> > if you implement it blindly without understanding the *full*
> > implications.
> >
> > Basically, applications almost never call fsync() unless they need it for
> > database consistency.  A system crash at an inopportune time *will*
> > totally ruin your database.
