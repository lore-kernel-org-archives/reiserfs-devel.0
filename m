From: Sander <sander@humilis.net>
Subject: Re: Reiser4 slowdown gone
Date: Mon, 30 Jan 2006 10:54:51 +0100
Message-ID: <20060130095451.GB1677@favonius>
References: <20060129144533.128af741.akpm@osdl.org> <20060130072529.GA1677@favonius> <43DDCD4D.4030808@feise.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27933-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43DDCD4D.4030808@feise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Feise <jfeise@feise.com>
Cc: sander@humilis.net, Andrew Morton <akpm@osdl.org>, reiserfs-list@namesys.com

Joe Feise wrote (ao):
> Sander wrote on 01/29/06 23:25:
> > Andrew Morton wrote (ao):
> >> ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.16-rc1/2.6.16-rc1-mm4/
> > 
> >> +reiser4-big-update-bug-fix-for-readpage-fix.patch
> >> +reiser4-warnings-cleanup.patch
> >> +reiser4-do-not-use-get_user_pages-and-do-not-check.patch
> >>
> >>  reiser4 fixes and cleanups
> > 
> > Jumping from 2.6.15-rc1-mm1 to 2.6.16-rc1-mm4.
> > 
> > For me the Reiser4 slowdown[1] reported on the Reiserfs mailinglist are
> > gone with this kernel.
> > 
> > [1] http://humilis.net/reiser4slowdown.html
> 
> 
> FWIW, I just ran these tests on 2.6.16-rc1-mm3:
> kernel: 2.6.16-rc1-mm3
> OS: Slackware 10.2 x86
> Compiler: gcc (GCC) 3.3.6
> Disk: SCSI on Adaptec 29160
> single disk, no raid/lvm/etc.
> # for i in `seq 4`; do echo "foo" > test && time vim +"s/foo/bar/" +"wq" test &>
>  /dev/null ; done
> 
> real    0m2.637s
> user    0m0.032s
> sys     0m0.040s
> 
> real    0m2.139s
> user    0m0.016s
> sys     0m0.008s
> 
> real    0m2.137s
> user    0m0.020s
> sys     0m0.016s
> 
> real    0m2.137s
> user    0m0.020s
> sys     0m0.008s
> 
> # strace -T -e sync,fsync ./reiser4-fsync
> sync()                                  = 0 <2.308290>
> fsync(3)                                = 0 <0.071363>

So maybe it was gone already :-)

For some reason, it didn't hit everybody though, but it can very well be
that it was fixed already.

Btw, in my previous mail I forgot a big THANKS to all involved.

	Kind regards, Sander

-- 
Humilis IT Services and Solutions
http://www.humilis.net
