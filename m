From: Pat Double <pat@patdouble.com>
Subject: Re: reiser4 performance
Date: Tue, 9 Aug 2005 20:51:07 -0500
Message-ID: <200508092051.07712.pat@patdouble.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <e692861c05080819035e028642@mail.gmail.com> <42F95994.7060705@slaphack.com>
Reply-To: pat@patdouble.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F95994.7060705@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Forgive me for moving to private, but I've posted this on the list before 
without comment.

The 2.6.12.x patches and 2.6.12.x applied from -mm have incorrect behavior 
when modifying the root directory. If you add or remove files in the root, 
the filesystem check fails. You can try this on a ram disk or loop file 
system. I'd be interested to see if you'd try it and let me know if you get a 
failed filesystem check. I am able to repair without data loss.

On Tuesday 09 August 2005 08:34 pm, David Masover wrote:
> Gregory Maxwell wrote:
> > On 8/8/05, David Masover <ninja@slaphack.com> wrote:
>
> [...]
>
> > My ability to use it is severely hampered only being able to use it on
> > boxes running test-kernel of the day.. which are laden with other
> > issues unrelated to reiser4 that I don't have time to deal with.
>
> How recent a Reiser4 do you need?  There are some patches against the
> vanilla kernel at
>
> http://namesys.com/pub/reiser4-for-2.6/
>
> But those seem out of date and don't work for me.  But, the patches from
> the mm-kernel have been rock-solid for me.  I'm taking the vanilla
> 2.6.12.3 kernel and patching it with the Reiser4 patches from
> 2.6.12-mm2.  Unpack this:
>
> http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.12/2.6.12-mm
>2/2.6.12-mm2-broken-out.tar.bz2
>
> to /usr/src/ and run this:
>
> #!/bin/sh
> # hack to bring mm reiser4 back to vanilla
> cd /usr/src/linux
> for i in `grep reiser4 ../broken-out/series`; do
> 	patch -p1 < ../broken-out/$i;
> done
>
> I've attached one patch of my own that makes it compile properly --
> apply after you run the script above.

-- 
Pat Double, pat@patdouble.com
"In the beginning God created the heaven and the earth."
