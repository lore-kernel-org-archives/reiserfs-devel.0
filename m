From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 performance
Date: Tue, 09 Aug 2005 21:32:23 -0500
Message-ID: <42F96737.7050809@slaphack.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <200508092051.07712.pat@patdouble.com> <42F96238.1000502@slaphack.com> <200508092119.13103.pat@patdouble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25381-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508092119.13103.pat@patdouble.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pat@patdouble.com
Cc: reiserfs-list@namesys.com

Pat Double wrote:
> Actually I did make it public, hit the wrong command on my mail client ;)
> 
> I did not try the -mm kernel (latest patches is for -mm5 IIRC), I use software 
> suspend 2 and it does not apply to the 2.6.12.x-mm series. Except for this 
> problem reiser4 has worked great for me. Since I use a single partition and 
> '/' does not get modified much I copied all my data over, rebuilt the 
> filesystem, and then started using it. I have not discovered any problems, 
> and the filesystem is quite fast.

That's with the mm reiser4, or the reiser4-for-2.6?

Glad to hear it works with Suspend2.  That's going to be the next thing 
I try, once my system is back up to speed.  I'm on Gentoo, so 
understandably it takes awhile to get back up to speed, Godlike amd64 
speeds notwithstanding.
