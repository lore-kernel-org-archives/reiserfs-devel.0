From: Pat Double <pat@patdouble.com>
Subject: Re: reiser4 performance
Date: Tue, 9 Aug 2005 21:49:51 -0500
Message-ID: <200508092149.51707.pat@patdouble.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <200508092119.13103.pat@patdouble.com> <42F96737.7050809@slaphack.com>
Reply-To: pat@patdouble.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F96737.7050809@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On Tuesday 09 August 2005 09:32 pm, David Masover wrote:
> Pat Double wrote:
> > Actually I did make it public, hit the wrong command on my mail client ;)
> >
> > I did not try the -mm kernel (latest patches is for -mm5 IIRC), I use
> > software suspend 2 and it does not apply to the 2.6.12.x-mm series.
> > Except for this problem reiser4 has worked great for me. Since I use a
> > single partition and '/' does not get modified much I copied all my data
> > over, rebuilt the filesystem, and then started using it. I have not
> > discovered any problems, and the filesystem is quite fast.
>
> That's with the mm reiser4, or the reiser4-for-2.6?
>
> Glad to hear it works with Suspend2.  That's going to be the next thing
> I try, once my system is back up to speed.  I'm on Gentoo, so
> understandably it takes awhile to get back up to speed, Godlike amd64
> speeds notwithstanding.

I used the reiser4-for-2.6 patches. Before the 2.6.12 patches were available I 
tried the -mm patches from reiser4-for-2.6 which applied cleanly. When 2.6.12 
recently I tried those with the same results. I did not try the -mm kernel 
sources because even if they worked flawlessly it would be no help to me. 
Suspend 2 is more important to me than reiser4. Shutdown in 30 seconds, 
startup in 30 seconds is more useful to me.

-- 
Pat Double, pat@patdouble.com
"In the beginning God created the heaven and the earth."
